exec = require('child_process').exec

execWithCallbacks = (command, errorCallBack, successCallBack) ->
  exec command, (error) ->
    if error?
      errorCallBack("command failed: #{command}")
    else
      successCallBack()

module.exports = execWithCallbacks
