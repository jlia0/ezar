var SQLQuery = require('./sql.js');

module.exports = function () {

};

// When register, it works like this
//
// register().then().insertUser().then().getUserID().then().createProfile()

module.exports.register = function (email, username, pwd, md5, callback) {
    var status = -1;
    var query = "INSERT INTO public.registry (email, password, md5) VALUES ('" + email + "','" + pwd + "','" + md5 + "');";
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            insertUser(email, username, callback);
        }
    });
};

var insertUser = function (email, username, callback) {
    var status = -1;
    var query = "INSERT INTO public.user (username, email) VALUES ('" + username + "', '" + email + "');";
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            getUserID(email, callback);
        }
    });
};

var getUserID = function (email, callback) {
    var status = -1;
    var query = "SELECT user_id FROM public.user where email='" + email + "';";
    var userID;
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            userID = res.rows[0].user_id;
            createProfile(userID, callback);
        }
    });
};

var createProfile = function (userID, callback) {
    var status = -1;
    var query = "INSERT INTO public.profile (user_id) VALUES ('" + userID + "');";
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            callback(status);
        }
    });
};

module.exports.getUser_ID = function (email, callback) {
    var status = -1;
    var query = "SELECT user_id FROM public.user where email='" + email + "';";
    //var userID;
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            //userID = res.rows[0].user_id;
            callback(status, res);
        }
    });
};

module.exports.login = function (email, pwd, callback) {
    var status = -1;
    var query = "SELECT password FROM public.registry where email='" + email + "';";

    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            callback(status, res);
        }
    });
};

module.exports.getAds = function (callback) {
    var status = -1;
    var query = "SELECT * FROM public.advertisement NATURAL JOIN public.ar_resources NATURAL JOIN public.identification_picture;";

    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            callback(status, res);
        }
    });
};

module.exports.business = function (user_id, callback) {
    var status = -1;
    var query = "SELECT * FROM public.business_owner where user_id = '" + user_id + "';";

    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            callback(status, res);
        }
    });
};

var getResID = function (ad_id, pic_link, callback) {
    var status = -1;
    var query = "SELECT MAX(res_id) FROM public.ar_resources;";
    var ResID;
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            //status = 1;
            ResID = res.rows[0].max;
            insertIDPics(ResID, pic_link, callback);
        }
    });
};

var insertIDPics = function (res_id, pic_link, callback) {
    var status = -1;
    var query = "INSERT INTO public.identification_picture (pic_link, res_id) VALUES ('" + pic_link + "', '" + res_id + "');";
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            status = 1;
            callback(status);
        }
    });
};

var getAdID = function (res_link, pic_link, callback) {
    var status = -1;
    var query = "SELECT MAX(ad_id) FROM public.advertisement;";
    var AdID;
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            //status = 1;
            AdID = res.rows[0].max;
            insertRes(AdID, res_link, pic_link, callback);
        }
    });
};


var insertRes = function (ad_id, res_link, pic_link, callback) {
    var status = -1;
    var query = "INSERT INTO public.ar_resources (res_link, ad_id) VALUES ('" + res_link + "', '" + ad_id + "');";
    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            //status = 1;
            //callback(status);
            getResID(ad_id, pic_link, callback);

        }
    });
};

module.exports.uploadAds = function (pic_link, res_link, callback) {
    var status = -1;
    var query = "INSERT INTO public.advertisement (business_owner_userid) VALUES ('1');";

    SQLQuery(query, function (err, res) {
        if (err) {
            status = 0;
            callback(status);
        } else {
            //status = 1;
            //callback(status, res);
            getAdID(res_link, pic_link, callback);

        }
    });
};
