pathJoin = require('path').join
dirName = require('path').dirname
fileName = require('path').basename
plugins  = require('gulp-load-plugins')()

convertHamlToHtmlPath = (filePath) ->
  destinationDirectoryStrings = dirName(filePath).split("src")
  destinationDirectory = "dist/#{destinationDirectoryStrings[destinationDirectoryStrings.length - 1]}"
  pathJoin(destinationDirectory,fileName(filePath).replace('.haml', '.html'))

module.exports = convertHamlToHtmlPath
