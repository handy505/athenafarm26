# AthenaFarm — Digital Farm Event Engine

![Platform](https://img.shields.io/badge/platform-GitHub%20Pages-blue)
![License](https://img.shields.io/badge/license-MIT-green)

可模擬真實農業環境的 Digital Farm（POC）。核心理念：**不模擬 Sensor，而是模擬農場行為** — 由 Scenario 重播產生 Telemetry，經 Event Engine 解析為 Farm Event，建立 Farm Timeline，最終支撐**產銷履歷（Traceability）與 ESG 碳盤查**。

```
Scenario → Environment Model → Telemetry → Device Action → Farm Event → Farm Timeline
                                                                            ↓
                                                          Dashboard / QR / AI / ESG
```

## 為什麼不是又一個 Sensor Dashboard？

傳統 IoT 只能看到 `Temperature = 32°C`、`CO2 = 1500ppm`，無法回答：發生了什麼農業事件？為什麼需要處理？處理結果如何？

AthenaFarm 的主要產物是 **Farm Event**（含事件、原因、起訖時間），因此：

- **產銷履歷**由事件自動生成，不靠人工填寫，可稽核
- **ESG 碳排**由設備事件起訖推算（運轉時間 × 功率 × 排碳係數），每筆排放有事件佐證

## 功能

### Scenario 重播
- 4 個內建 Scenario：早晨 CO₂ 累積、乾旱灌溉、泵浦故障、感測器離線
- 播放 / 暫停 / 重播、速度調整（1× / 2× / 6×）
- Scenario 以 YAML 定義（UI 內附「Scenario YAML」分頁）

### Event Engine
- 規則式引擎：CO₂ > 1500 → 通風、土壤濕度 < 30% → 灌溉、泵浦無水流 → 告警、Telemetry 中斷 → 感測器離線事件
- 設備動作回饋環境（Fan 降 CO₂、Pump 補土壤濕度）
- **Event Validation**：Expected vs Actual Event，重播結束給出 PASS / FAIL（可作 Event Regression Test）

### Farm Timeline
- 事件時間軸：事件、原因、起訖、時長、狀態
- MQTT 訊息流檢視（`athena/farm01/telemetry` / `device` / `event` 契約）

### 產銷履歷
- 批次卡（批號、作物、場域、定植日、碳足跡、用水）
- Farm Story 履歷表：由事件自動寫入
- 消費者溯源 QR

### ESG 碳盤查
- 用電、碳排（範疇二）、灌溉用水、佐證事件數
- 設備排放明細表

## 線上展示

```
https://handy505.github.io/athenafarm26/
```

## 本地運行

```bash
# 用任何 HTTP 伺服器開啟即可
python3 -m http.server 8080
# 訪問 http://localhost:8080
```

## 技術棧

- HTML5 + CSS3 + JavaScript（單檔靜態頁，無需後端）
- [Chart.js](https://www.chartjs.org/)（環境趨勢圖）
- qrcodejs（溯源 QR）
- 深色 Dashboard 風格、響應式設計

## 專案結構

```
athenafarm26/
├── index.html                          # 單檔完整應用（Simulator + Event Engine + UI）
├── PRD.md                              # 產品需求文件（Event Engine 方向）
├── AthenaFarm Simulator PRD v0.1.pdf   # 原始 Simulator PRD
├── .gitlab-ci.yml                      # CI/CD 配置（GitLab Pages 遺留）
├── deploy.sh                           # 部署腳本
└── README.md                           # 本文件
```

## Roadmap

| Phase | 內容 |
|-------|------|
| 1. Basic Simulator ✅ | Scenario 重播、Telemetry、Event Engine、Timeline（本版，in-browser） |
| 2. Device Interaction | 真實 MQTT Broker、relay feedback、後端 Event Store |
| 3. Crop Model | 作物生長、病害風險、氣象 |
| 4. Digital Twin | Farm state、Historical replay、Prediction |
| 5. Traceability / ESG 平台 | 履歷簽章、ESG 報告匯出、多農場多批次 |

---

MIT License © 2026 AthenaFarm
