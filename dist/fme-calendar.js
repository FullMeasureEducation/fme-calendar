angular.module('fme-calendar', ['ngMaterial']);

angular.module('fme-calendar').directive('fmeCalendar', function($$mdDateUtil) {
  return {
    restrict: 'E',
    scope: {},
    template: '<md-calendar ng-model="fmeAppointment.date" md-date-filter="disableDate"></md-calendar>',
    link: function(scope) {
      var dateUtil, three_days, today, two_days;
      scope.fmeAppointment = {};
      dateUtil = $$mdDateUtil;
      today = new Date();
      two_days = dateUtil.incrementDays(today, 2);
      three_days = dateUtil.incrementDays(today, 3);
      scope.fmeAppointment.date = two_days;
      return scope.disableDate = function(date) {
        var oneWeek, tomorrow;
        console.log(date);
        tomorrow = dateUtil.incrementDays(today, 1);
        oneWeek = dateUtil.incrementDays(today, 7);
        console.log(tomorrow);
        console.log(_.includes([tomorrow], date));
        return !_.includes([Number(tomorrow), Number(oneWeek)], Number(date));
      };
    }
  };
});
