# AthenaFarm：從 Smart Agriculture POC 到 AI-Native System Evolution

> **Project exploration document**
>
> 核心問題：
>
> **人類如何描述一個真實世界的需求，讓 AI 協助將其逐步演化為可理解、可模擬、可實作、可驗證，並能持續回饋真實世界的系統？**

---

## 1. 為什麼 AthenaFarm 不只是一個 Smart Agriculture Project

AthenaFarm 原本可以是一個典型的智慧農業 IoT 專案：

```text
ESP32
  ↓
Sensors
  ↓
MQTT
  ↓
Cloud
  ↓
Database / Dashboard
```

但如果只停在這裡，最終只是在完成一個應用系統。

這個長期 Side Project 可以進一步探索：

```text
Human Intent
    ↓
Requirement
    ↓
Architecture
    ↓
System Model
    ↓
Simulation
    ↓
Implementation
    ↓
Runtime / Reality
    ↓
Observation
    └──────────────↺
```

因此 AthenaFarm 可以同時扮演兩個角色：

1. **真實 Domain**
   - Smart Agriculture
   - ESP32
   - Sensors
   - MQTT
   - Edge / Cloud
   - Traceability

2. **System Engineering 實驗場**
   - Architecture Evolution
   - System DSL
   - Simulator / Digital Twin
   - Agent Collaboration
   - End-to-End Traceability

---

# 2. 五個核心 Keywords

## 2.1 Architecture Evolution Flow

核心不是：

> AI 幫我產生一張架構圖。

而是：

> **當需求改變時，系統如何理解影響並持續演化？**

例如：

```text
v0.1
ESP32
 └── Temperature Sensor
```

需求增加：

> 使用者需要遠端查看資料。

系統演化：

```text
v0.2

ESP32
 └── MQTT
       ↓
     Cloud
       ↓
    Dashboard
```

需求再增加：

> 網路中斷時仍需要安全控制。

系統演化：

```text
v0.3

Cloud
  │
 MQTT
  │
ESP32
  │
Local Safety Logic
  │
Pump
```

因此真正需要被保存的不是單一架構圖，而是：

```text
Requirement Change
       ↓
Impact Analysis
       ↓
Architecture Decision
       ↓
Architecture Evolution
```

### 逐步產出

```text
/docs/requirements/
/docs/architecture/
/docs/adr/
/docs/evolution/
```

例如：

```text
requirements/R-001.md
requirements/R-002.md

architecture/system.md
architecture/components.md

adr/ADR-001-edge-first.md
adr/ADR-002-mqtt.md

evolution/v0.1.md
evolution/v0.2.md
```

---

## 2.2 System DSL

Markdown 很適合描述「人類理解的內容」，但系統演化到一定程度後，需要 Machine-readable Representation。

因此：

```text
Human-readable
Markdown
      +
Machine-readable
System DSL / YAML / JSON
```

例如：

```yaml
system: athenafarm

devices:
  - id: gateway-01
    type: esp32

sensors:
  - id: temp-01
    type: temperature
    connected_to: gateway-01

actuators:
  - id: pump-01
    type: pump
    controlled_by: gateway-01
```

這個 DSL 未來不只描述 Hardware。

可以逐步涵蓋：

```text
System DSL
├── Hardware
├── Software
├── Network
├── Data
├── Interface
├── Behavior
└── Deployment
```

核心問題：

> **System 的 Source Code 長什麼樣子？**

---

## 2.3 Simulator / Executable Model

當 System Model 已經足夠結構化，就會自然出現下一個問題：

> 這個 Model 可以執行嗎？

例如：

```text
Environment
    ↓
Virtual Sensor
    ↓
Virtual ESP32
    ↓
Control Logic
    ↓
Virtual Pump
    ↓
Environment Changes
```

AthenaFarm 可以成為第一個實驗世界：

```text
Farm Environment
├── Temperature
├── Humidity
├── Soil Moisture
├── Sunlight
└── Rain

Devices
├── ESP32
├── Sensor
├── Pump
├── Fan
└── Valve
```

逐步形成：

```text
System Model
      ↓
Simulator
      ↓
Scenario
      ↓
Execution
      ↓
Observation
      ↓
Result
```

最終目標不是做一個「漂亮的農場遊戲」。

而是：

> **讓 Architecture 成為可以驗證的 Executable Model。**

---

## 2.4 Agents Co-work

Multi-Agent 的重點不是讓很多 Agent 互相聊天。

真正有價值的是：

> **Engineering Division of Labor**

例如：

