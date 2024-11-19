FROM ubuntu:24.04

RUN apt update && apt install software-properties-common -y && \
add-apt-repository ppa:deadsnakes/ppa 

RUN apt upgrade -y && \
    apt install wget python3.10 python3-pip libpython3.10 -y 

WORKDIR app/

RUN wget "https://download.acestream.media/linux/acestream_3.2.3_ubuntu_22.04_x86_64_py3.10.tar.gz" && \
    tar zxvf acestream_3.2.3_ubuntu_22.04_x86_64_py3.10.tar.gz

RUN python3.10 -m pip install pycryptodome lxml apsw psutil pynacl iso8601 aiohttp

EXPOSE 6878/tcp

CMD ["./start-engine","--client-console"]
