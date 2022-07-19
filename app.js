const express = require('express');
const bodyParser = require('body-parser');
const logger = require('./logger/logger');

const app = express();
const port = 3000

app.use(bodyParser.json());

app.get('/', function(req, res) {
    logger.info('default route');
    res.send('Hello World!')
})

app.get('/healthcheck', function(req, res) {
    logger.info('health check route');
    res.status(200).end()
})

app.listen(port, (err) => {
  if (err) {
    logger.error('Error::', err);
  }
  logger.info(`running server on from port:::::::${port}`);
});