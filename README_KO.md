> [!IMPORTANT]
>
> ## Compatibility Notice — Antigravity 2.0
>
> Due to breaking changes introduced in **Antigravity v2.0**, the previous skill path conventions used in this repository are no longer compatible.
>
> Some skills may not execute properly until they are migrated to the new structure required by Antigravity 2.0.
>
> ### Current Status
>
> * Legacy structure: ❌ Deprecated
> * Antigravity 2.0 support: 🚧 In Progress
> * Migration guide: Coming soon
>
> ### Repository Status
>
> This repository is no longer actively maintained.
>
> Development has been moved to a new repository with a redesigned structure optimized for Antigravity 2.0 and future multi-agent workflows.
>
> Please follow future updates in the new repository.
>
> Thank you to everyone who supported and used this project.

# pmx-skills

Gemini CLI를 위한 PM 워크플로우, 명령어, 재사용 가능한 스킬 패키지입니다.

`pm-skills`의 아이디어에서 영감을 받아, Gemini CLI에서 쓸 수 있는 **이식 가능한 PM 스킬 시스템**으로 재구성했습니다.

🇺🇸 English version: [README.md](./README.md)

---

## 이게 무엇인가요?

`pmx-skills`는 **Product Manager 업무를 구조적으로 수행하기 위한 Gemini CLI 패키지**입니다.

매번 프롬프트를 처음부터 쓰는 대신, 아래처럼 구조화된 명령어를 실행할 수 있습니다.

```bash
/pmx:discover
/pmx:prd
/pmx:launch
```

각 명령어는 하나 이상의 PM 스킬을 활용하도록 설계되어 있어서, Gemini가 더 구조적이고 의사결정에 도움이 되는 결과를 만들 수 있게 도와줍니다.

이 패키지는 다음과 같은 작업에 적합합니다.
- discovery
- research
- strategy
- prioritization
- planning
- delivery
- go-to-market
- growth
- metrics

---

## 왜 만들었나요?

대부분의 AI 활용은 “빈 화면에서 프롬프트 쓰기”로 시작합니다.

그 방식은 보통 이런 문제가 있습니다.
1. 결과가 일관되지 않음
2. 중요한 PM 사고 단계가 빠지기 쉬움
3. 한 번 잘한 사고를 다음 프로젝트에 재사용하기 어려움

`pmx-skills`는 이런 문제를 줄이기 위해 만들었습니다.

이 패키지는:
- 재사용 가능한 PM 스킬
- 반복 가능한 워크플로우 명령어
- 더 명시적인 가설과 트레이드오프
- 검토와 실행이 쉬운 결과물

을 목표로 합니다.

---

## 어떻게 동작하나요?

패키지는 두 층으로 구성되어 있습니다.

### 1) Commands
Commands는 사용자가 직접 실행하는 진입점입니다. `/pmx:*` 네임스페이스 아래에 있습니다.

예:
- `/pmx:discover`
- `/pmx:prd`
- `/pmx:prioritize`

단순 답변이 아니라 **워크플로우**가 필요할 때 유용합니다.

### 2) Skills
Skills는 `skills/pmx-*` 아래에 있는 재사용 가능한 PM 기능입니다.

예:
- `pmx-discovery`
- `pmx-opportunity-solution-tree`
- `pmx-write-prd`
- `pmx-prioritize-features`

명령어는 작업에 맞는 스킬을 더 잘 활용하도록 Gemini를 유도합니다.

---

## 무엇이 포함되어 있나요?

이 패키지에는 다음이 포함되어 있습니다.

- **65개의 PM 스킬**
- **36개의 Gemini CLI 명령어**
- `gemini-extension.json`
- `GEMINI.md`
- `install.sh` / `uninstall.sh`
- `catalog.json`
- `scripts/validate_package.py`

구조:

```text
pmx-skills/
├─ commands/pmx/*.toml
├─ skills/pmx-*/SKILL.md
├─ gemini-extension.json
├─ GEMINI.md
├─ install.sh
├─ uninstall.sh
└─ catalog.json
```

