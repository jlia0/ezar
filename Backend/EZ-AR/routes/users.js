var express = require('express');
var router = express.Router();
var Query = require('../actions.js');
var crypto = require('crypto');
var Getter = require('../getters.js');
var Setter = require('../setters.js');
var md5cryto = crypto.createHash('md5');


/* GET users listing. */
router.get('/register', function (req, res, next) {
    res.render('register', {title: 'Register'});
});

router.get('/login', function (req, res, next) {
    res.render('login', {title: 'Login'});
});

router.get('/json', function (req, res, next) {

    Query.getAds(function (status, sqlres) {
        if (status === 1) {
            res.send(JSON.stringify(sqlres.rows));
        }

    });

});

router.get('/upload', function (req, res, next) {
    res.render('upload', {title: 'Upload'});
});


router.post('/register', function (req, res) {
    var email = req.body.email;
    var pwd = req.body.pwd;
    var username = req.body.username;
    var md5 = md5cryto.update(pwd).digest('hex');


    Query.register(email, username, pwd, md5, function (status) {

        if (status === 1) {
            console.log('email is: ', email, 'password is:', pwd, 'md5 is:', md5);
            res.send('Registry successfully');
        } else {
            res.send('Registry failed');
        }

    });

});


router.post('/login', function (req, res) {
    var email = req.body.email;
    var pwd = req.body.pwd;
    var sqlpwd;

    Query.login(email, pwd, function (status, sqlres) {
        if (status === 1) {

            if (sqlres.rows.length === 0) {
                res.send('Account does not exist');
            } else {
                sqlpwd = sqlres.rows[0].password;
                console.log('email:', email, 'password:', pwd, 'query password:', sqlpwd);
                if (pwd === sqlpwd) {

                    Query.getUser_ID(email, function (sstatus, sqlles) {

                        if (sstatus === 1) {
                            var user_id = sqlles.rows[0].user_id;
                            console.log(user_id);
                            res.send(user_id.toString());
                        } else {
                            res.send('error');
                        }
                    });

                } else {
                    res.send('Password is not correct');
                }
            }

        } else {
            res.send('Login failed');
        }
    });

});

router.post('/getters/getProfile', function (req, res) {
    var user_id = req.body.user_id;
    Getter.getProfile(user_id, function (status, sqlres) {
        if (status === 1) {
            console.log(sqlres.rows[0]);
            res.send(sqlres.rows[0]);
        } else {
            res.send("SQL ERROR");
        }

    });

});

router.post('/uploadAds', function (req, res) {
    var pic_link = req.body.pic_link;
    var res_link = req.body.res_link;

    Query.uploadAds(pic_link, res_link, function (status) {
        if (status === 0) {
            res.send("NO");
        } else if (status === 1) {
            res.send("YES");
        }
    })

});

router.post('/getters/getUserName', function (req, res) {
    var user_id = req.body.user_id;
    Getter.getUser(user_id, function (status, sqlres) {
        if (status === 1) {
            console.log(sqlres.rows[0]);
            res.send(sqlres.rows[0]);
        } else {
            res.send("SQL ERROR");
        }

    });

});

router.post('/getters/business', function (req, res) {
    var user_id = req.body.user_id;
    Query.business(user_id, function (status, sqlres) {
        if (status === 1) {
            if (sqlres.rows.length != 0) {
                res.send("Yes");
            } else {
                res.send("No");
            }

        } else {
            res.send("SQL ERROR");
        }

    });

});

module.exports = router;
