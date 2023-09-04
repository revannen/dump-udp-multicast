#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Usage: $0 [duration_in_minutes] [src_url] [out_file_name]"
	exit 1
fi

DURATION=$1
SRC_URL=$2
OUT_FILE=$3

# SIGINT 신호를 처리하는 함수 정의
function handle_interrupt {
    echo "Interrupt received. Terminating PROGRAM..."
    kill $PID
    exit 1
}

# SIGINT 신호에 대한 핸들러 설정
trap 'handle_interrupt' SIGINT

# 프로그램 실행
./PxForworder -s $SRC_URL -f 192.168.31.52 -m 3 -o $OUT_FILE &

# 프로그램의 PID 저장
PID=$!

# 지정한 시간 동안 대기
echo "===================================================="
echo "PROGRAM will be terminated after $DURATION minute(s)."
echo "===================================================="
sleep ${DURATION}m

# 프로그램 종료
kill $PID

echo "PROGRAM has been terminated after $DURATION minute(s)."

