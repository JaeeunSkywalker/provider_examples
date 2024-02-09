# 프로바이더 뽀개기 프로젝트

프로바이더 내 46개 클래스를 모두 한 번은 써 보기 위해서 시작한 프로젝트입니다.<br>
생각보다 하나 작업에 시간이 많이 걸리고 일상이 바빠서 빨리 완성 못 할 수 있습니다.<br>
조언이나 (특히) 코드리뷰 대환영입니다.<br>
<pre>
2024-02-03: 기본 UI 완성
            한글, 영어 지원
            ChangeNotifierProvider 완성(카운터 상태 관리)
2024-02-04: ChangeNotifierProxyProvider 완성(유저 로그인 상태 관리)
2024-02-06: ChangeNotifierProxyProvider0 완성(Supabase에서 앱 실행 시 초기 유저 설정 값을 비동기적으로 받아 와서 앱 전체에 적용)
2024-02-10: ChangeNotifierProxyProvider2 완성(사용자의 나이에 따라 다크 모드 설정 조절)
            ChangeNotifierProxyProvider3 (사용자 정보x사용자의 설정x사용자의 앱 사용 이력을 기반으로 앱 상태 결정)  
            ChangeNotifierProxyProvider4 (...사용자의 앱 사용 이력x사용자의 위치 정보를 결합해 사용자의 선호도와 현재 위치를 반영한 맞춤형 알림 설정 관리)
            ChangeNotifierProxyProvider5 (...사용자의 위치 정보x사용자의 네트워크 연결 상태를 결합해 앱의 오프라인 모드 설정 관리)
            ChangeNotifierProxyProvider6 (...사용자의 네트워크 연결 상태x사용자의 장치 배터리 상태를 결합해 에너지 절약 모드 설정 관리)
</pre>
.gitignore에 처리했는데 뭔가 내가 잘못했는지 등록하지 않으려던 파일이 등록되었다.<br>
key가 노출되어 소스와 연동된 Supabase 프로젝트를 pause했다. 🥹🥹🥹<br>
