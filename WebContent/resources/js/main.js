require.config({

  // alias libraries paths


    /*paths: {
        'domReady': '../lib/requirejs-domready/domReady',
        'angular': '../lib/angular/angular',
        'angular-route':'../lib/angular-route/angular-route',
        'ui-grid':'../lib/angular-ui-grid/ui-grid',
        'angular-touch':'../lib/angular-touch/angular-touch',
        'angular-resource':'../lib/angular-resource/angular-resource',
        'jquery':'../lib/jquery/dist/jquery',

        'ui-bootstrap':'../lib/angular-ui-bootstrap/ui-bootstrap-tpls',

         'spin':'../lib/angular-spinner/spin',

        'angular-spinner':'../lib/angular-spinner/angular-spinner',
        'angular-animate':'../lib/angular-animate/angular-animate',

        'ng-dialog':'../lib/ng-dialog/js/ngDialog',
        'angular-print':'../lib/angular-print/angularPrint'///just give the location of the angular-print


    },*/

    // angular does not support AMD out of the box, put it in a shim
    shim: {
        'angular': {
            exports: 'angular'
        },

        'ui-grid':
        {
        
            deps: ['angular']
        },
       
        
        'ng-dialog':
        {
            deps : ['angular']
        }
        
    }

 
   
});