---

## 설치 방법

### 기본 Gemini 디렉토리에 전역 설치

```bash
./install.sh
```

### 원하는 Gemini 디렉토리에 설치

```bash
./install.sh /path/to/.gemini
```

설치 후 Gemini CLI 안에서 아래를 실행하세요.

```bash
/commands reload
/skills reload
```

### 제거

```bash
./uninstall.sh
```

또는 원하는 Gemini 디렉토리에서 제거하려면:

```bash
./uninstall.sh /path/to/.gemini
```

---

## 명령어 가이드

아래는 이 릴리스에 포함된 전체 명령어 세트입니다.

### Discovery와 Research

#### `/pmx:discover`
새 아이디어, 문제, 기회를 탐색합니다.

이런 상황에 사용합니다.
- 아이디어가 아직 막연할 때
- 초기 discovery를 구조화하고 싶을 때
- 거친 개념을 더 명확한 PM 관점으로 바꾸고 싶을 때

예시:
```bash
/pmx:discover AI 기반 편의점 신규 점포 매출 예측 서비스
```

#### `/pmx:ost`
Opportunity Solution Tree 방식으로 사고를 구조화합니다.

이런 상황에 사용합니다.
- 이미 달성하고 싶은 outcome이 있을 때
- opportunities, solutions, assumptions, experiments를 연결하고 싶을 때

예시:
```bash
/pmx:ost B2B 분석 대시보드의 반복 사용률 개선
```

#### `/pmx:assumptions`
가설과 전제를 추출하고 우선순위를 정합니다.

이런 상황에 사용합니다.
- 무엇이 반드시 참이어야 하는지 보고 싶을 때
- 무엇부터 검증해야 할지 정하고 싶을 때

예시:
```bash
/pmx:assumptions 기존 파워유저 대상 구독 업셀 기능
```

#### `/pmx:interview`
사용자 인터뷰 계획과 질문지를 만듭니다.

이런 상황에 사용합니다.
- discovery 인터뷰를 준비할 때
- 문제나 컨셉을 검증하고 싶을 때
- 유도성 없는 인터뷰 스크립트가 필요할 때

예시:
```bash
/pmx:interview 재고 예측의 어려움에 대해 점주 인터뷰 질문 만들기
```

#### `/pmx:synthesize`
인터뷰나 정성 리서치 결과를 인사이트로 정리합니다.

이런 상황에 사용합니다.
- 이미 노트, 인용문, 관찰 결과가 있을 때
- theme, insight, product implication으로 정리하고 싶을 때

예시:
```bash
/pmx:synthesize 온보딩 마찰에 대한 인터뷰 노트 요약
```

#### `/pmx:segment`
고객 또는 사용자 세그먼트를 정의합니다.

이런 상황에 사용합니다.
- 누구를 우선할지 정하고 싶을 때
- 세그먼트 차이를 명확히 하고 싶을 때
- 제품 또는 GTM 의사결정을 돕고 싶을 때

예시:
```bash
/pmx:segment 예측 SaaS를 위한 리테일 운영자 세그먼트 정의
```

#### `/pmx:journey`
사용자 여정을 맵으로 정리합니다.

이런 상황에 사용합니다.
- 단계, 마찰, 기회를 파악하고 싶을 때
- 감정적 또는 프로세스 상의 pain point를 찾고 싶을 때

예시:
```bash
/pmx:journey 가입부터 첫 리포트 성공까지 여정 맵 만들기
```

#### `/pmx:survey`
PM 질문을 풀기 위한 설문을 설계합니다.

이런 상황에 사용합니다.
- 더 많은 사용자에게 구조화된 입력을 받고 싶을 때
- 명확한 의사결정 질문에 답하고 싶을 때

예시:
```bash
/pmx:survey 체험 사용자가 활성화되지 않는 이유를 묻는 설문 설계
```

#### `/pmx:voice`
보이스 오브 커스터머 신호를 요약합니다.

