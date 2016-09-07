gulp      = require('gulp')
plugins  = require('gulp-load-plugins')()
coffee    = require('gulp-coffee')
paths   = require('../helpers/config').paths

gulp.task 'coffee', ->
  gulp.src(paths.coffee).pipe(coffee(bare: true).on('error', plugins.util.log)).pipe gulp.dest('./dist/')
