# PRD: AthenaFarm — Digital Farm Event Engine

> 本文件依《AthenaFarm Simulator PRD v0.1》調整專案方向：從「單純收 Sensor Data 的監控 Dashboard」轉型為 **Event Engine 驅動的 Digital Farm**，最終目標是作為**產銷履歷（Traceability）與 ESG 平台**的基礎。

## 1. 產品願景

建立一個可模擬真實農業環境的 Digital Farm，使開發者可以在沒有實際農場的情況下：

- 驗證 Farm Event Model
- 測試 Rule Engine
- 開發 AI 農業決策
- 驗證產銷履歷資料流程
- 驗證 ESG Carbon Calculation

**核心理念：不模擬 Sensor，而是模擬農場行為。**

## 2. 問題陳述

### 2.1 缺乏測試環境

真實農場取得困難、變化慢、不容易重現問題。想測試高溫、高濕、CO₂ 累積、灌溉失敗等情境，只能等待自然環境發生。

### 2.2 Sensor Data 不等於農業知識

傳統 IoT 架構（Sensor → Database → Dashboard）只能看到 `Temperature = 32°C`、`CO2 = 1500ppm`，但無法回答：

- 發生了什麼**農業事件**？
- 為什麼需要處理？
- 處理結果如何？

產銷履歷與 ESG 需要的是「事件與行為紀錄」，不是原始數據點。

## 3. 產品目標

建立完整資料管線：

```
Scenario → Environment Model → Telemetry → Device Action → Farm Event → Farm Timeline
                                                                              ↓
                                                            Dashboard / QR / AI / ESG
```

## 4. 系統架構

```
              Scenario
                 |
          Farm Simulator
                 |
          MQTT Broker
                 |
       AthenaFarm Platform
                 |
        +----------------+
        |  Event Engine  |
        +----------------+
                 |
          Farm Timeline
                 |
     Dashboard / QR / AI / ESG
```

> **POC 註記**：目前版本以單一 HTML 靜態頁在瀏覽器內實作整條管線（in-page message bus 模擬 MQTT topic 契約），可直接部署 GitHub Pages Demo；MQTT Broker 與後端平台為下一階段整合目標，Topic 與 Payload 契約見 §8。

## 5. 核心 Domain Model

| 概念 | 說明 | 範例 |
|------|------|------|
| **Scenario** | 描述「今天農場發生什麼」 | Hot Day、Pump Failure |
| **Environment Model** | 模擬環境隨時間變化 | 06:00 24°C → 12:00 36°C |
| **Telemetry** | 模擬 Sensor Output | `{"time":"08:00","temp":30,"humi":75,"co2":1200}` |
| **Device State** | 模擬設備狀態 | `{"fan":"ON","pump":"OFF"}` |
| **Farm Event** | 系統主要產物 | Ventilation Started / Reason: CO2 High / 08:10–08:25 |
| **Farm Timeline** | 事件時間軸，履歷與 ESG 的資料來源 | 完整 Farm Story |

## 6. Scenario 設計

Scenario 使用 YAML 描述（POC 於 UI「Scenario YAML」分頁呈現對應定義）：

```yaml
name: morning_co2
time:
  start: "06:00"
  end: "12:00"
environment:
  keyframes:
    co2:
      - { time: "06:00", value: 820 }
      - { time: "08:30", value: 1680 }
faults:
  # none
expected_events:
  - ventilation
```

### 內建 Scenario（POC）

| # | Scenario | 流程 | Expected Events |
|---|----------|------|-----------------|
| 1 | 早晨 CO₂ 累積 | Morning → CO₂ Rising → Fan ON → CO₂ Recovery → Fan OFF | ventilation |
| 2 | 乾旱灌溉 | Soil Moisture Low → Pump ON → Water Flow → Moisture Recovery | irrigation |
| 3 | 泵浦故障 | Pump ON → No Water Flow → Generate Alarm | irrigation, pump_failure |
| 4 | 感測器離線 | Sensor Data Missing → Detect Abnormality → Generate Device Event | sensor_offline |

## 7. Event Engine 規則（POC）

| 規則 | 觸發條件 | 動作 | 結束條件 |
|------|----------|------|----------|
| Ventilation | CO₂ > 1500 ppm | Fan ON + 開立通風事件 | CO₂ < 950 ppm → Fan OFF、事件完成 |
| Irrigation | 土壤濕度 < 30% | Pump ON + 開立灌溉事件 | 土壤濕度 > 45% → Pump OFF、記錄用水量 |
| Pump Failure | Pump ON ≥ 6 分鐘且無水流 | 產生 Alarm、停用泵浦 | —（需人工處理） |
| Sensor Failure | 連續 5 分鐘無 Telemetry | 產生 Sensor Offline 設備事件 | 資料恢復 → 事件完成 |
| High Temp | 氣溫 > 34°C | 高溫警報 | 氣溫 < 32°C（遲滯） |
| Soil Critical | 土壤濕度 < 22% | 低土壤濕度告警 | — |

