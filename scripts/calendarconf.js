$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyDhGjxRiAspvXm93qOXRkHOQCphyYFBHrI',
        events: {
            googleCalendarId: '5sbrf4s4spehi2ssq4apchodp4@group.calendar.google.com',
            eventClick: function(event) {
				// opens events in a popup window
				window.open(event.url, 'gcalevent', 'width=700,height=600');
				return false;
			},// an option!
        },
        loading: function(bool) {
				$('#loading').toggle(bool);
			}
    });
});