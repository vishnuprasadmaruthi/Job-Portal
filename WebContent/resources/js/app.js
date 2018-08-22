define([
    'angular',
    
    'angular-route',
    'ui-grid',
    'angular-touch',
    'angular-resource',
    'jquery',
    'bootstrap',
    'ui-bootstrap',
   'angular-spinner',
   'angular-animate',
   'angular-print',//this js file defines the angular app
    'ng-dialog',
    './controllers/index',
    './directives/index',
    './services/index',
    './constants/index'
], function (ng) {
    'use strict';

    return ng.module('app', 
        [
        'angucomplete-alt',
        'firebase',
        'ngRoute',
        'ui.grid',
        'ui.grid.selection', 
        'ui.grid.exporter',
        'ui.grid.pagination',
        'ui.grid.edit',
        'ngTouch',
        'ngResource',
        'ui.bootstrap',
        'ui.bootstrap.transition',
        'angularSpinner',
        'ngAnimate',
        'ngDialog',
        'app.services',
        'app.controllers',
        'app.directives',
        'app.constants',
        'AngularPrint'//Here we are  giving the module dependency..!!!!How to get the name of the Dependency..????

            ]);
});