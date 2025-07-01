FROM python:3.11-slim

# 필수 패키지 설치
RUN apt-get update && \
    apt-get install -y openjdk-17-jre build-essential git curl && \
    apt-get clean \

WORKDIR /usr/local/apps/ocpp-csms
COPY . /usr/local/apps/ocpp-csms

WORKDIR /usr/local/apps/ocpp-csms
RUN python3 -m pip install -r requirements.txt
EXPOSE 9100 9101

CMD ["./start_server.sh"]