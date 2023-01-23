const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';
const OS = require('os');
const ENV = 'DEV';

// App
const app = express();
app.get('/', (req, res) => {
  res.statusCode = 200;
  res.send(getPage());
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

function getPage() {
  return "<!DOCTYPE html><html><body>Hello World</body></html>";
}
