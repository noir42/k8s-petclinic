# k8s-petclinic

카카오pay 지원자 김정호 noir42@hanmail.net

## 사용법
gradle을 통해 빌드후 Docker build 한 이미지 사용
현재 https://hub.docker.com/repository/docker/noir42/mvn 이미지 사용중
kubernetes 1.16 이상 nginx ingress controller가 사용된 클러스터에서
k8s 디렉토리의 yaml을 실행

## 과제수행 내용
- spring boot 개발 경험이 전무하여 처음에는 메이븐을 사용해 테스트함 (이미지명mvn)
- gradle을 통한 빌드를 위해 bootjar옵션 추가함 build.gradle
- log 파일의 위치 지정으로 위해 application.properties 수정함
- log, mysql 는 hostPath PV및 PVC를 만들었으나 테스트는 현재 NFS스토리지 클래스를 이용하는 클러스터에서 확인
- 과제내용의 정상동작확인 및 재실행을 위해 liveness/readness probe를 확인했으나 spring boot 2.3이상의 버전에서 자동으로 프로브 생성가능 한 것으로 확인했으나(pom.xml actuator 플러그인추가) 동작에 실패하였고 수동으로 만들어주기엔 spring boot 개발자가 아니라 리스크하다고 판단하여 수행 하지 못함
- Nginx 역시 현재 사용중인 클러스터가 istio-Ingressgateway를 사용중이라 테스트는 istio를 통해 하고 nginx는 따로 작성함.
