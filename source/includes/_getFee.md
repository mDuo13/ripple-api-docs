# getFee

```javascript
return api.getFee().then(fee => {/* ... */});
```

> `fee` is a number like this:

```json
0.012
```

`getFee(): Promise<number>`

Returns the estimated transaction fee for the server(s) the RippleAPI instance is connected to.

### Parameters

This method has no parameters.

### Return Value

This method returns a promise that resolves with a floating point value representing the estimated fee to submit a transaction, expressed in XRP.
