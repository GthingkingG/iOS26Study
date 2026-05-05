# iOS 26 Study

iOS 26 신규 API / SwiftUI 기능 주차별 학습 레포.

## 학습 목적
- iOS 26에 추가된 새 API 탐구
- 주차별로 concept 학습 + practice 과제 수행
- 클린 아키텍처 / Tuist 모듈화 시도 (Week6_practice)

## 폴더 구조
```
iOS26Study/
├── iOS26Study/             # 메인 프로젝트
├── Week1_concepts, Week1_practice
├── Week2_concepts
├── Week3_concepts, Week3_practice
├── Week5_Concepts
├── Week6_practice/MyApp/   # Tuist 모듈화 (submodule)
├── Practice.playground     # async/await 학습
└── ToolbarStyling.swift    # iOS 26 .tabViewBottomAccessory
```

## 브랜치 컨벤션
주차별 브랜치를 main에 머지하지 않고 그대로 보존 (학습 스냅샷 패턴):
- `feat/1week`, `feat/3week`
- `wip/week5-keychain` (현재 active)

## 빌드 & 실행
```bash
git clone --recurse-submodules https://github.com/GthingkingG/iOS26Study.git
open iOS26Study/iOS26Study.xcodeproj
```
Week6_practice/MyApp은 [GthingkingG/MyApp](https://github.com/GthingkingG/MyApp) submodule. 클론 시 `--recurse-submodules` 필요.

## 인덱스
[Learning-Archive](https://github.com/GthingkingG/Learning-Archive) 대시보드의 `[버전]` 카테고리.
