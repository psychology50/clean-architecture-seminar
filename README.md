## MVVM Clean Architecture, 어디까지 해봤니?
> [우리들의 프로젝트](https://github.com/CollaBu/pennyway-client-ios)를 우아하게 만들어보자!

<br/>

### 1️⃣ 규칙
1. 집중해서 듣는다.
   - 집중이 안 된다면 휴식을 요구하는 등, 본인이 집중할 수 있는 최적의 상태를 확보할 것.
2. 모르는 것을 숨기지 않는다.
   - 모르는 것 부끄러운 게 아니다. 모르면서 배우려고 하지 않는 것이 부끄러운 것.
3. 궁금하거나 모르는 건 바로바로 질문한다.
   - 굳이 만났을 때가 아니어도 좋다. 디코, 카톡, PR 어떤 채널을 사용해도 좋다.

<br/>

### 2️⃣ repository 사용 방법
> 아래 단계를 현재 repo에서 빠르게 수행한 후, 개선된 코드를 실제 프로젝트에 반영한다.
1. 프로젝트에 바로 코드를 리팩토링하면 위험하므로, 우선 현재 repo를 fork한다.
2. 필요한 최소한의 라이브러리를 주입하고, 설계를 기반으로 한 코드를 작성한다.
3. 작업이 끝난 코드는 Pull Request를 올리고, 리뷰를 진행한다.

<br/>

### 3️⃣ 강의 순서
> 진행하면서 변경될 수 있습니다.
- 문제 진단  
  - View 상태  
    - 함수형 프로그래밍
    - `무상태(Stateless)` 조건  
  - DTO와 Domain  
    - DTO와 Entity 역할의 차이 (feat. 불변성 원칙)
    - 중복 vs `우발적 중복`  
  - 의존 관계: View → ViewModel → Repository → API  
    - "의존한다"의 한 줄 정리
    - 의존 관계와 변경 연쇄 효과 (추이 종속성)  
    - `protocol`을 사용한 의존 관계 역전 (DIP;의존성 역전 원칙)  
    - protocol을 사용하는 또 다른 이유?  
- 문제 개선  
  - Clean Architecture 도입
    - 3-Layer
    - 의존성 역전 적용
  - Domain Layer
    - Entity(=Model)란?
    - UseCase란?
  - Presentation Layer
    - MVC vs MVVM
    - View Model input & output
    - 파일 구조 설계
  - Data Layer
    - Repository & Network Infra
    - 아키텍처 분석
- View Life Cycle & Cache
  - UserDefaults, Key Chain, Core Data, Swift Data
  - Core Data
    - 관계형 객체 그래프
    - 영속화(Persistence)
    - ORM
    - Model 구조 설계
