#!/bin/bash
coverage erase
coverage run --branch central_system.py --certs ./certs > server.log 2>&1 &
sleep 1  # 프로세스가 시작되도록 약간 대기
tail -f server.log