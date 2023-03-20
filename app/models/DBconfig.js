const mongoose = require('mongoose');

mongoose.connect('mongodb://mongo:27017/employee', { useNewUrlParser: true}, (err) => {
    if (!err) console.log('Connection created.')
    else console.log('Connection failed: : ' + err)    
});

require('./emp.model');