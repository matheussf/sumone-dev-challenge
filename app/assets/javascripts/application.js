// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require gritter
//= require rails-ujs
//= require turbolinks
//= require_tree .



$(document).on('turbolinks:load', ready);
$(document).on("turbolinks:load", function() {
    var slider = new Slider("#alcoholLevel");    
    var menuButton = document.querySelector('.menu__button');
    var menu = document.querySelector('#sidebar');
    var notificationMenu = document.querySelector(".bubble");
    var btnSubmit = document.querySelector('#submit__button');
    
    slider.on("slide", function(sliderValue) {
        document.getElementById("alcoholLevelVal").textContent = sliderValue;
    });
    
    menuButton.addEventListener('click', function () {
        menuButton.classList.toggle('open');
        menu.classList.toggle('active')
        notificationMenu.classList.add('close');
    })
    
    $.extend($.gritter.options, { 
        position: 'top-left',
        fade_in_speed: 'medium',
        fade_out_speed: 2000,
    });
    
    setTimeout(() => {
        notificationMenu.classList.add('close');
    }, 5000);
    
    btnSubmit.addEventListener('click', () =>{
        menuButton.classList.toggle('open');
        menu.classList.toggle('active')
    });
});