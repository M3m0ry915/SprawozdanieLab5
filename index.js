const express = require('express');
const os = require('os');
const app = express();
const port = 8888;

app.get('/', (req, res) => {
  const serverInfo = {
    ipAddress: req.connection.remoteAddress,
    hostname: os.hostname(),
    version: process.env.APP_VERSION
  };
  res.json(serverInfo);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
