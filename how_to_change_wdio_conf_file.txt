if you want to use mocha/chai put :
```
Add 
    before: function() {
        var chai = require('chai');
        global.expect = chai.expect;
        chai.Should();
    },
```
into your wdio.conf.js 


If you want better reporters:
```
    reporters: ['dot','spec','junit','json'],
    reporterOptions: {
    outputDir: './reports'
    },
```
