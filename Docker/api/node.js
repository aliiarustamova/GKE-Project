const express = require('express');
const app = express();

// Liveness/readiness probe
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Routes
app.get('/api', (req, res) => {
  res.json({ message: 'Hello from the API!' });
});

app.listen(process.env.PORT || 3001);
