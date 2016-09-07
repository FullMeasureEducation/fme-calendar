angular.module('fme-calendar', ['ngMaterial'])

angular.module('fme-calendar').directive 'fmeCalendar', ($$mdDateUtil) ->
  restrict: 'E'
  scope: {}
  template: '<md-calendar ng-model="fmeAppointment.date" md-date-filter="disableDate"></md-calendar>'
  link: (scope) ->
    scope.fmeAppointment = {}
    dateUtil = $$mdDateUtil
    today = new Date()
    two_days = dateUtil.incrementDays(today, 2)
    scope.fmeAppointment.date = two_days

    scope.disableDate = (date) ->
      tomorrow = dateUtil.incrementDays(today, 1)
      oneWeek = dateUtil.incrementDays(today, 7)
      !_.includes([Number(tomorrow), Number(oneWeek)], Number(date))