이런 상황에 사용합니다.
- 리뷰, 통화 노트, 인터뷰 인용문이 있을 때
- pain theme와 표현 패턴을 정리하고 싶을 때

예시:
```bash
/pmx:voice 지원 티켓을 고객 pain theme로 요약
```

#### `/pmx:problem`
문제 정의를 더 날카롭게 만듭니다.

이런 상황에 사용합니다.
- 팀이 너무 빨리 솔루션으로 넘어갈 때
- 무엇이 누구에게 왜 문제인지 더 명확히 해야 할 때

예시:
```bash
/pmx:problem 늦은 점포 재고 보충 의사결정의 핵심 문제 정의
```

#### `/pmx:ideas`
아이디어 방향을 생성하고 검토합니다.

이런 상황에 사용합니다.
- 여러 방향을 먼저 보고 싶을 때
- 결정 전에 옵션을 비교하고 싶을 때

예시:
```bash
/pmx:ideas 프랜차이즈 본사의 리포팅 부담을 줄일 제품 아이디어 생성
```

### Strategy

#### `/pmx:vision`
제품 비전과 전략적 방향을 정리합니다.

이런 상황에 사용합니다.
- 장기 방향을 명확히 하고 싶을 때
- 팀이 제품의 미래상에 맞춰 정렬되어야 할 때

예시:
```bash
/pmx:vision 리테일 운영 인텔리전스를 위한 제품 비전 정의
```

#### `/pmx:positioning`
가치 제안과 포지셔닝을 만듭니다.

이런 상황에 사용합니다.
- 제품을 어떻게 설명할지 다듬고 싶을 때
- 대상, 카테고리, 차별점을 명확히 하고 싶을 때

예시:
```bash
/pmx:positioning 프랜차이즈 운영자를 위한 B2B 분석 제품 포지셔닝
```

#### `/pmx:okrs`
OKR과 지원 지표를 정의합니다.

이런 상황에 사용합니다.
- 전략을 측정 가능한 결과로 바꾸고 싶을 때
- 팀을 objective와 key result 중심으로 정렬하고 싶을 때

예시:
```bash
/pmx:okrs 주간 활성 사용 증가를 위한 OKR 정의
```

#### `/pmx:nsm`
North Star Metric과 보조 지표를 정의합니다.

이런 상황에 사용합니다.
- 가장 적절한 최상위 성공 지표를 고르고 싶을 때
- 사용자 가치와 측정을 연결하고 싶을 때

예시:
```bash
/pmx:nsm 예측 대시보드를 위한 North Star Metric 정의
```

#### `/pmx:business-model`
비즈니스 모델, 가격, 시장 진입 관점을 탐색합니다.

이런 상황에 사용합니다.
- 수익화 방향을 평가하고 싶을 때
- 채널, 매출, 시장 접근을 함께 보고 싶을 때

예시:
```bash
/pmx:business-model 멀티테넌트 분석 SaaS의 비즈니스 모델 검토
```

#### `/pmx:strategy-options`
전략 옵션을 비교합니다.

이런 상황에 사용합니다.
- 여러 방향 중 하나를 선택해야 할 때
- 트레이드오프가 있는 추천이 필요할 때

예시:
```bash
/pmx:strategy-options SMB 우선 확장 vs 엔터프라이즈 우선 확장 비교
```

#### `/pmx:roadmap`
로드맵과 시퀀싱을 만듭니다.

이런 상황에 사용합니다.
- 미래 작업을 계획할 때
- initiative를 theme와 timing에 맞춰 정렬할 때

예시:
```bash
/pmx:roadmap 리테일 예측 제품의 2개 분기 로드맵 작성
```

#### `/pmx:competition`
시장 진입 또는 경쟁 관점을 검토합니다.

이런 상황에 사용합니다.
- 시장 내 대안과 차별화를 고민할 때
- 전략적 wedge를 점검하고 싶을 때

예시:
```bash
/pmx:competition 기존 BI 툴 대비 우리 분석 제품의 경쟁 각도 비교
```

