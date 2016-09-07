Q = require 'q'
execWithCallbacks = require('./exec_with_callbacks')
convertHamlToHtmlPath = require('./convert_haml_to_html_path')
dirName = require('path').dirname
plugins  = require('gulp-load-plugins')()

convertHamlWithPromise = (filePath) ->
  htmlPath = convertHamlToHtmlPath(filePath)
  plugins.util.log plugins.util.colors.green("HAML converting (#{filePath}) to (#{htmlPath})")
  deferred = Q.defer()
  deferred.promise.fail (errorMessage) ->
    plugins.util.log plugins.util.colors.red("HAML convert failed, #{errorMessage}")
  deferred.promise.then ->
    plugins.util.log plugins.util.colors.green("HAML converted (#{filePath}) to (#{htmlPath})")
  execWithCallbacks "mkdir -p #{dirName(htmlPath)}", deferred.reject, ->
    execWithCallbacks "haml #{filePath} #{htmlPath}", deferred.reject, deferred.resolve
  deferred.promise

module.exports = convertHamlWithPromise
