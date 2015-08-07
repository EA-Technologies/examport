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
//= require materialize-sprockets
//= require jquery.countdownTimer
//= require jquery_ujs
//= require turbolinks

$(document).ready(function(){
  $(".button-collapse").sideNav();


  $("#new_response_set :radio:visible").click(function(){
    $("a.next:visible").removeClass("blue-grey").addClass("orange");
    setTimeout(function(){
      $("a.next:visible").addClass("blue-grey").removeClass("orange");
    }, 2000);
  });

  // $('form').validate({
  //   rules: {
  //     email: {
  //       required: true,
  //       email: true,
  //       maxlength: 50
  //     },
  //     password: {
  //       required: true
  //     }
  //   },
    
  //   messages: {
  //     email: {
  //       required: "Please fill out this field",
  //       email: "Please enter a valid email address"
  //     },
  //     password: {
  //       required: "Please fill out this field"
  //     }
  //   },
  //   highlight: function (element) {
  //     $(element).closest('.field').addClass('error');
  //   },
  //   success: function (element) {
  //     $(element).closest('.field').removeClass('error');
  //   }
  // });

});