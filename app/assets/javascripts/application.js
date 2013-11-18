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
//= require gmap3
//= require_tree .

history.navigationMode = 'compatible';

$(document).ready( function() {
    history.navigationMode = 'compatible';

	$('textarea').autosize();

    $('tbody > tr > td:not(.nolink)').click( function() {
        window.location = $(this).parent().find('a').attr('href');
    })
    $('tbody > tr').hover( function() {
        $(this).toggleClass('hover');
    });

    if(!Modernizr.inputtypes.date){
    	var _dateoptions = { dateFormat: "yy-mm-dd" }
    	$("input[type='date']").datepicker(_dateoptions);
    }

    $(".tabs").idTabs();
/*
    $(".tabs").idTabs(function(id,list,set){
        if(id == "#lokalizacja"){
            $("#mapa").gmap3({
                marker: {
                    latLng:[29.132318972825445,81.32052349999992]
                }
            })
        }
        return true;
    });
*/
});
