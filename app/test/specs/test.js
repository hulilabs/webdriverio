var assert = require('assert');

describe('my awesome website', function() {
    it('should do some chai assertions', function() {
        browser.url('/');
        browser.getTitle().should.be.equal('Google');
    });
});
