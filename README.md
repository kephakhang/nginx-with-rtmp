# nginx-with-rtmp

- nginx 서버에 rtmp module 을 추가해서 RTMP 프로토콜 서버로 만들 수 있음
- nginx rtmp module source : https://github.com/arut/nginx-rtmp-module
    - 이 소스를 빌드할 필요는 없음
- **nginx rtmp를 이용해서 실시간 스트리밍 구현 예제 :** [https://qteveryday.tistory.com/372](https://qteveryday.tistory.com/372)
    - [https://qteveryday.tistory.com/371](https://qteveryday.tistory.com/371)
- nginx-with-rtmp 서버를 설치형 대신 docker 인스탄스로 만들어서 서버 구성하는 방법이 훨씬 간단함
- nginx-with-rtmp docker image 만들기
    - Dockerfile : nginx-with-rtmp docker image 를 만들기 위한 Dockerfile
    - [dockerbuild.sh](http://dockerbuild.sh) :  docker image 만들기 위한 shell script
    
    ```bash
    #!/usr/bin/bash
    
    docker build -t nginx-rtmp:1.0.0 .
    ```
    
    - [dockerrun.sh](http://dockerrun.sh) : 테스트용 docker container 수행 Shell Script
- nginx-with-rtmp docker stack service 서버 수행하기
    - docker-compose.yml :  nginx-with-rtmp 서비스 서버 구성을 위한 yml 파일
    - [start.sh](http://start.sh) :  nginx-with-rtmp 서비스를 docker stack 으로 수행
    
    ```bash
    #!/usr/bin/bash
    
    # docker swarm init --advertise-addr 172.18.0.1 
    
    docker stack deploy -c docker-compose.yml vod-server
    
    docker stack ps vod-server
    ```
    
    - [status.sh](http://status.sh) : nginx-with-rtmp  docker stack service 의 수행 상태를 보여주기 위한 Shell Script
    - [stop.sh](http://stop.sh) :  docker stack service 로 수행한 vod-server 서비스를 종료하기 위한 Shell Script
    
    ```bash
    #!/usr/bin/bash
    
    docker stack rm vod-server
    docker stack ls
    ```
    
- obs studio : RTMP 서버에 미디어 스트림을 송출 테스트를 해 볼 수 있는 클라이언트 프로그램
    - https://obsproject.com/
    - OBS-Studio 로 테스트하는 방법 : https://support.accelevents.com/en/articles/4102301-broadcasting-with-obs-or-wirecast-through-rtmp-stream
        - Open OBS Studio and go to **Settings**.
        - In the **Stream** tab, set the **Service** to **`Custom`**.
        - Set the **Server** to **`rtmp://<your-server-ip>/live`**.
        - Set the **Stream Key** to any value you prefer.