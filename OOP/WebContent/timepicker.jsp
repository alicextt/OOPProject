<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>
<head>
<title>Date Picker</title>
<sj:head />
</head>

<body>
	<h3>Struts2 Date Picker example</h3>
	<s:form action="dateTimePicker" theme="xhtml">
		<sj:datepicker id="1" name="simpleCalander" displayFormat="dd-mm-yy"
			label="SimpleCalander" />
		<sj:datepicker id="2" name="changeYear" displayFormat="dd-mm-yy"
			changeYear="true" label="ChangeYear" />
		<sj:datepicker id="3" name="changeYearAndMonth"
			label="Change Month and Year" changeMonth="true" changeYear="true" />
		<sj:datepicker id="4" name="showSeconds" label="Show Seconds"
			timepicker="true" timepickerShowSecond="true"
			timepickerFormat="hh:mm:ss" />
		<sj:datepicker id="5" name="withPannel" label="With Button Panel"
			showButtonPanel="true" />
		<sj:datepicker id="6" name="slideDownEffect"
			label="With fast slideDown Animation" showAnim="slideDown"
			duration="fast" />
		<sj:datepicker id="7" name="fadeInEffect"
			label="With slow fadeIn Animation" showAnim="fadeIn"
			showOptions="{direction: 'up' }" duration="slow" />
		<sj:datepicker id="8" name="yearRage"
			label="Show Years only from 2000 until 2020" yearRange="2000:2020"
			changeYear="true" />
		<sj:datepicker id="9" name="withOutButton" label="Without Button"
			showOn="focus" />

		<s:submit value="submit" name="submit" />
	</s:form>
</body>
</html>