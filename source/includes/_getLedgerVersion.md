# getLedgerVersion

```javascript
return api.getLedgerVersion().then(ledgerVersion => {
  /* ... */
});
```

> `ledgerVersion` is an integer like this:

```json
16869039
```

`getLedgerVersion(): Promise<number>`

Returns the most recent validated ledger version number known to the connected server.

### Parameters

This method has no parameters.

### Return Value

This method returns a promise that resolves with a positive integer representing the most recent validated ledger version number known to the connected server.
