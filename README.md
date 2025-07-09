# POA-v6 - Power of Algorithm

## 트레이딩뷰에서 전달되는 웹훅을 처리하는 봇입니다.

&nbsp;

- 지원 거래소
  - 업비트 KRW(원화) 마켓
  - 바이낸스 현물/선물 USDT,BUSD 마켓
  - 바이비트 현물/선물 USDT 마켓
  - 비트겟 현물/선물 USDT 마켓
  - OKX 현물/선물 USDT 마켓
  - **빗썸 KRW(원화) 마켓** (New!)
  - 한국투자증권 한국/미국 주식 마켓 (1~50번 계좌 지원)

&nbsp;

# <주의>

_본 프로젝트는 개인적으로 개발한 프로젝트를 오픈소스로 공유한 것으로_

_발생하는 문제에 대한 모든 책임은 본인에게 있습니다._

# 주요 변경사항 (v6)

1. **환경 설정 파일 방식 변경**: cloud-init 방식에서 .env 파일 방식으로 변경
2. **빗썸 거래소 지원 추가**: BITHUMB 거래소 API 지원
3. **한국투자증권 계좌 확장**: KIS1~KIS50까지 50개 계좌 지원
4. **간편한 설치**: requirements.txt 기반 원클릭 설치 지원

# 설치 방법

## Windows

1. Python 3.10 이상 설치
2. 프로젝트 다운로드
3. `install.bat` 실행
4. `.env` 파일 수정하여 API 키 입력

## Linux/Mac

1. Python 3.10 이상 설치
2. 프로젝트 다운로드
3. `chmod +x install.sh && ./install.sh` 실행
4. `.env` 파일 수정하여 API 키 입력

# 환경 설정

`.env.template` 파일을 `.env`로 복사하고 다음 항목들을 설정하세요:

## 기본 설정
- `PASSWORD`: POA 접속 비밀번호
- `PORT`: 서버 포트 (기본값: 80)
- `DISCORD_WEBHOOK_URL`: 디스코드 알림 URL (선택사항)

## 거래소 API 설정

### 암호화폐 거래소
- 바이낸스: `BINANCE_KEY`, `BINANCE_SECRET`
- 업비트: `UPBIT_KEY`, `UPBIT_SECRET`
- 바이비트: `BYBIT_KEY`, `BYBIT_SECRET`
- 비트겟: `BITGET_KEY`, `BITGET_SECRET`, `BITGET_PASSPHRASE`
- OKX: `OKX_KEY`, `OKX_SECRET`, `OKX_PASSPHRASE`
- 빗썸: `BITHUMB_KEY`, `BITHUMB_SECRET`

### 한국투자증권 (KIS1~KIS50)
각 계좌별로 다음 4개 항목 설정:
- `KIS{번호}_KEY`
- `KIS{번호}_SECRET`
- `KIS{번호}_ACCOUNT_NUMBER`
- `KIS{번호}_ACCOUNT_CODE`

예시:
```
KIS1_KEY="your_key_here"
KIS1_SECRET="your_secret_here"
KIS1_ACCOUNT_NUMBER="12345678"
KIS1_ACCOUNT_CODE="01"
```

# 실행 방법

## Windows
```bash
run.bat
```

## Linux/Mac
```bash
source .venv/bin/activate
python run.py
```

# 사용 방법

트레이딩뷰 웹훅 URL: `http://your_server:port/order`

웹훅 메시지 예시:
```json
{
  "password": "your_password",
  "exchange": "UPBIT",
  "base": "BTC",
  "quote": "KRW",
  "side": "buy",
  "amount": 0.001
}
```

# Dependency

> [fastapi](https://github.com/tiangolo/fastapi) , [ccxt](https://github.com/ccxt/ccxt) , [uvicorn](https://github.com/encode/uvicorn)

# License

GNU General Public License v3.0
