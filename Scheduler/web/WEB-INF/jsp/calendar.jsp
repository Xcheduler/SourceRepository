<%-- 
    Document   : calendar
    Created on : 6 Nov, 2016, 12:58:07 PM
    Author     : sasi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Full Calendar - Ace Admin</title>

        <meta name="description" content="with draggable and editable events" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->

        <!-- page specific plugin styles -->
        <link rel="stylesheet" href="css/calendar/fullcalendar.min.css" />

        <!-- text fonts -->
        <!-- ace styles -->
        <link rel="stylesheet" href="css/calendar/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />



        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body class="nav-md">
        <div class="x_panel newalign">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-sm-9">
                        
                        <div id="calendar"></div>
                    </div>
                    
                </div>

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div>

        <!--[if !IE]> -->
        <script src="js/calendar/jquery-2.1.4.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement)
                document.write("<script src='js/calendar/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="js/calendar/bootstrap.min.js"></script>

        <!-- page specific plugin scripts -->
        <script src="js/calendar/jquery-ui.custom.min.js"></script>
        <script src="js/calendar/moment.min.js"></script>
        <script src="js/calendar/fullcalendar.min.js"></script>
        <script src="js/calendar/bootbox.js"></script>


        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            jQuery(function ($) {
                $('#external-events div.external-event').each(function () {
                    var eventObject = {
                        title: $.trim($(this).text()) // use the element's text as the event title
                    };
                    $(this).data('eventObject', eventObject);
                    $(this).draggable({
                        zIndex: 999,
                        revert: true, // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });

                });

                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();
                var calendar = $('#calendar').fullCalendar({
                    buttonHtml: {
                        prev: '<i class="ace-icon fa fa-chevron-left"></i>',
                        next: '<i class="ace-icon fa fa-chevron-right"></i>'
                    },
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    events: [
                        {
                            title: 'All Day Event',
                            start: new Date(y, m, 1),
                            className: 'label-important'
                        },
                        {
                            title: 'Long Event',
                            start: moment().subtract(5, 'days').format('YYYY-MM-DD'),
                            end: moment().subtract(1, 'days').format('YYYY-MM-DD'),
                            className: 'label-success'
                        },
                        {
                            title: 'Some Event',
                            start: new Date(y, m, d - 3, 16, 0),
                            allDay: false,
                            className: 'label-info'
                        }
                    ]
                    ,
                    /**eventResize: function(event, delta, revertFunc) {
                     
                     alert(event.title + " end is now " + event.end.format());
                     
                     if (!confirm("is this okay?")) {
                     revertFunc();
                     }
                     
                     },*/

                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar !!!
                    drop: function (date) { // this function is called when something is dropped

                        // retrieve the dropped element's stored Event Object
                        var originalEventObject = $(this).data('eventObject');
                        var $extraEventClass = $(this).attr('data-class');


                        // we need to copy it, so that multiple events don't have a reference to the same object
                        var copiedEventObject = $.extend({}, originalEventObject);

                        // assign it the date that was reported
                        copiedEventObject.start = date;
                        copiedEventObject.allDay = false;
                        if ($extraEventClass)
                            copiedEventObject['className'] = [$extraEventClass];

                        // render the event on the calendar
                        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                        // is the "remove after drop" checkbox checked?
                        if ($('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            $(this).remove();
                        }

                    }
                    ,
                    selectable: true,
                    selectHelper: true,
                    select: function (start, end, allDay) {

                        bootbox.prompt("New Event Title:", function (title) {
                            if (title !== null) {
                                calendar.fullCalendar('renderEvent',
                                        {
                                            title: title,
                                            start: start,
                                            end: end,
                                            allDay: allDay,
                                            className: 'label-info'
                                        },
                                true // make the event "stick"
                                        );
                            }
                        });


                        calendar.fullCalendar('unselect');
                    }
                    ,
                    eventClick: function (calEvent, jsEvent, view) {

                        //display a modal
                        var modal =
                                '<div class="modal fade">\
                  <div class="modal-dialog">\
                   <div class="modal-content">\
                         <div class="modal-body">\
                           <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
                           <form class="no-margin">\
                                  <label>Change event name &nbsp;</label>\
                                  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
                                 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
                           </form>\
                         </div>\
                         <div class="modal-footer">\
                                <button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
                                <button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
                         </div>\
                  </div>\
                 </div>\
                </div>';
                        var modal = $(modal).appendTo('body');
                            modal.find('form').on('submit', function (ev) {                             ev.preventDefault();

                            calEvent.title = $(this).find("input[type=text]").val();
                            calendar.fullCalendar('updateEvent', calEvent);
                            modal.modal("hide");
                        });
                                modal.find('button[data-action=delete]').on('click', function () {                             calendar.fullCalendar('removeEvents', function (ev) {                                 return (ev._id == calEvent._id);
                            })
                            modal.modal("hide");
                        });

                            modal.modal('show').on('hidden', function () {                             modal.remove();
                        });
                    }
                });
            })
  </script>
    </body>
</html>
