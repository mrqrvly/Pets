//  GULP FILE
//  =========

//  Dependencies
//  ------------
var gulp = require('gulp'),
    less = require('less'),
    gls  = require('gulp-live-server');

//  Transpile LESS into CSS
//  -----------------------
gulp.task('less', function() {
  gulp.src('./app/public/less/style.less')
    .pipe(less())
    .pipe(gulp.dest('./app/public/css'));
});

//  Run local server
//  ----------------
gulp.task('server', function() {
  var server = gls('./config.ru', {NODE_ENV: 'development', PORT: 3000});
  server.start();
  gulp.watch(['gulpfile.js', 'config.ru', './app/controllers/**/*.rb'], function() {
    server.start.bind(server)()
  });
});

//  Watch for file changes
//  ----------------------
gulp.task('watch', function() {
  gulp.watch(['./app/public/less/modules/**/*.less'], ['less']);
});

//  Default task
//  ------------
gulp.task('default', ['watch', 'server']);
