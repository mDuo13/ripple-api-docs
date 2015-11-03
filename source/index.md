---
title: RippleAPI Reference

language_tabs:
  - node

toc_footers:
  - <a href='http://ripple.com'>Ripple</a>

search: true
---

# Introduction

RippleAPI allows you to query and submit transactions to a node on the Ripple network.

The API is based on ES6 promises.

# Boilerplate

```javascript
const {RippleAPI} = require('ripple-lib');

const api = new RippleAPI({
  servers: ['wss://s1.ripple.com']
});
api.connect().then(() => {
  /* insert code here */
}).catch(console.error);
```

All the code snippets assume that you have surrounded them with this boilerplate.

<aside class="notice">
Dont forget the "catch" or errors may not be visible.
</aside>

# getServerInfo

`getServerInfo(): Promise<object>`

## Parameters

This method has no parameters.

## Return Value

```javascript
return api.getServerInfo().then(console.log);
```

> The above command returns JSON structured like this:

```json
{
  "buildVersion": "0.24.0-rc1",
  "completeLedgers": "32570-6595042",
  "hostid": "ARTS",
  "lastClose": {
    "convergeTimeS": 2.007,
    "proposers": 4
  },
  "loadFactor": 1,
  "peers": 53,
  "pubkeyNode": "n94wWvFUmaKGYrKUGgpv1DyYgDeXRGdACkNQaSe7zJiy5Znio7UC",
  "serverState": "full",
  "validatedLedger": {
    "age": 5,
    "baseFeeXrp": 0.00001,
    "hash": "4482DEE5362332F54A4036ED57EE1767C9F33CF7CE5A6670355C16CECE381D46",
    "reserveBaseXrp": 20,
    "reserveIncXrp": 5,
    "seq": 6595042
  },
  "validationQuorum": 3
}
```


Parameter | Type | Description
--------- | ------- | -----------
buildVersion | string | Version of rippled that the server is running.
lastClose | object | Information about the last closed ledger
*lastClose.somethingelse.* proposers | integer | Number of proposers

