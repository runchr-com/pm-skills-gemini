# pm-skills-gemini

Gemini CLI에서 **pm-skills 전체 skill**을 프로젝트 로컬 `.gemini/` 안에 설치해서 바로 쓸 수 있게 만든 1단계 패키지입니다.

이 프로젝트의 목표는 단순합니다.

- `phuryn/pm-skills`의 skill 자산은 그대로 활용하고
- Gemini CLI에서 쓰기 쉽게 커맨드 레이어를 얹고
- 전역 `~/.gemini`를 어지럽히지 않고
- **프로젝트 단위로 버전 관리와 공유가 가능하게** 만드는 것

---

## 이 패키지가 해주는 일

`./install.sh`를 실행하면 아래 두 가지가 자동으로 준비됩니다.

1. upstream `pm-skills` 저장소의 skill들을 내려받아
   `./.gemini/skills/`에 설치
2. 이 저장소에 포함된 Gemini CLI 커맨드들을
   `./.gemini/commands/`에 배치

즉, 이 프로젝트 폴더 자체가 곧 **Gemini CLI용 PM workflow workspace**가 됩니다.

---

## 왜 전역 `~/.gemini`가 아니라 프로젝트 로컬 `.gemini`를 쓰나요?

전역 설치는 처음엔 편해 보이지만, 실제로는 관리가 점점 불편해집니다.

예를 들면:

- 다른 프로젝트용 command와 섞임
- 어떤 버전의 skill이 설치되어 있는지 추적하기 어려움
- 팀원과 동일한 환경을 맞추기 어려움
- Git으로 함께 관리하기 어려움

반면 프로젝트 로컬 `.gemini/` 구조는 이런 장점이 있습니다.

- 이 저장소 안에서만 동작해서 깔끔함
- GitHub에 그대로 올리기 쉬움
- 팀 단위 공유가 쉬움
- runchr 제품화 단계로 이어가기 좋음
- 나중에 여러 workflow repo를 동시에 운영하기 쉬움

지금 네 방향처럼 **runchr product + 오픈소스 ecosystem**을 생각한다면, 프로젝트 로컬 방식이 훨씬 자연스럽습니다.

---

## 폴더 구조

```text
pm-skills-gemini/
├── .gemini/
│   ├── commands/
│   └── skills/
├── commands/
├── scripts/
│   └── sync-upstream.sh
├── install.sh
├── pm-skills-manifest.json
├── LICENSE
└── README.md
```

### 각 폴더 설명

#### `.gemini/commands`
Gemini CLI가 실제로 읽는 커맨드 파일이 들어갑니다.

#### `.gemini/skills`
upstream `pm-skills`에서 받아온 skill 폴더들이 들어갑니다.

#### `commands/`
이 저장소가 제공하는 원본 커맨드 파일 모음입니다. 필요하면 여기서 수정한 뒤 다시 설치하면 됩니다.

#### `scripts/sync-upstream.sh`
upstream 최신 skill을 다시 받아오고 싶은 경우 실행하는 간단한 스크립트입니다.

---

## 설치 방법

### 1. 저장소 다운로드

```bash
git clone https://github.com/your-org/pm-skills-gemini
cd pm-skills-gemini
```

### 2. 설치 실행

```bash
./install.sh
```

설치가 끝나면 이 프로젝트 내부에 다음이 채워집니다.

```text
.gemini/
├── commands/
└── skills/
```

---

## 설치에 필요한 것

아래가 준비되어 있으면 됩니다.

- Gemini CLI
- `curl` 또는 `wget`
- `tar`

Gemini CLI가 없다면 먼저 설치하세요.

```bash
npm install -g @google/gemini-cli@latest
```

---

## 설치 후 어떻게 쓰나요?

중요한 포인트는 하나입니다.

**이 프로젝트 폴더 안에서 Gemini CLI를 실행해야 합니다.**

예:

```bash
cd pm-skills-gemini
gemini
```

그다음 아래처럼 slash command를 사용하면 됩니다.

```bash
/discover AI 회의 요약 도구
/strategy B2B 협업 SaaS
/write-prd 알림 피로도를 줄이는 스마트 알림 기능
/plan-launch AI 코드 리뷰 도구
/north-star 크리에이터 마켓플레이스
```

---

## 처음 써볼 때 추천 순서

처음에는 아래 순서로 써보는 게 가장 이해가 쉽습니다.

### 1) `/discover`
새 아이디어나 문제를 탐색할 때 사용

예:

```bash
/discover 현장 영업팀을 위한 모바일 CRM 도구
```

이 커맨드는 보통 이런 흐름으로 생각하게 도와줍니다.

- 문제/기회 정의
- 아이디어 확장
- 핵심 가정 도출
- 위험도 우선순위화
- 실험 제안

### 2) `/strategy`
시장이 있는지, 어떤 전략으로 갈지 정리할 때 사용

