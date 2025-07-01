#!/bin/bash

# central_system.py 프로세스 PID 찾기 (grep 제외)
PID=$(ps aux | grep central_system.py | grep -v grep | awk '{print $2}')

if [ -z "$PID" ]; then
  echo "❌ central_system.py is not running."
  exit 1
fi

echo "🛑 Sending SIGINT to central_system.py (PID=$PID)..."
kill -2 $PID

# coverage 저장을 위해 잠시 대기
sleep 2

# coverage 저장 명령 (필요시)
echo "💾 Saving coverage report..."
coverage save
coverage json -o coverage.json
echo "✅ Coverage saved to coverage.json"
