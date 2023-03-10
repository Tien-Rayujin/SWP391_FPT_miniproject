const express = require('express');
const cors = require('cors');
const logger = require('morgan');
require('dotenv').config();
const routes = require('./src/routes/index.routes');
const { unknownEndpoint } = require('./src/middlewares/unknownEndpoint.mdw');

const app = express();

//Access-Control-Allow-Origin
app.use(cors());
// only to monitor web -> don't need to care about this thing
app.use(logger('dev'));

// allow express to read request body
app.use(express.urlencoded({ extended: true }))

// allow FE send json request and server can parse that json
app.use(express.json())
app.use(routes);
app.use(unknownEndpoint);


// port = process.env.PORT || 5000
//
// app.listen(port, () => {
//     console.log(`server is running on port: ${port}`)
// })

module.exports = app;


