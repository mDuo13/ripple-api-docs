---
title: RippleAPI Reference

language_tabs:
  - node

toc_footers:
  - <a href='http://ripple.com'>Ripple</a>

includes:
- connect
- disconnect
- isConnected
- getServerInfo
- getFee
- getLedgerVersion

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
}).then(() => {
  return api.disconnect();
}).catch(console.error);
```

All the code snippets assume that you have surrounded them with this boilerplate.

<aside class="notice">
Dont forget the "catch" or errors may not be visible.
</aside>