예:

```bash
/strategy 중소 제조사를 위한 납품 일정 관리 SaaS
```

### 3) `/write-prd`
기능 요구사항 문서나 PM 문서를 빠르게 초안으로 만들 때 사용

예:

```bash
/write-prd 사용자의 알림 피로도를 줄이는 묶음 알림 기능
```

### 4) `/plan-launch`
출시 준비, GTM, 포지셔닝 정리가 필요할 때 사용

예:

```bash
/plan-launch AI 회의록 자동 생성 서비스
```

### 5) `/north-star`
핵심 가치 지표를 잡고 싶을 때 사용

예:

```bash
/north-star 공급사와 바이어를 연결하는 B2B 마켓플레이스
```

---

## 포함된 주요 커맨드

이 패키지에는 총 36개의 Gemini 커맨드가 포함되어 있습니다.

### Discovery
- `/discover`
- `/brainstorm`
- `/triage-requests`
- `/interview`
- `/setup-metrics`

### Strategy
- `/strategy`
- `/business-model`
- `/value-proposition`
- `/market-scan`
- `/pricing`

### Execution
- `/write-prd`
- `/plan-okrs`
- `/transform-roadmap`
- `/sprint`
- `/pre-mortem`
- `/meeting-notes`
- `/stakeholder-map`
- `/write-stories`
- `/test-scenarios`
- `/generate-data`

### Research
- `/research-users`
- `/competitive-analysis`
- `/analyze-feedback`

### Analytics
- `/write-query`
- `/analyze-cohorts`
- `/analyze-test`

### Go-to-market
- `/plan-launch`
- `/growth-strategy`
- `/battlecard`

### Growth / Product
- `/market-product`
- `/north-star`

### Utility
- `/review-resume`
- `/tailor-resume`
- `/draft-nda`
- `/privacy-policy`
- `/proofread`

---

## 이 커맨드들은 어떻게 동작하나요?

구조는 간단합니다.

1. Gemini CLI 커맨드가 실행됨
2. 관련 upstream skill 파일을 참고하도록 유도함
3. 해당 프레임워크를 기반으로 답변을 생성함
4. 결과를 실무형 산출물 형태로 정리함

즉,

- **skill 내용은 upstream 자산을 활용하고**
- **사용성은 Gemini CLI command로 보완하는 방식**입니다.

---

## upstream skill 업데이트는 어떻게 하나요?

최신 skill을 다시 받으려면 아래 명령만 실행하면 됩니다.

```bash
./scripts/sync-upstream.sh
```

이 명령은 내부적으로 `./install.sh`를 다시 실행해서 `.gemini/skills`와 `.gemini/commands`를 동기화합니다.

---

## 자주 묻는 질문

### Q. 왜 설치 후에도 `commands/` 폴더와 `.gemini/commands/` 폴더가 둘 다 있나요?

`commands/`는 이 저장소의 **원본 command 소스**이고,
`.gemini/commands/`는 Gemini CLI가 실제로 읽는 **실행용 위치**입니다.

즉:

- `commands/` = 수정/관리용
- `.gemini/commands/` = 실행용

### Q. `.gemini/skills`가 비어 있어요.

정상일 수 있습니다. 처음 클론한 직후에는 비어 있고, `./install.sh` 실행 후 채워집니다.

### Q. 다른 프로젝트와 섞이지 않나요?

섞이지 않습니다. 이 패키지는 프로젝트 내부 `.gemini/`만 사용합니다.

### Q. 팀원에게도 똑같이 배포할 수 있나요?

가능합니다. 팀원이 저장소를 클론한 뒤 `./install.sh`만 실행하면 같은 구조를 사용할 수 있습니다.

---

## 추천 운영 방식

이 패키지를 실제로 쓰려면 아래처럼 운영하는 게 좋습니다.

1. 이 저장소를 GitHub에 올림
2. README에 주요 예시를 더 추가
3. 자주 쓰는 command를 팀 스타일에 맞게 수정
4. 추후 runchr 서비스로 확장할 때 workflow 엔진의 기준 저장소로 사용

즉 지금 단계에서는,

- **오픈소스 레퍼런스**로도 좋고
- **runchr 제품화 1단계 베이스**로도 좋습니다.

---

## 출처 및 크레딧

원본 프로젝트:
- `phuryn/pm-skills`

이 저장소는 upstream skill 설치를 자동화하고, Gemini CLI에서 더 편하게 쓰기 위한 project-local adapter 성격의 패키지입니다.

---

## 빠른 시작 요약

```bash
git clone https://github.com/your-org/pm-skills-gemini
cd pm-skills-gemini
./install.sh
gemini
```

그리고 예를 들면:

```bash
/discover AI 회의 요약 도구
/write-prd 고객 문의 자동 분류 기능
/plan-launch AI 문서 정리 SaaS
```

이렇게 시작하면 됩니다.
