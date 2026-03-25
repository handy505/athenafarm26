# AthenaFarm26 - 智慧農場模擬 / Smart Farm Simulation

![Platform](https://img.shields.io/badge/platform-GitLab%20Pages-blue)
![License](https://img.shields.io/badge/license-MIT-green)

禪意風格的智慧農場邏輯模擬系統，展示水產養殖與溫室控制。

Zen-style smart farm simulation showcasing aquaculture and greenhouse control.

## 功能 Features

### 水產養殖 Aquaculture
- 🐟 魚池監控 / Fish pond monitoring
- 🌡️ 水質分析 / Water quality analysis (溫度、pH、溶氧、氨氮)

### 溫室控制 Greenhouse
- 🏠 區域監控 / Zone monitoring (葉菜、果菜、育苗)
- 💨 通風控制 / Ventilation control
- 💧 霧化系統 / Misting system
- 🌓 遮陽控制 / Shading control

## 線上展示 Live Demo

部署到 GitLab Pages 後即可訪問：
```
https://YOUR_USERNAME.gitlab.io/athenafarm26/
```

## 本地運行 Local Development

```bash
cd athenafarm26
python3 -m http.server 8080
# 訪問 http://localhost:8080
```

## 部署到 GitLab Pages Deploy to GitLab Pages

### 方式一：使用腳本 (推薦)

```bash
# 1. 在 GitLab 建立 public 專案
#    https://gitlab.com/projects/new

# 2. 新增 remote
git remote add origin https://gitlab.com/YOUR_USERNAME/athenafarm26.git

# 3. 執行部署腳本
./deploy.sh
```

### 方式二：手動部署

```bash
# 1. 推送代碼
git push -u origin master

# 2. 啟用 Pages
#    Settings → Pages → New deployment

# 3. 等待 2-5 分鐘後訪問
#    https://YOUR_USERNAME.gitlab.io/athenafarm26/
```

## 技術棧 Tech Stack

- HTML5 + CSS3 + JavaScript (純前端，無需後端)
- Shippori Mincho 字體 (日式禪意風格)
- 響應式設計 / Responsive Design

## 設計理念 Design Philosophy

- **簡約** / Minimal - 少即是多
- **禪意** / Zen - 日式美學
- **雙語** / Bilingual - 中英文並陳

---

MIT License © 2026 AthenaFarm26
