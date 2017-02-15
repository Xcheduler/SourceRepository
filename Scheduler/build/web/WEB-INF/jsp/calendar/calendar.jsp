<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Full Calendar - Ace Admin</title>

        <meta name="description" content="with draggable and editable events" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <%
            String result=(String)request.getAttribute("Result");
            %>
        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

        <!-- page specific plugin styles -->
        <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
        <link rel="stylesheet" href="assets/css/fullcalendar.min.css" />

        <!-- text fonts -->
        <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

        <!-- ace styles -->
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

        <!--[if lte IE 9]>
                <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
        <![endif]-->


        <!--[if lte IE 9]>
          <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->


        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <script type="text/javascript" src="js/product.js"></script>
    <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
               
 
            </script>

    <body class="no-skin">
        <div class="main-container ace-save-state" id="main-container">
            


            <div class="main-content">
                <div class="main-content-inner">


                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <div class="row">
                                    <div class="col-sm-9">
                                        <div class="space"></div>

                                        <div id="calendar"></div>
                                    </div>

                                    <div class="col-sm-3">
                                        <div class="widget-box transparent">
                                            <div class="widget-header">
                                                <h4>Draggable events</h4>
                                            </div>

                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <div id="external-events">
                                                        <div class="external-event label-grey" data-class="label-grey">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 1
                                                        </div>

                                                        <div class="external-event label-success" data-class="label-success">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 2
                                                        </div>

                                                        <div class="external-event label-danger" data-class="label-danger">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 3
                                                        </div>

                                                        <div class="external-event label-purple" data-class="label-purple">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 4
                                                        </div>

                                                        <div class="external-event label-yellow" data-class="label-yellow">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 5
                                                        </div>

                                                        <div class="external-event label-pink" data-class="label-pink">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 6
                                                        </div>

                                                        <div class="external-event label-info" data-class="label-info">
                                                            <i class="ace-icon fa fa-arrows"></i>
                                                            My Event 7
                                                        </div>

                                                        <label>
                                                            <input type="checkbox" class="ace ace-checkbox" id="drop-remove" />
                                                            <span class="lbl"> Remove after drop</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- PAGE CONTENT ENDS -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.page-content -->
                </div>
            </div><!-- /.main-content -->


        </div><!-- /.main-container -->

        <!-- basic scripts -->

        <!--[if !IE]> -->
        <script src="assets/js/jquery-2.1.4.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
        <script type="text/javascript">
                if ('ontouchstart' in document.documentElement)
                    document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- page specific plugin scripts -->
        <script src="assets/js/jquery-ui.custom.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/fullcalendar.min.js"></script>
        <script src="assets/js/bootbox.js"></script>

        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            var json=<%=result%>;
                jQuery(function ($) {

                    /* initialize the external events
                     -----------------------------------------------------------------*/

                    $('#external-events div.external-event').each(function () {

                        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                        // it doesn't need to have a start or end
                        var eventObject = {
                            title: $.trim($(this).text()) // use the element's text as the event title
                        };

                        // store the Event Object in the DOM element so we can get to it later
                        $(this).data('eventObject', eventObject);

                        // make the event draggable using jQuery UI
                        $(this).draggable({
                            zIndex: 999,
                            revert: true, // will cause the event to go back to its
                            revertDuration: 0  //  original position after the drag
                        });

                    });




                    /* initialize the calendar
                     -----------------------------------------------------------------*/

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
                        events: json
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
                                    newEventAdd("addNew",title,start,end);
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
                                 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Update</button>\
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
                            modal.find('form').on('submit', function (ev) {
                                ev.preventDefault();

                                calEvent.title = $(this).find("input[type=text]").val();
                                calendar.fullCalendar('updateEvent', calEvent);
                                modal.modal("hide");
                                newEventAdd("update",calEvent.title);
                            });
                            modal.find('button[data-action=delete]').on('click', function () {
                                calendar.fullCalendar('removeEvents', function (ev) {
                                    newEventAdd("delete",calEvent._id);
                                    return (ev._id == calEvent._id);
                                })
                                modal.modal("hide");
                            });

                            modal.modal('show').on('hidden', function () {
                                modal.remove();
                            });


                            //console.log(calEvent.id);
                            //console.log(jsEvent);
                            //console.log(view);

                            // change the border color just for fun
                            //$(this).css('border-color', 'red');

                        }

                    });


                })
        </script>
    </body>
</html>
