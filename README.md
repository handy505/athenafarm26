# AthenaFarm26 - 智慧溫室監控系統

![Platform](https://img.shields.io/badge/platform-GitLab%20Pages-blue)
![License](https://img.shields.io/badge/license-MIT-green)

中小型溫室案場的即時監控 Dashboard，解決人力不足的痛點，讓農場主用手機或電腦就能遠端掌握溫室狀態。

## 核心功能

### 區域監控
- 針對不同作物區域（葉菜、果菜、育苗）設定獨立的理想溫濕度範圍
- 即時顯示溫度、濕度、CO₂、光照四項指標
- 每個指標附帶迷你趨勢圖（Sparkline），一眼掌握 30 分鐘變化

### 歷史趨勢
- Chart.js 時序圖表，支援 30 分鐘 / 1 小時 / 6 小時 / 24 小時切換
- 可依指標（溫度、濕度、CO₂、光照）和區域篩選
- 自動保留最近 24 小時的歷史數據

### 設備控制
- 通風系統：自然通風 / 強制通風 / 關閉
- 霧化系統：0-100% 強度調節
- 遮陽系統：0-100% 開度調節

### 異常告警
- 溫度超出理想範圍時自動產生告警
- 三級告警：正常（綠）、注意（黃）、異常（紅）
- 側欄即時顯示異常紀錄

## 線上展示

```
https://YOUR_USERNAME.gitlab.io/athenafarm26/
```

## 本地運行

```bash
# 用任何 HTTP 伺服器開啟即可
python3 -m http.server 8080
# 訪問 http://localhost:8080
```

## 部署到 GitLab Pages

```bash
# 1. 在 GitLab 建立 public 專案
#    https://gitlab.com/projects/new

# 2. 新增 remote
git remote add origin https://gitlab.com/YOUR_USERNAME/athenafarm26.git

# 3. 執行部署腳本
./deploy.sh
```

## 技術棧

- HTML5 + CSS3 + JavaScript（純前端，無需後端）
- [Chart.js](https://www.chartjs.org/) + chartjs-adapter-date-fns（時序圖表）
- Inter 字體（現代 Dashboard 風格）
- 響應式設計，支援桌面與行動裝置

## 專案結構

```
athenafarm26/
├── index.html          # 主頁面（單檔完整應用）
├── deploy.sh           # GitLab Pages 部署腳本
├── .gitlab-ci.yml      # CI/CD 配置
├── PRD.md              # 產品需求文件
└── README.md           # 本文件
```

## 未來規劃

- 接入實際 IoT 感測器數據
- 歷史數據 CSV 匯出
- 多案場管理介面
- 行動裝置 App 或 PWA

---

MIT License © 2026 AthenaFarm26
