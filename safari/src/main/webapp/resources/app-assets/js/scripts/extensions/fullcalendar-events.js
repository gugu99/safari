/*=========================================================================================
    File Name: fullcalendar.js
    Description: Fullcalendar
    --------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/


$(document).ready(function(){

	/************************************************
	*				Background Events				*
	************************************************/
	

	// /********************************************
	// *				Events Colors				*
	// ********************************************/
	let tasks = null;
	
	$.ajax({
		async : 'false',
		type : 'get',
		url : '/member/restCalendar',
		success : function(json) {
			console.log(json);
			tasks = json;
			
			const date = new Date();
			var calendarE5 = document.getElementById('fc-event-colors');
		    var fcEventColors = new FullCalendar.Calendar(calendarE5, {
				header: {
					left: 'prev,next today',
					center: 'title',
					right: "dayGridMonth,timeGridWeek,timeGridDay"
				},
				defaultDate: date,
				businessHours: true, // display business hours
				navLinks: true, // can click day/week names to navigate views
				plugins: [ 'dayGrid', 'timeGrid', "interaction"],
				editable: true,
				events: tasks
				
				
			});
		
			console.log(date);
			fcEventColors.render();
		} // end success
	}); // end ajax
	console.log(tasks);
	
});