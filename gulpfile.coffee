require('coffee-script/register')
gulp     = require('gulp')
gutil     = require('gutil')
coffee = require('gulp-coffee')
sass = require('gulp-sass')

gulp.task 'default',  ->
  gulp.watch 'fme-calendar.scss', [ 'sass' ]
  gulp.watch 'fme-calendar.coffee', [ 'coffee' ]

gulp.task 'coffee', ->
  gulp.src('./fme-calendar.coffee').pipe(coffee(bare: true).on('error', gutil.log)).pipe gulp.dest('./')

gulp.task 'sass',  ->
  gulp.src(['fme-calendar.scss']).pipe(sass(errLogToConsole: true)).pipe(gulp.dest('./')).pipe gulp.dest('./')