### Prioritization과 Planning

#### `/pmx:prioritize`
기능 또는 initiative의 우선순위를 정합니다.

이런 상황에 사용합니다.
- 무엇을 먼저 만들지 결정해야 할 때
- effort, value, confidence를 비교하고 싶을 때

예시:
```bash
/pmx:prioritize Q3 백로그 우선순위 정리
```

#### `/pmx:cost-benefit`
비용과 편익을 비교합니다.

이런 상황에 사용합니다.
- 더 명시적으로 트레이드오프를 보고 싶을 때
- 이해관계자에게 추천안을 설명해야 할 때

예시:
```bash
/pmx:cost-benefit 자체 예측 엔진 구축 vs 외부 벤더 사용 비교
```

#### `/pmx:scope`
이니셔티브의 범위를 정의합니다.

이런 상황에 사용합니다.
- in-scope와 out-of-scope를 분명히 하고 싶을 때
- delivery 전에 모호함을 줄이고 싶을 때

예시:
```bash
/pmx:scope 매장 단위 이상 징후 알림 기능의 범위 정의
```

#### `/pmx:sprint`
스프린트 작업과 용량을 계획합니다.

이런 상황에 사용합니다.
- 목표를 현실적인 단기 작업으로 바꾸고 싶을 때
- capacity, dependency, risk를 함께 보고 싶을 때

예시:
```bash
/pmx:sprint 온보딩 개선 작업의 다음 스프린트 계획
```

#### `/pmx:release`
다가오는 릴리스를 계획합니다.

이런 상황에 사용합니다.
- release scope와 readiness를 결정해야 할 때
- rollout 상세를 준비할 때

예시:
```bash
/pmx:release 스마트 재주문 추천 기능 릴리스 계획
```

#### `/pmx:dependencies`
delivery dependency를 정리합니다.

이런 상황에 사용합니다.
- blocker를 파악하고 싶을 때
- critical path와 owner를 이해하고 싶을 때

예시:
```bash
/pmx:dependencies Q4 출시 계획의 dependency 매핑
```

### Delivery와 Execution

#### `/pmx:prd`
PRD와 requirement 구조를 만듭니다.

이런 상황에 사용합니다.
- 기능이나 initiative를 문서화할 때
- 실행 전에 이해관계자를 정렬하고 싶을 때

예시:
```bash
/pmx:prd 알림 피로도를 줄이는 스마트 알림 시스템
```

#### `/pmx:stories`
유저 스토리와 태스크 분해를 만듭니다.

이런 상황에 사용합니다.
- 엔지니어링 또는 디자인 작업 준비가 필요할 때
- scope를 delivery-ready item으로 바꾸고 싶을 때

예시:
```bash
/pmx:stories 온보딩 체크리스트 개편을 유저 스토리로 분해
```

#### `/pmx:status`
이해관계자 업데이트 또는 상태 보고서를 만듭니다.

이런 상황에 사용합니다.
- 진행 상황을 공유할 때
- risk, next step, ask를 정리할 때

예시:
```bash
/pmx:status 예측 이니셔티브의 주간 상태 업데이트 작성
```

#### `/pmx:launch-check`
출시 준비 체크리스트를 만듭니다.

이런 상황에 사용합니다.
- 기능 또는 제품 출시를 준비할 때
- cross-functional readiness를 보고 싶을 때

예시:
```bash
/pmx:launch-check v1 모바일 릴리스 체크리스트 작성
```

#### `/pmx:retro`
회고를 진행합니다.

이런 상황에 사용합니다.
- 스프린트, 출시, 프로젝트 단계 이후
- 개선점과 action item을 정리할 때

예시:
```bash
/pmx:retro 온보딩 개편 스프린트 회고 진행
```

### GTM, Growth, Analytics

#### `/pmx:gtm`
Go-to-market 전략을 만듭니다.

이런 상황에 사용합니다.
- 기능 출시를 앞두고 있을 때
- 채널, 메시지, 대상 고객을 정의해야 할 때

