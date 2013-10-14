// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-pl
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .

history.navigationMode = 'compatible';

$(document).ready( function() {
	$('textarea').autosize();

    $('tbody > tr:not(.nolink)').click( function() {
        window.location = $(this).find('a').attr('href');
    }).hover( function() {
        $(this).toggleClass('hover');
    });

    if(!Modernizr.inputtypes.date){
    	var _dateoptions = { dateFormat: "yy-mm-dd" }
    	$('#training_end_date').datepicker(_dateoptions);
    	$('#training_begin_date').datepicker(_dateoptions);
    }
});

