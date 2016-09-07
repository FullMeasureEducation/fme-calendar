gulp     = require('gulp')
plugins  = require('gulp-load-plugins')()
convertHamlWithPromise   = require('../helpers/convert_haml_with_promise')
convertHamlToHtmlPath = require('../helpers/convert_haml_to_html_path')
paths   = require('../helpers/config').paths
glob = require 'glob'
Q = require 'q'

gulp.task 'haml', (done) ->
  convertHaml = (files) ->
    filePromises = []
    for file in files
      promise = convertHamlWithPromise(file)
      promise.done()
      filePromises.push(promise)
    allFilesPromise = Q.all(filePromises)
    allFilesPromise.then ->
      done()
    allFilesPromise.fail ->
      done()
    allFilesPromise.done()

  allFiles = []
  converted = false
  uniqueSrcFiles = []
  uniqueDstFiles = []
  flattenArray = (a, b) ->
    a.concat(b)
  buildUniqueFileList = (srcPath) ->
    dstPath = convertHamlToHtmlPath(srcPath)
    if uniqueDstFiles.indexOf(dstPath) == -1
      uniqueDstFiles.push dstPath
      uniqueSrcFiles.push srcPath
  checkAllFiles = ->
    return unless allFiles.indexOf(undefined) == -1 && allFiles.length == paths.haml.length && converted == false
    converted = true
    flattenedFiles = allFiles.reduce(flattenArray, [])
    flattenedFiles.forEach(buildUniqueFileList)
    convertHaml(uniqueSrcFiles)
  fileCallback = (error, files, hamlPath) ->
    if error?
      plugins.util.log plugins.util.colors.red("HAML listing failed: #{hamlPath}")
      done()
    else
      allFiles[paths.haml.indexOf(hamlPath)] = files
    checkAllFiles()
  paths.haml.forEach (hamlPath) ->
    glob hamlPath, (error, files) ->
      fileCallback(error, files, hamlPath)
