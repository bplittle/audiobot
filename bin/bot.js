'use strict';

var Audiobot = require('../lib/audiobot');

// var token = process.env.BOT_API_KEY;
var token = process.env.BOT_TOKEN;
var dbPath = process.env.BOT_DB_PATH; // optional
var name = process.env.BOT_NAME; // optional

var audiobot = new Audiobot({
    token: token,
    dbPath: dbPath,
    name: name
});
audiobot.run();
