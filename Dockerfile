FROM python:alpine

LABEL Name=inotifywaitmnamer Version=0.0.1

WORKDIR /app

COPY inotifywait.sh .
COPY .mnamer-v2.json .

RUN pip3 install --no-cache-dir --upgrade pip mnamer &&\
    chmod +x inotifywait.sh &&\
    mkdir /mnt/Watch &&\
    mkdir /mnt/Movies &&\
    mkdir /mnt/TV &&\
    mkdir /root/.cache &&\
    apk add inotify-tools

CMD ["sh", "inotifywait.sh"]