```text
                    System Model
                         │
        ┌────────────────┼────────────────┐
        │                │                │
Requirement Agent  Architecture Agent   HW Agent
        │                │                │
        └────────────────┼────────────────┘
                         │
                  Simulation Agent
                         │
                     Test Agent
```

可能的工作流：

```text
Requirement changed
        ↓
Requirement Agent
        ↓
Architecture Agent
"3 components are affected"
        ↓
HW Agent
"GPIO / power constraint conflict"
        ↓
Simulator Agent
"new failure scenario detected"
        ↓
Test Agent
"generate regression cases"
```

核心不是 Agent 數量。

而是：

```text
Who owns what?
Who can decide?
What evidence supports the decision?
How does one agent affect another?
```

---

## 2.5 End-to-End Traceability

Traceability 不只是農產品履歷。

在 AthenaFarm 的長期架構中，它應該是：

> **整個系統的因果關係與演化歷史。**

```text
Requirement R-001
      ↓
Architecture Decision ADR-003
      ↓
Component C-021
      ↓
Interface I-008
      ↓
Implementation
      ↓
Test T-102
      ↓
Runtime Event
```

因此可以問：

> 為什麼這個 Component 存在？

回答：

```text
R-001
→ Offline Operation Required

ADR-003
→ Edge-first Architecture

C-021
→ Local Safety Controller
```

也可以反向追蹤：

```text
Runtime Error
      ↓
Component
      ↓
Interface
      ↓
Architecture
      ↓
Requirement
```

Traceability 應該貫穿整個專案，而不是最後才補上的功能。

---

# 3. AthenaFarm Long-Term Architecture

```text
                         ┌──────────────┐
                         │ Human Intent │
                         └──────┬───────┘
                                ↓
                         Requirements
                                ↓
                         Architecture
                                ↓
                          System Model
                                ↓
                  ┌─────────────┼─────────────┐
                  │             │             │
                  ↓             ↓             ↓
              System DSL    Documentation   Agent Context
                  │
                  ↓
               Simulator
                  │
                  ↓
             Implementation
                  │
                  ↓
            Runtime / Reality
                  │
                  ↓
             Observation
                  │
                  └───────────────↺

        ─────────────────────────────────────
              End-to-End Traceability
        ─────────────────────────────────────
```

---

# 4. Markdown-First Philosophy

## 4.1 Markdown 的主要價值不是 Render

常見的 Markdown 使用方式是：

```text
Markdown
    ↓
Markdown Renderer
    ↓
Beautiful Document
```

但對長期 Engineering Project 而言，更重要的是：

```text
Markdown
   ↓
Direct Reading
   ↓
CLI
Git
Diff
Search
AI Context
```

Markdown 本身就是介面。

例如：

```bash
cat docs/architecture/system.md
less docs/adr/ADR-001-edge-first.md
rg "MQTT" docs/
git diff docs/
```

在 CLI 環境中，不需要額外的 Renderer。

文件本身就是可以直接閱讀的工程 Artifact。

---

## 4.2 CLI-First Markdown

AthenaFarm 的 Markdown 建議優先考慮：

```text
1. Raw readability
2. Grep/searchability
3. Git diff friendliness
4. AI readability
5. Long-term stability
6. Optional rendering
```

而不是：

```text
1. Fancy rendering
2. Complex tables
3. Heavy Mermaid dependency
4. Renderer-specific extensions
```

因此：

### Prefer

```text
Clear headings
Short paragraphs
Bullet lists
Code blocks
ASCII diagrams
Small metadata blocks
Links
Stable IDs
```

### Avoid overuse

```text
Large tables
Complex Mermaid graphs
Deeply nested formatting
Renderer-specific syntax
Visual layout tricks
```

---

# 5. Markdown vs HTML：不是誰取代誰

這裡的核心不是：

> Markdown 比 HTML 好。

而是：

> **它們應該負責不同層次。**

建議分層：

```text
Layer 1
Markdown
=
Knowledge / Engineering Source

Layer 2
Structured Model
=
DSL / YAML / JSON

Layer 3
Generated View
=
HTML / Web UI / Dashboard
```

例如：

```text
Source of Truth
│
├── requirements/*.md
├── adr/*.md
├── architecture/*.md
│
├── model/*.yaml
│
└── runtime/*.json
        ↓
        ↓ Generate / Render
        ↓
Web UI
Dashboard
Interactive Graph
Simulation View
```

因此 HTML 不應取代 Markdown。

HTML 比較適合：

- Interactive UI
- Large Graph
- Complex Table
- Dashboard
- Simulation Visualization
- User Interaction

Markdown 比較適合：

