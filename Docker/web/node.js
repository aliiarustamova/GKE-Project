const express = require('express');
const app = express();

// Liveness/readiness probe
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Routes
app.get('/', (req, res) => {
  res.send('Hello from the Web App!');
});

app.listen(process.env.PORT || 3000);
