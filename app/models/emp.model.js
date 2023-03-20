const mongoose = require('mongoose');

// Schema
const empSchema = new mongoose.Schema({
    full_name: {
        type: String,
        required: 'Por favor introduzca un nombre completo'
    },
    email: {
        type: String
    },
    mobile: {
        type: String
    },
    address: {
        type: String
    },
    salary: {
        type: String
    }
});

// email validation
empSchema.path('email').validate((val) => {
    const emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return emailRegex.test(val);
}, 'Por favor, introduzca una dirección válida');

mongoose.model('empModel', empSchema);