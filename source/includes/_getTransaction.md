## getTransaction

```javascript
const id = '01CDEAA89BF99D97DFD47F79A0477E1DCC0989D39F70E8AACBFE68CC83BD1E94';
return api.getTransaction(id).then(transaction => {
  /* ... */
});
```

> `transaction` is an object structured like this:

```json
{
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
}
```

`getTransaction(identifier: string, options: Object): Promise<Object>`

Retrieves a transaction by its identifier.

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
identifier | string | A Ripple transaction identifier, a 256-bit hash expressed as a hexadecimal string.
options | object | Options to limit the ledger versions to search
*options.* minLedgerVersion | integer | The lowest ledger version to search
*options.* maxLedgerVersion | integer | The highest ledger version to search

### Return Value

This method returns a promise that resolves with a transaction object containing the following fields.

Parameter | Type | Description
--------- | ---- | -----------
type | string | One of "payment", "order", "orderCancellation", "trustline", "settings", "suspendedPaymentCreation", "suspendedPaymentCancellation", "suspendedPaymentExecution"
specification | object | A [transaction specification](#transaction-specification)
outcome | object | A [transaction outcome](#transaction-outcome)
id | string | A [transaction identifier](#transaction-identifier)
address | string | The [Ripple address](#ripple-address) of the account that created the transaction.
sequence | integer | The [account sequence number](#account-sequence-number) of transaction
