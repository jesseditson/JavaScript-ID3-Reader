var ID3 = require('../src/id3');
var assert = require('assert');

var fileurl = "https://s3.amazonaws.com/jufs/Rigsketball/51626431524955/310366246110217957/AndAndAnd_WhiskyShakes.mp3"

ID3.loadTags(fileurl, function() {
    var tags = ID3.getAllTags(fileurl);
    assert.equal(tags.artist, 'And And And');
    assert.equal(tags.album, 'A Real Case of the Blues');
}, {
    onError: function(reason) {
        assert.ifError(reason);
        if (reason.error === "xhr") {
            console.log("There was a network error: ", reason.xhr);
        }
    }
});
