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


If you want to use better reporters put:
```
    reporters: ['dot','spec','junit','json'],
    reporterOptions: {
    outputDir: './reports'
    },
```
into your wdio.conf.js 

Your test reports will be written to ./reports (next to tests). 
