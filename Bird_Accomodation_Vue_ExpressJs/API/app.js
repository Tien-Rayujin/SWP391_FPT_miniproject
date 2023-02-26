const express = require('express');
const cors = require('cors');
require('dotenv').config();
const logger = require('morgan');
const routes = require('./src/routes/index.routes');
const app = express();

//Access-Control-Allow-Origin
//TODO:remove cors in production
app.use(cors());

//TODO: add this cors rule cors in production
// app.use(function (req, res, next) {
// 	res.setHeader("Access-Control-Allow-Origin", process.env.CORS_URL);
// 	res.setHeader("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT, PATCH");
// 	res.setHeader("Access-Control-Allow-Headers", "Authorization, Content-Type, Accept");
// 	next();
// });


//logger
app.use(logger('dev'));
// only to monitor web -> don't need to care about this thing
// app.use(logger)
// function logger(req, res, next){
//     console.log(`URL: ${req.originalUrl} | METHOD: ${req.method} | TIME: ${new Date().toISOString()}`);
//     next()
// }

// allow express to read request body
app.use(express.urlencoded({extended: true}))

// allow FE send json request and server can parse that json
app.use(express.json())
app.use(routes);

module.exports = app;
