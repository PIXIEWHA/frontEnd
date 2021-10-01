## 📁 디렉토리 구조
```
flutter/lib
├── Screens/
│   ├── Welcome                                        - 첫 페이지
│   │   ├── components                                 - body, background.dart
│   │   └── main.dart                                  - 페이지 실행
│   ├── Login                                          - 로그인
│   ├── Signup                                         - 회원가입
│   ├── Main                                           - 메인 페이지
│   ├── Video                                          - Yolo 영상 확인
│   ├── Open                                           - 공공기관 신고
│   ├── Pose                                           - Openpose 영상 확인
│   └── Report                                         - api 신고
│
├── api/
│   ├── api.dart                                       - add, delete db
│   └── FirebaseApi                                    - firebase api
│
├── components/                                        - UI 컴포넌트
│ 
├── models/                                            - DB에 올릴 json 파일
│   ├── rb.dart                                        - 라즈베리파이
│   ├── report.dart                                    - 신고
│   ├── reportweb.dart                                 - api신고
│   └── user.dart                                      - 사용자
├── .gitignore
└── README.md
```
