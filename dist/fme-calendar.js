angular.module('fme-calendar', []);

angular.module('fme-calendar').config(function($sceProvider) {
  return $sceProvider.enabled(false);
});

angular.module('fme-calendar').directive('fmeCalendar', function() {
  return {
    restrict: 'E',
    scope: {},
    link: function(scope, element) {}
  };
});
