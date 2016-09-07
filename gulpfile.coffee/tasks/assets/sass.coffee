gulp     = require('gulp')
sass     = require('gulp-sass')
paths   = require('../helpers/config').paths;

gulp.task 'sass',  ->
  gulp.src(paths.sass).pipe(sass(errLogToConsole: true)).pipe(gulp.dest('./dist/')).pipe gulp.dest('./dist/')

