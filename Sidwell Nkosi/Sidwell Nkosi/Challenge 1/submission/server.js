let path = require('path');
let express = require('express');
let app = express();
let mainRouter = require('./API')

app.set('views', path.join(__dirname, 'views'))
app.use('/public', express.static('./public'))

app.use(mainRouter);


let port = process.env.PORT || 3000;
app.listen(port);
console.log('Express server running on port', port);