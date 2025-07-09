@echo off
echo POA-v6 설치 스크립트
echo ======================
echo.

REM Python 가상환경 생성
echo 1. Python 가상환경 생성 중...
python -m venv .venv
call .venv\Scripts\activate

REM 패키지 설치
echo.
echo 2. 필요한 패키지 설치 중...
pip install --upgrade pip
pip install -r requirements.txt

REM .env 파일 생성
echo.
echo 3. 환경 설정 파일 준비 중...
if not exist .env (
    copy .env.template .env
    echo .env 파일이 생성되었습니다. API 키를 설정해주세요.
) else (
    echo .env 파일이 이미 존재합니다.
)

REM 필요한 디렉토리 생성
echo.
echo 4. 필요한 디렉토리 생성 중...
if not exist logs mkdir logs
if not exist store mkdir store

echo.
echo ======================
echo 설치가 완료되었습니다!
echo ======================
echo.
echo 사용 방법:
echo 1. .env 파일을 열어 API 키와 설정을 입력하세요.
echo 2. run.bat 또는 python run.py 명령으로 실행하세요.
echo.
pause
