const gulp = require('gulp');
const liveServer = require('live-server');
const $ = require('gulp-load-plugins')({});

function watchElmAndRun(...args) {
  return gulp.watch('**/*.elm', args);
}

gulp.task('build', function() {
  return gulp.src('src/App.elm')
    .pipe($.plumber({
      errorHandler: $.notify.onError({ sound: false, message: 'Elm error' })
    }))
    .pipe($.elm.bundle('App.js', {
      warn: true,
      debug: true
    }))
    .pipe(gulp.dest('build/'));
});

gulp.task('start', ['build'], function() {
  watchElmAndRun('build');
});

gulp.task('serve', function() {
  liveServer.start({
    port: 3000,
    host: 'localhost',
    open: false,
    ignore: /elm-stuff/,
    file: 'index.html'
  });
});