// # lib/audiobot.js

'use strict';

var util = require('util');
var path = require('path');
var fs = require('fs');
// var SQLite = require('sqlite3').verbose();
var Bot = require('slackbots');
// var soundcloud = require('soundcloud'); // maybe later. They validate API applicants
var db = require('../db/db.json');

var Audiobot = function Constructor(settings) {
    this.settings = settings;
    this.settings.name = this.settings.name || 'audiobot';
    // this.dbPath = settings.dbPath || path.resolve(process.cwd(), 'data', 'audiobot.db');

    this.user = null;
    // this.db = null;
};

// inherits methods and properties from the Bot constructor
util.inherits(Audiobot, Bot);

module.exports = Audiobot;

Audiobot.prototype.run = function () {
    Audiobot.super_.call(this, this.settings);

    this.on('start', this._onStart);
    this.on('message', this._onMessage);
};

Audiobot.prototype._onStart = function () {
    this._loadBotUser();
    // this._connectDb();
    // this._firstRunCheck();
    this._welcomeMessage();
};

Audiobot.prototype._loadBotUser = function () {
    var self = this;
    this.user = this.users.filter(function (user) {
        return user.name === self.name;
    })[0];
};

// Audiobot.prototype._connectDb = function () {
//     if (!fs.existsSync(this.dbPath)) {
//         console.error('Database path ' + '"' + this.dbPath + '" does not exists or it\'s not readable.');
//         process.exit(1);
//     }
//
//     this.db = new SQLite.Database(this.dbPath);
// };

// Audiobot.prototype._firstRunCheck = function () {
//     var self = this;
//     self.db.get('SELECT val FROM info WHERE name = "lastrun" LIMIT 1', function (err, record) {
//         if (err) {
//             return console.error('DATABASE ERROR:', err);
//         }
//
//         var currentTime = (new Date()).toJSON();
//
//         // this is a first run
//         if (!record) {
//             self._welcomeMessage();
//             return self.db.run('INSERT INTO info(name, val) VALUES("lastrun", ?)', currentTime);
//         }
//
//         // updates with new last running time
//         self.db.run('UPDATE info SET val = ? WHERE name = "lastrun"', currentTime);
//     });
// };

Audiobot.prototype._welcomeMessage = function (message) {
    this.postMessageToChannel(this.channels[0].name, 'Hi guys, hip hop noises anyone?' +
        '\n Just say `Audiobot` or `' + this.name + '` to invoke me!',
        {as_user: true});
    this.postMessageToChannel('sunday-funday', "Hi :) :)");
};

Audiobot.prototype._onMessage = function (message) {
    if (this._isChatMessage(message) &&
        this._isChannelConversation(message) &&
        !this._isFromAudiobot(message) &&
        this._isMentioningAudiobot(message)
    ) {
      console.log(message);
        this._replyWithTrack(message);
    }
};

Audiobot.prototype._isChatMessage = function (message) {
    return message.type === 'message' && Boolean(message.text);
};
Audiobot.prototype._isChannelConversation = function (message) {
    return typeof message.channel === 'string' &&
        message.channel[0] === 'C';
};

Audiobot.prototype._isFromAudiobot = function (message) {
    return message.user === this.user.id;
};

Audiobot.prototype._isMentioningAudiobot = function (message) {
    return message.text.toLowerCase().indexOf('audiobot') > -1 ||
        message.text.toLowerCase().indexOf(this.name) > -1 ||
        message.text.toLowerCase().indexOf('abot ') >  -1;
};

Audiobot.prototype._replyWithTrack = function (originalMessage) {
    var channel = this._getChannelById(originalMessage.channel);
    console.log(originalMessage);
    if(originalMessage.text.indexOf('help') > -1) {
      this.postMessageToChannel(channel.name, "Say my name (or 'abot' for short) and 1 or 2 words and I'll try to find a rapper sound", {as_user: true});

    } else {
      var query = originalMessage.text.replace(/audiobot/g, '').replace(/@audiobot/g, '')
      var queryTerms = query.split(' ').filter(function(term) {
        if(term) {return term.trim().length > 0;}
      });
      console.log(queryTerms);
      var term1;
      var term2;
      var soundMatches1 = [];
      var soundMatches2 = [];
      var bestMatch;
      if(queryTerms[0]) {term1 = queryTerms[0].trim();}
      console.log(term1);
      if(queryTerms[1]) {term2 = queryTerms[1].trim();}
      console.log(term2);
      if(term1) {
        var sounds1 = JSON.parse(JSON.stringify(db.sounds));
        soundMatches1 = sounds1.filter(function(sound) {
          return sound.indexOf(term1) > -1;
        });
        console.log(soundMatches1)
        if(term2) {
          var sounds2 = JSON.parse(JSON.stringify(db.sounds));
          soundMatches2 = sounds2.filter(function(sound) {
            return sound.indexOf(term2) > -1;
          });
          console.log('soundMatches2', soundMatches2);

          bestMatch = soundMatches1.find(function(n) {
            return soundMatches2.indexOf(n) != -1;
          });
          console.log('bestMatch', bestMatch);
        }
      }
      // console.log('soundMatches1', soundMatches1[0]);
      // console.log('soundMatches2', soundMatches2[0]);
      var matchedSound = bestMatch || soundMatches1[Math.floor(Math.random()*soundMatches1.length)] || soundMatches2[Math.floor(Math.random()*soundMatches2.length)];
      var message = matchedSound ? "https://soundcloud.com/user-199138496/" + matchedSound : 'Sorry, there was no match for any of your first two words.';
      var self = this;
      var channel = self._getChannelById(originalMessage.channel);
      self.postMessageToChannel(channel.name, message, {as_user: true});
    }

};
Audiobot.prototype._getChannelById = function (channelId) {
    return this.channels.filter(function (item) {
        return item.id === channelId;
    })[0];
};
