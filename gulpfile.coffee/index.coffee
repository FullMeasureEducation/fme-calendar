require('coffee-script/register')
gulp = require('gulp')

requireDir = require 'require-dir'
requireDir('./tasks', { recurse: true })
