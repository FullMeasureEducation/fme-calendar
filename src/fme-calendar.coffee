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
    three_days = dateUtil.incrementDays(today, 3)
    scope.fmeAppointment.date = two_days

    scope.disableDate = (date) ->
      console.log date
      tomorrow = dateUtil.incrementDays(today, 1)
      oneWeek = dateUtil.incrementDays(today, 7)
      console.log tomorrow
      console.log _.includes([tomorrow], date)
      !_.includes([Number(tomorrow), Number(oneWeek)], Number(date))