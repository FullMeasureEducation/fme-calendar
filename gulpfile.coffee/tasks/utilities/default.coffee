gulp = require('gulp')
convertHamlWithPromise   = require('../helpers/convert_haml_with_promise')
paths   = require('../helpers/config').paths

gulp.task 'default',  ->
  gulp.watch paths.sass, [ 'sass' ]
  gulp.watch paths.coffee, [ 'coffee' ]
  gulp.watch(paths.haml).on 'change', (file) ->
    convertHamlWithPromise(file.path)
