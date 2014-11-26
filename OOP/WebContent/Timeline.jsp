<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://simile.mit.edu/timeline/api/timeline-api.js"
	type="text/javascript"></script>

<title>Insert title here</title>
</head>
<body onload="onLoad();" onresize="onResize();">
	<div id="my-timeline" style="height:200px;width: 80%; border: 1px solid #aaa"></div>

</body>

<%String x="Sat May 20 2010 00:00:00 GMT-0600";
%>

<script type="text/javascript">
var timeline_data = {  // save as a global variable
		'dateTimeFormat': 'Gregorian',
		'wikiURL': "http://simile.mit.edu/shelf/",
		'wikiSection': "Simile Cubism Timeline",

		'events': [
		           {
		              'start':"<%=x%>",
		              'title':"Project 1 started",
		              'durationEvent':false // Notes: not "false". And no trailing
											// comma.
		            }, {
		              'start':"Wed May 01 2010 00:00:00 GMT-0600" ,
		              'end':"Sat Jun 01 2010 00:00:00 GMT-0600" ,
		              'durationEvent':true,
		              'title':"Project 2",
		              'description':"Oswald moves to New Orleans, and finds employment at the William B. Riley Coffee Company. <i>ref. Treachery in Dallas, p 320</i>"
		            }
		]
		}
</script>

<script>
	var tl;
	function onLoad() {
		var eventSource = new Timeline.DefaultEventSource();
		
		var theme1 = Timeline.ClassicTheme.create();
		theme1.autoWidth = true; // Set the Timeline's "width" automatically.
		// Set autoWidth on the Timeline's first band's theme,
		// will affect all bands.
		theme1.timeline_start = new Date(Date.UTC(1890, 0, 1));
		theme1.timeline_stop = new Date(Date.UTC(2160, 0, 1));
		
		var bandInfos = [ Timeline.createBandInfo({
			eventSource : eventSource,
			date : "Jun 28 2010 00:00:00 GMT",
			width : "70%",
			intervalUnit : Timeline.DateTime.MONTH,
			intervalPixels : 100,
			theme : theme1,
			layout : 'original' // original, overview, detailed


		}), Timeline.createBandInfo({
			date : "Jun 28 2010 00:00:00 GMT",
			width : "30%",
			intervalUnit : Timeline.DateTime.YEAR,
			intervalPixels : 200
		}) ];

		bandInfos[1].syncWith = 0;
		bandInfos[1].highlight = true;

		tl = Timeline.create(document.getElementById("my-timeline"), bandInfos);
		
		var url = '.'; // The base url for image, icon and background image references in the data
		eventSource.loadJSON(timeline_data,url); // The data was stored into the timeline_data variable.
	}

	var resizeTimerID = null;
	function onResize() {
		if (resizeTimerID == null) {
			resizeTimerID = window.setTimeout(function() {
				resizeTimerID = null;
				tl.layout();
			}, 500);
		}
	}
</script>

</html>