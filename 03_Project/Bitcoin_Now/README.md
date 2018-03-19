# Bitcoin now
<a href="https://swift.org">
 <img src="https://img.shields.io/badge/Swift-4-orange.svg"
      alt="Swift" />
</a>
<a href="https://developer.apple.com/xcode">
  <img src="https://img.shields.io/badge/Xcode-9-blue.svg"
      alt="Xcode">
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-red.svg"
      alt="MIT">
</a>
<a href="https://github.com/MessageKit/MessageKit/issues">
   <img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"
        alt="Contributions Welcome">
</a>

<br/>

> **Global Bitcoin Price 국가 통화별 가격 조회**

<br/>

<img src="/Img/Project/bitcoin_now.gif" title="Bitcoin" width="300px" float="center">

<br/>

사이트 : https://bitcoinaverage.com/

참고문서 : https://apiv2.bitcoinaverage.com/#ticker-data-per-symbol

### Ticker Data(Per Symbol)
Returns ticker data for specified symbol

**HTTP REQUEST**
`GET https://apiv2.bitcoinaverage.com/indices/{symbol_set}/ticker/{symbol}`

**PERMISSIONS**
No permissions required

**URL PARAMETERS**
> | Parameter	| Required | Description |
> | :--- | :--- |:--- |
> | symbol_set | True | Symbol Set. Options: `global,local,crypto,tokens` |
> | symbol | True |	Full currency pair symbol. Example: `BTCKRW` |

<br/>

## Respond
```JSON
{
    "ask": 8888421.50,
    "bid": 8875592.57,
    "last": 8886363.24,
    "high": 9185122.00,
    "low": 8512174.75,
    "open": {
        "hour": 8846481.73,
        "day": 8871869.92,
        "week": 9953686.14,
        "month": 10841692.69,
        "month_3": 20676822.62,
        "month_6": 3926329.78,
        "year": 1221504.78
    },
    "averages": {
        "day": 9465290.67,
        "week": 9531415.19,
        "month": 9637171.45
    },
    "volume": 145419.13160584,
    "changes": {
        "percent": {
            "hour": 0.45,
            "day": 0.16,
            "week": -10.72,
            "month": -18.04,
            "month_3": -57.02,
            "month_6": 126.33,
            "year": 627.49
        },
        "price": {
            "hour": 39881.99,
            "day": 14493.80,
            "week": -1067322.42,
            "month": -1955328.97,
            "month_3": -11790458.90,
            "month_6": 4960033.94,
            "year": 7664858.68
        }
    },
    "timestamp": 1521247022,
    "display_timestamp": "2018-03-17 00:37:02"
}
```
