const browserify = require('browserify');
const fs = require('fs');
const path = require('path');

browserify({ entries: [ './src' ] })
    .exclude('codemirror')
    .transform('browserify-shim', {
        'codemirror': { exports: 'CodeMirror' },
        global: true
    })
    .bundle()
    .pipe(fs.createWriteStream(path.join(__dirname, 'build', 'bundle.js'), 'utf8'));