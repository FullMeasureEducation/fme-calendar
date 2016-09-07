angular.module('fme-calendar', ['ngStorage'])

angular.module('fme-calendar').config ($sceProvider) ->
  $sceProvider.enabled false

angular.module('fme-calendar').directive 'fmeCalendar', ->
  restrict: 'E'
  scope: {}
  link: (scope, element) ->