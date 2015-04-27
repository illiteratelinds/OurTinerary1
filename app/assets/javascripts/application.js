// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree ../../../vendor/assets/javascripts/.
//= require owl.carousel
//= require_tree .
$(document).ready(function(){
  setTimeout(function(){
    $('#flash-wrapper').fadeOut();}, 1200);
});
var geocoder;
var map;

function initialize() {
        var geocoder = new google.maps.Geocoder();
        var mapOptions = {
          center: myLatlng,
          zoom: 12
        };
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      }
      // google.maps.event.addDomListener(window, 'load', initialize);
 
function addPin(res) {
  var lat = res[1];
  var lon = res[2];
  var resLatlng = new google.maps.LatLng(res[1], res[2]);

  var marker = new google.maps.Marker({
    map: map,
    position: resLatlng,
  });
}
