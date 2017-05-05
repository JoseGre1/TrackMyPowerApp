// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap
//= require bootstrap-sprockets
//= require magnific-popup
//= require scrollReveal
//= require nprogress
//= require fastclick
//= require icheck
//= require switchery
//= require gauge
//= require skycons
//= require moment
//= require Chart
//= require chartjs-plugin-zoom.min
//= require plotly

/*enables dropdowns*/
$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});
/*enables dropdowns*/
NProgress.start();
NProgress.set(0.4);
//Increment
var interval = setInterval(function() { NProgress.inc(); }, 1000);
$(document).ready(function(){
    NProgress.done();
    clearInterval(interval);
});
//Ajax calls
function ajax_call(type, variable, url, func, units) {
  $.ajax({
    url: url,
    type: 'GET',
    dataType: type,
    data: {
      variable: variable,
      units: units
    },
    beforeSend: function(req) {
      req.setRequestHeader('Authorization', 'Basic ' + btoa('admin:uninorte'));
    },
    cache: false,
    success: function(data){
      func(data);
    }
  });
}
//= require_tree ./sitewide
