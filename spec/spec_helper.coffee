window.mock_window_service =
  confirm: ->
  alert: ->
  open: ->
  document:
    getElementById: ->
    height: ->
  location:
    href: 'hello'
    reload: ->

document.mock_document_service = 
  height: ->

beforeEach ->
  module('fme-calendar')
  angular.module('foo', []).config ($provide) ->
    $provide.value '$window',         window.mock_window_service
    $provide.value '$document',         document.mock_document_service
  module 'foo'