예시:
```bash
/pmx:gtm 예측 재고 알림 기능 GTM 전략 작성
```

#### `/pmx:launch`
cross-functional launch plan을 만듭니다.

이런 상황에 사용합니다.
- 제품, 마케팅, 세일즈, 서포트, 운영을 함께 조율해야 할 때
- GTM을 실제 milestone으로 바꾸고 싶을 때

예시:
```bash
/pmx:launch 기존 고객 대상 구독 업셀 기능 출시 계획
```

#### `/pmx:growth`
growth loop, activation, onboarding을 분석합니다.

이런 상황에 사용합니다.
- activation을 올리고 싶을 때
- 초기 lifecycle의 약한 지점을 찾고 싶을 때

예시:
```bash
/pmx:growth 신규 체험 사용자의 activation 개선
```

#### `/pmx:funnel`
퍼널 성과를 분석합니다.

이런 상황에 사용합니다.
- 전환 이탈 구간을 파악하고 싶을 때
- 퍼널 개선 우선순위를 정하고 싶을 때

예시:
```bash
/pmx:funnel 가입부터 첫 예측 성공까지의 이탈 분석
```

#### `/pmx:pricing`
가격 방향을 고민합니다.

이런 상황에 사용합니다.
- package design을 검토할 때
- 수익화 접근 방식을 비교하고 싶을 때

예시:
```bash
/pmx:pricing 멀티 스토어 분석 툴의 초기 가격 모델 설계
```

#### `/pmx:validate`
아이디어 또는 계획을 검증합니다.

이런 상황에 사용합니다.
- test, refine, stop 중 어떤 판단을 할지 보고 싶을 때
- 아이디어에서 evidence로 넘어가고 싶을 때

예시:
```bash
/pmx:validate 자동 재주문 제안 기능을 검증할 가치가 있는지 평가
```

#### `/pmx:metrics`
KPI 구조를 정의하거나 다듬습니다.

이런 상황에 사용합니다.
- 성공 지표를 정해야 할 때
- launch 이후 측정 체계를 설계할 때

예시:
```bash
/pmx:metrics 출시 후 90일 KPI 정의
```

---

## Skills

이 패키지에는 65개의 PM 스킬이 포함되어 있습니다. 다음과 같은 영역을 다룹니다.

- discovery
- problem framing
- interviews와 synthesis
- segmentation과 journey
- strategy와 vision
- metrics와 OKR
- prioritization
- PRD와 requirements
- sprint와 release planning
- GTM과 growth

전체 목록은 아래에서 확인할 수 있습니다.
- `catalog.json`
- `skills/`

---

## 사용 예시 패턴

### 막연한 아이디어를 구조화된 discovery로 바꾸기
```bash
/pmx:discover 리테일 운영자를 위한 AI 제품 만들기
```

### 컨셉을 문서화된 기능 명세로 바꾸기
```bash
/pmx:prd 일일 재고 이상 징후 탐지 기능 PRD 작성
```

### 무엇을 먼저 만들지 결정하기
```bash
/pmx:prioritize 알림 튜닝, 모바일 대시보드, 자동 재주문 제안 비교
```

### 출시 준비하기
```bash
/pmx:launch 프리미엄 분석 티어 출시 계획
```

---

## 언어

- 기본 패키지 언어: 영어
- 한국어 입력도 많은 워크플로우에서 자연스럽게 활용 가능

---

## 참고

이 패키지는 다음을 목표로 설계되었습니다.
- 설치 가능
- 재사용 가능
- 구조적
- 즉흥 프롬프트보다 발전시키기 쉬움

특정 업스트림 프로젝트의 바이트 단위 복제본으로 표현하지 않습니다.

---

## 라이선스

MIT

---

## 🤝 참고

이 프로젝트는  
[pm-skills](https://github.com/phuryn/pm-skills)를 참고하여  
Gemini CLI 환경에 맞게 재구성되었습니다.
