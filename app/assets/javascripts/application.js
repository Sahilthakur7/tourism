// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.raty
//= require ratyrate
//= require turbolinks
//= require tether
//= require highcharts
//= require chartkick
//= require bootstrap
//= require underscore
//= require gmaps/google
//= require_tree .

//javascript for carousel
<script type="text/javascript">

$(document).ready(function(){
    $('.carousel').carousel({
        interval: 8000

    })
});

</script>
    //carousel script over
