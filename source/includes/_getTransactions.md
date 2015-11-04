## getTransactions

```javascript
const address = 'r9UHu5CWni1qRY7Q4CfFZLGvXo2pGQy96b';
return api.getTransactions(address).then(transaction => {
  /* ... */
});
```

> `transactions` is an array of objects structured like this:

```json
[{
  "type": "order",
  "address": "r9UHu5CWni1qRY7Q4CfFZLGvXo2pGQy96b",
  "id": "5D9B0B246255815B63983C188B4C23325B3544F605CDBE3004769EE9E990D2F2",
  "sequence": 465,
  "specification": {
    "direction": "buy",
    "quantity": {
      "currency": "USD",
      "value": "237",
      "counterparty": "rMwjYedjc7qqtKYVLiAccJSmCwih4LnE2q"
    },
    "totalPrice": {
      "currency": "XRP",
      "value": "0.0002"
    }
  },
  "outcome": {
    "result": "tesSUCCESS",
    "timestamp": "2014-09-24T21:21:50.000Z",
    "fee": "0.012",
    "balanceChanges": {
      "r9UHu5CWni1qRY7Q4CfFZLGvXo2pGQy96b": [
        {
          "currency": "XRP",
          "value": "-0.012"
        }
      ]
    },
    "orderbookChanges": {
      "r9UHu5CWni1qRY7Q4CfFZLGvXo2pGQy96b": [
        {
          "direction": "buy",
          "quantity": {
            "currency": "USD",
            "counterparty": "rMwjYedjc7qqtKYVLiAccJSmCwih4LnE2q",
            "value": "237"
          },
          "totalPrice": {
            "currency": "XRP",
            "value": "0.0002"
          },
          "makerExchangeRate": "1185000",
          "sequence": 465,
          "status": "created"
        }
      ]
    },
    "ledgerVersion": 14661788,
    "indexInLedger": 2
  }
}]
```

`getTransactions(address: string, options: Object): Promise<Array<Object>>`

Retrieves historical transactions of an account.

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
address | [address](#ripple-address) | The address of the account to find transactions for.
options | object | *Optional* Options to filter the transactions to return.
*options.* minLedgerVersion | integer | The lowest ledger version to search
*options.* maxLedgerVersion | integer | The highest ledger version to search
*options.* start | [identifier](#transaction-identifier) | Only return transactions that were validated either before of after this transaction, depending on the value of the `earliestFirst` option.
*options.* limit | integer | The maximum number of transactions to return.
*options.* earliestFirst | boolean | If true, sort the transactions so that the earliest transaction come first. Otherwise, the default behaviour is to have the most recent transactions come first.
*options.* excludeFailures | boolean | If true, do not include failed transactions in the results. Note that failed transactions can still be validated and claim a fee.
*options.* initiated | boolean | If true, only return transactions that were initated by the specified account. If false, only return transaction that affected the specified account, but were not initiated by the specified account. If not specified, all transactions that affected the account will be returned.
*options.* counterparty | [address](#ripple-address) | A [Ripple address](#ripple-address). Only return tranasctions that have this account as a counterparty.
*options.* types | Array \<[type](#transaction-types)\> | Only return transactions of the types specified in this array.
*options.* binary | boolean | If true, transactions will be transferred from the server in binary format. This makes the transfer slightly faster, but may have slightly different results (e.g. a missing date field).

### Return Value

This method returns a promise that resolves with an array of transaction object in the same format as [getTransaction](#gettransaction).