- Thinking
- Design
- Decision
- Explanation
- Review
- History
- AI Context
- CLI Reading

---

# 6. 一個重要原則：Render 是 View，不是 Source

這可能是 AthenaFarm Documentation Architecture 的核心原則：

> **Rendered output should be a view, not the source of truth.**

例如：

```text
Requirement.md
      │
      ├── CLI View
      ├── Git Diff
      ├── AI Context
      └── Web Render
```

同一份內容可以有不同 View。

但 Source 不需要依賴任何特定 Renderer 才能被理解。

---

# 7. 建議的 Repository Structure

```text
athenafarm/
│
├── README.md
│
├── docs/
│   │
│   ├── vision/
│   │   └── project-vision.md
│   │
│   ├── requirements/
│   │   ├── R-001-device-management.md
│   │   └── R-002-offline-operation.md
│   │
│   ├── architecture/
│   │   ├── system.md
│   │   ├── components.md
│   │   └── interfaces.md
│   │
│   ├── adr/
│   │   ├── ADR-001-edge-first.md
│   │   └── ADR-002-mqtt.md
│   │
│   ├── evolution/
│   │   ├── v0.1.md
│   │   └── v0.2.md
│   │
│   └── experiments/
│       └── system-evolution.md
│
├── model/
│   ├── system.yaml
│   ├── hardware.yaml
│   └── behavior.yaml
│
├── simulator/
│
├── agents/
│
├── firmware/
│
├── cloud/
│
└── tools/
```

---

# 8. 建議的發展方式

不要一開始就做完整 Platform。

讓問題自然長出下一個 Phase。

## Phase 1 — Architecture Evolution

問題：

> Requirement 改變時，如何知道 Architecture 哪裡需要改？

產出：

```text
Requirements
Architecture
ADR
Impact Analysis
```

---

## Phase 2 — System Model

問題：

> Markdown 描述是否足以讓 Machine 理解 System？

產出：

```text
Markdown
+
Structured System Model
```

---

## Phase 3 — System DSL

問題：

> System 是否可以用一種統一語言描述？

產出：

```text
Hardware
Software
Interface
Behavior
```

---

## Phase 4 — Simulator

問題：

> System Model 是否可以執行？

產出：

```text
Virtual Farm
Virtual Device
Scenario
Failure Simulation
```

---

## Phase 5 — Agents

問題：

> AI 如何參與不同 Engineering Roles？

產出：

```text
Requirement Agent
Architecture Agent
Simulation Agent
Test Agent
```

---

## Phase 6 — Traceability Graph

問題：

> 為什麼這個系統現在會變成這個樣子？

產出：

```text
Requirement
 ↕
Decision
 ↕
Architecture
 ↕
Implementation
 ↕
Test
 ↕
Runtime
```

---

# 9. 最終可能形成的東西

最終的 AthenaFarm 可能不是單純的 Smart Agriculture System。

而是一個：

# AI-Native System Evolution Laboratory

AthenaFarm 提供真實世界的 Domain：

```text
Farm
Sensor
Device
Environment
Human
Network
Cloud
Edge
```

而專案本身探索：

```text
How does a system evolve?

How do requirements become architecture?

How does architecture become an executable model?

How do AI agents participate in engineering?

How can every decision be traced?

How can runtime reality feed back into the system model?
```

---

# 10. Project North Star

> **AthenaFarm is not only a smart agriculture system.**
>
> **It is a long-term experiment for exploring how human intent, system models, AI agents, simulation, implementation, and reality can continuously evolve together.**

簡化成一句：

```text
Intent
→ System
→ Simulation
→ Reality
→ Learning
→ Evolution
```

---

# Appendix: CLI-First Documentation Rules

## A. A Markdown file should be useful with `cat` or `less`

如果不經過 Render 就難以閱讀，代表文件設計可能過度依賴視覺工具。

## B. One file, one primary idea

避免巨大的百科式 Markdown。

```text
Good:
R-001-offline-operation.md
ADR-003-edge-first.md

Avoid:
all-project-design.md
```

## C. Prefer text structures over visual decoration

優先：

```text
Heading
Bullet
Code Block
ASCII Flow
```

而不是依賴：

```text
Huge Table
Complex Mermaid
Visual Layout
```

## D. Stable IDs are important

```text
R-001
ADR-003
C-021
I-008
T-102
```

ID 讓：

```text
CLI Search
Git History
AI Context
Traceability
```

可以被連接。

## E. Render is optional

Markdown 可以被：

```text
CLI Read
GitHub Render
IDE Preview
Static Site
AI
```

但任何一個 Renderer 都不應成為理解內容的必要條件。
