## getTrustlines

`getTrustlines(address: string, options: Object): Promise<Array<Object>>`

```javascript
const address = 'r9UHu5CWni1qRY7Q4CfFZLGvXo2pGQy96b';
return api.getTrustlines(address).then(trustlines =>
  {/* ... */});
```

```json
[
  {
    "specification": {
      "limit": "5",
      "currency": "USD",
      "counterparty": "rMwjYedjc7qqtKYVLiAccJSmCwih4LnE2q",
      "ripplingDisabled": true,
      "frozen": true
    },
    "counterparty": {
      "limit": "0"
    },
    "state": {
      "balance": "2.497605752725159"
    }
  },
  {
    "specification": {
      "limit": "5000",
      "currency": "USD",
      "counterparty": "rvYAfWj5gh67oV6fW32ZzP3Aw4Eubs59B"
    },
    "counterparty": {
      "limit": "0"
    },
    "state": {
      "balance": "0"
    }
  },
  {
    "specification": {
      "limit": "1",
      "currency": "USD",
      "counterparty": "rLEsXccBGNR3UPuPu2hUXPjziKC3qKSBun"
    },
    "counterparty": {
      "limit": "0"
    },
    "state": {
      "balance": "1"
    }
  },
  {
    "specification": {
      "limit": "1",
      "currency": "USD",
      "counterparty": "r9vbV3EHvXWjSkeQ6CAcYVPGeq7TuiXY2X",
      "ripplingDisabled": true
    },
    "counterparty": {
      "limit": "0"
    },
    "state": {
      "balance": "0"
    }
  },
  {
    "specification": {
      "limit": "500",
      "currency": "USD",
      "counterparty": "rfF3PNkwkq1DygW2wum2HK3RGfgkJjdPVD",
      "ripplingDisabled": true
    },
    "counterparty": {
      "limit": "0"
    },
    "state": {
      "balance": "35"
    }
  },
  {
    "specification": {
      "limit": "0",
      "currency": "USD",
      "counterparty": "rE6R3DWF9fBD7CyiQciePF9SqK58Ubp8o2"
    },
    "counterparty": {
      "limit": "100",
      "ripplingDisabled": true
    },
    "state": {
      "balance": "0"
    }
  },
  {
    "specification": {
      "limit": "0",
      "currency": "USD",
      "counterparty": "rEhDDUUNxpXgEHVJtC2cjXAgyx5VCFxdMF",
      "frozen": true
    },
    "counterparty": {
      "limit": "1"
    },
    "state": {
      "balance": "0"
    }
  }
]
```

Returns trustlines for a specified account.

### Parameters

Name | Type | Description
---- | ---- | -----------
address | [address](#ripple-address) | The address of the account to get transactions for.
options | object | Options to filter the trustlines to return.
*options.* counterparty | [address](#ripple-address) | Only return trustlines tothis counterparty.
*options.* currency | [currency](#currency-code) | Only return trustlines for this currency.
*options.* limit | integer | Return at most this many trustlines.
*options.* ledgerVersion | integer | Get trustlines based on this ledger version.

### Return Value

This method returns a promise that resolves with an array of objects with the following structure.
