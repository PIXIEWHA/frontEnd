<div align="center">
  <h1>딥러닝 기반 저비용 주택가 쓰레기 무단 투기 인식 시스템(PIXIE)</h1>
  <img src="https://user-images.githubusercontent.com/67186222/120105425-c8506f80-c193-11eb-8533-0be46aef75b4.jpg" alt="pixie" width="300px" height="200px">    <img src="https://user-images.githubusercontent.com/67186222/144769445-dba8e1d7-5bfe-40d8-a6df-c95ec628c409.png" alt="pixie" width="200px" height="200px">
  <br />
</div>
<br />

## 목차
1. [**무단 투기 영상 확인 어플**](#1)
1. [**기술 스택**](#2)
1. [**주요 기능**](#3)
1. [**프로젝트 구성도**](#4)
1. [**실행 방법**](#5)
1. [**디렉토리 구조**](#6)

<!-- 버전기록 특이사항 SEO HeadingsMap 웹성능최적화 구글애널리틱스통계-->
<br />

<div id="1"></div>

## 📲 무단 투기 영상 확인 어플
라즈베리파이 IP를 등록 후, 무단 투기 인식 알림을 받아 영상을 확인하는 앱이며, Flutter로 개발했습니다.
<br/>

<div id="2"></div>

## ⚙️ 기술 스택
![](https://img.shields.io/badge/flutter-2.2.0-blue)
![](https://img.shields.io/badge/%20python-3.9.13-black)
![](https://img.shields.io/badge/%20-firebase-skyblue)
<br /><br/>

<div id="3"></div>

## 📲 주요 기능

| <div align="center"/>기능                      | <div align="center"/>내용                |
| :------------------------ | :--------------------------------- |
| <div align="center"/>🔗[**프론트엔드**](https://github.com/yhyeonjg/frontEnd)|- 라즈베리파이 IP 등록<br/>- Firebase 서버에 있는 무단 투기 영상 확인 및 알림<br/>- URL 복사하여 편리하게 무단 투기 신고|
| <div align="center"/>🔗[**백엔드**](https://github.com/yhyeonjg/backEnd)|- aws에 회원정보 저장<br/>- 라즈베리파이 IP 관리<br/>- Firebase 영상 관리|
      
<br /><br/>

<div id="4"></div>

## 🗄️ 프로젝트 구성도
| <div align="center"/>UI|                                                                                                                    
| :------------------------ |
| <div align="center"/><img src="https://user-images.githubusercontent.com/67186222/206855989-b7b72c87-965d-4558-89c9-846faec5d1c7.png" alt="architecture" width="900px" height="400px"/>|

<br /><br/>

<div id="5"></div>

## 💡 실행 방법
### Client 환경
> 🔗[**apk 파일**](https://drive.google.com/file/d/14LaYov-2ddF-LvXdT60Z9SGFr4kFCOee/view?usp=sharing) 실행
<br/>

### 개발환경
**1. 원격 저장소 복제**

```bash
$ git clone https://github.com/yhyeonjg/frontEnd.git
```
**2. pubspec.yaml**
> Get Packages
<br/>


<div id="6"></div>

## 📁 디렉토리 구조
```
flutter/lib
├── main.dart                                          - 첫 실행
├── components.dart
├── Screens/                                           - 페이지
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
└── └── user.dart                                      - 사용자

```