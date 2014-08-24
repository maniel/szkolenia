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
    history.navigationMode = 'compatible';


    $('input.active').live('change', function(act_id) {
        $.ajax({
            url: "/training/toggle_active",
            beforeSend: function() { alert("Hi") },
            data: "id="+act_id, 
            success: function() { alert('Bye') }
        });
    });
    

	$('textarea').autosize();

    $('tbody > tr > td:not(.nolink)').click( function() {
        window.location = $(this).parent().find('a').attr('href');
    });

    $('tbody > tr').hover( function() {
        $(this).toggleClass('hover');
    });

    if(!Modernizr.inputtypes.date){
    	var _dateoptions = { dateFormat: "yy-mm-dd" }
    	$("input[type='date']").datepicker(_dateoptions);
    }

    $(".tabs").idTabs(function(id,list,set){
        if(id == "#lokalizacja"){
            var _address = $("#lokalizacja #mapa").html().trim();
            var _address_search = '<div style="text-align: center;"><a href="https://www.google.pl/maps?q='
                                    +encodeURI(_address)+
                                    '" target="_blank" title="Kliknij aby przejść do Map Google (otwiera nowe okno)">'
                                    +_address+'</a> </div>';
            $("#mapa").gmap3({
                map: {
                    address: _address,
                    options: {
                        zoom: 16,
                        maxZoom: 20,
                    }
                },
                marker: {
                    address: _address,
                    data: _address_search,
                    events:{
                        click: function(marker, event, context){
                            var map = $(this).gmap3("get"),
                                infowindow = $(this).gmap3({get: {name: "infowindow"}});
                            if (infowindow) {
                                infowindow.open(map, marker);
                                infowindow.setContent(context.data);
                            } else {
                                $(this).gmap3({
                                    infowindow: {
                                        anchor: marker,
                                        options: {
                                            content: context.data,
                                            maxWidth: 400                                                
                                        }
                                    }
                                });
                            }
                        }
                    },
                    callback: function(marker){
                        var map = $(this).gmap3("get"),
                            infowindow = $(this).gmap3({get: {name: "infowindow"}});
                        if (infowindow) {
                            infowindow.open(map, marker);
                            infowindow.setContent(_address_search);
                        } else {
                            $(this).gmap3({
                                infowindow: {
                                    anchor: marker,
                                    options: {
                                        content: _address_search,
                                        maxWidth: 400                                                
                                    }
                                }
                            });
                        }
                    }
                },
            })
        }
        return true;
    });
});
