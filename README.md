# fme-calendar 
A simple html5/angularjs month calendar based on angular material

Tested with karma/chai/sinon
#Install
```
bower install fme-calendar
```
Inject the module into your angular app
```js
angular.module('your-app',['fme-calendar'])
```

Add the css and js files to your project
```html
<link href='bower_components/fme-tour/fme-calendar.css' rel='stylesheet'></link>
<script type='text/javascript' src='bower_components/fme-tour/fme-calendar.js'></script>
```
#Usage
Create a constant with the tour options
```js
angular.module('fmeCalendarExample', ['fme-calendar']);
angular.module('fmeCalendarExample').config(function($sceProvider){
  $sceProvider.enabled(false);
});
```
Add the directive to the page
```html
<!-- place the following anywhere you want the directive to take effect. The attribute should be set to the name of the tour constant you want to use. Make sure you have elements matching the selector attributes from the tour constant hash." -->
<fme-calendar></fme-calendar>

```

#Developer Info
- git hooks do not git pushed to github
- So, run 
``` cp git-hooks/. .git/hooks/. ```
  - you may need to run chmod +x against each of these files
- Don't forget to run ```npm install and bower install```
- when you are happy with everything submit a new tag ```git tag -a v1.0.2 -m 'Added new callback for calendar'``` ```git --tags push origin --tags```
  - This is necessary to get your changes when the users run bower install or bower update 


##Run the tests locally
  - Install HomeBrew
    ```ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```
  - Install npm
    ```brew install node```
  - Install Karma
    ```npm install karma```
  - Run Karma tests
    ```npm test```