## 8. MQTT Interface（整合契約）

Simulator 作為 MQTT Publisher：

| Topic | 用途 | Payload 範例 |
|-------|------|--------------|
| `athena/farm01/telemetry` | 感測數據 | `{"device":"air01","temp":32,"humi":80,"co2":1600}` |
| `athena/farm01/device` | 設備狀態變更 | `{"fan":"ON"}` |
| `athena/farm01/event` | Farm Event | `{"event":"ventilation","status":"started","reason":"..."}` |

## 9. Event Validation

每個 Scenario 定義 `expected_events`，重播結束後比對 **Actual Event vs Expected Event**，給出 PASS / FAIL。

用途：**Event Regression Test** — 新增或修改規則後重播全部 Scenario，確保事件產出不回歸。未來整合 GitHub Actions：Scenario Test → Run Simulator → Generate Event → Compare Result → PASS/FAIL。

## 10. 產銷履歷（Traceability）

Farm Event 自動轉為履歷紀錄：

- **批次資訊**：批號、作物、場域、定植日
- **Farm Story**：灌溉（時長、用水量）、通風、異常處置，每筆紀錄附事件起訖與原因，來源標記 `Event Engine`（可稽核）
- **消費者溯源 QR**：掃碼查看批次完整農場故事

價值：履歷不再靠人工填寫，而是由事件引擎自動生成、有據可查。

## 11. ESG 碳盤查

由設備事件推算，而非人工估計：

- **用電**：設備運轉時間（來自事件起訖）× 額定功率
- **碳排**：用電 × 電力排碳係數（POC 採 0.494 kgCO₂e/kWh 示意）
- **用水**：灌溉事件時長 × 泵浦流量
- **可稽核性**：每筆排放對應具體 Farm Event

## 12. Dashboard（POC 頁面）

| 分頁 | 內容 |
|------|------|
| 即時監控 | 環境（溫度/濕度/CO₂/光照/土壤濕度）、設備狀態（Fan/Pump + 運轉時間）、環境趨勢圖、MQTT 訊息流 |
| 事件時間軸 | Farm Event Timeline（事件、原因、起訖、時長）+ Event Validation（PASS/FAIL） |
| 產銷履歷 | 批次卡、Farm Story 履歷表、溯源 QR |
| ESG 碳盤查 | 用電/碳排/用水/佐證事件數、設備排放明細 |
| Scenario YAML | 當前 Scenario 的 YAML 定義 |

操作：Scenario 切換、播放/暫停/重播、速度調整（1×/2×/6×）。

## 13. Non-Goals（POC 不包含）

- 真正作物生長模型
- AI 訓練模型
- 複雜氣象模型
- 商業農場管理功能
- 真實 MQTT Broker 與後端持久化（下一階段）

## 14. Roadmap

| Phase | 內容 | 狀態 |
|-------|------|------|
| 1. Basic Simulator | YAML Scenario、Telemetry 生成、Environment Model、Event Engine、Timeline | ✅ 本版（in-browser） |
| 2. Device Interaction | 真實 MQTT Broker、Fan/Pump relay feedback、後端 Event Store | 規劃中 |
| 3. Crop Model | 作物生長、病害風險、氣象 | 規劃中 |
| 4. Digital Twin | Farm state、Historical replay、Prediction | 規劃中 |
| 5. Traceability / ESG 平台 | 履歷簽章與上鏈、ESG 報告匯出、多農場多批次 | 目標 |

## 15. 成功條件

**Technical**
- ✅ Scenario 可重播
- ✅ Telemetry 可生成
- ✅ Event Engine 可解析
- ✅ Timeline 可建立

**Product**
- ✅ 不需要真實農場即可 Demo
- ✅ 可展示完整 Farm Story
- ✅ 可支援 Traceability / ESG 後續開發

## 16. 產品原則

AthenaFarm 的核心不是產生假資料，而是：**建立一個可驗證智慧農業 Domain Model 的 Digital Farm。**

```
Scenario → Farm Behavior → Telemetry → Farm Event → Knowledge
```

讓智慧農業系統可以在進入真實農場之前，先在數位農場中被設計、測試與演進。

## 17. 版本歷史

| 版本 | 日期 | 變更 |
|------|------|------|
| v1.0 | 2026-07 | 溫室監控 Dashboard + 歷史趨勢 |
| v2.0 | 2026-07 | 轉型 Event Engine：Scenario 重播、Farm Event Timeline、Event Validation、產銷履歷、ESG 碳盤查 |
