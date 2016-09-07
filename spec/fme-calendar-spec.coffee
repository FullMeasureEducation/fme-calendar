describe 'fmeCalendar', ->
  beforeEach inject ($rootScope, $compile, $injector) ->
    @scope = $rootScope.$new()
    @injector = $injector
    @compile = $compile