<%@page language="java" import="java.sql.*" import="java.time.LocalDate"%>
<%
Driver DriverRecordset1 = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb?user=root&password=password");

int maxApptsPerBuilding = 5;
if (request.getParameter("caregiverID") != null) {
	session.setAttribute("storedeID",request.getParameter("caregiverID"));
}
String inputeID = (String) session.getAttribute("storedeID");
LocalDate localDate = LocalDate.now();
String localMonth = "" + localDate.getMonthValue();
if(localDate.getMonthValue() < 10) {
	localMonth = "0" + localMonth;
}
String localDay = "" + localDate.getDayOfMonth();
if(localDate.getDayOfMonth() < 10) {
	localDay = "0" + localDay;
}
String inputDate = localMonth + "/" + localDay + "/" + localDate.getYear();
if (request.getParameter("date") != null) {
	inputDate = request.getParameter("date");
}
session.setAttribute("storedDate",inputDate);

Statement StatementRecordset2 = Conn.createStatement();
String findbID = "SELECT * FROM Worksat w WHERE w.eID = " + inputeID;
ResultSet Recordset2 = StatementRecordset2.executeQuery(findbID);
if(Recordset2.next()) {
	session.setAttribute("storedbID",Recordset2.getString("bID"));
}
StatementRecordset2.close();

Statement StatementRecordset1 = Conn.createStatement();
String cgBusy = "SELECT r.time FROM Reserves r WHERE r.eID = " + inputeID + " AND r.date = '" + inputDate +"'";
String overBooked = "SELECT r.time FROM Reserves r INNER JOIN Worksat ON Worksat.bID = r.bID WHERE Worksat.eID = " + inputeID + " AND r.date = '" + inputDate + "' GROUP BY r.time HAVING COUNT(r.time) >= " + maxApptsPerBuilding;
String combine = "(" + cgBusy + ") union (" + overBooked + ")";
ResultSet Recordset1 = StatementRecordset1.executeQuery(combine);

%>
<%!
public static boolean unavailable(int i, ResultSet Record) {
	try {
		while(Record.next()) {
			if(Record.getInt("time") == i*100 || Record.getInt("time") == i*100) {
				
				Record.beforeFirst();
				return true;
			}
		}
		Record.beforeFirst();
		return false;
	}
	catch(SQLException e){
		return false;
	}
}

%>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>

<div class="container">
    <a href="searchcaregivers.jsp" class="btn btn-default">Back</a>
	Selected Patient pID: <%= (String) session.getAttribute("storedpID") %>
	Selected Caregiver eID: <%= (String) session.getAttribute("storedeID") %>
	
	<form class="form-horizontal" action="appointment.jsp">
      <div class="form-group">
        <label for="inputDate" class="col-sm-2 control-label">Appointment Date</label>
		<div class="col-sm-4">
			<input name="date" type="text" class="form-control" placeholder="MM/DD/YYYY" onkeypress="return isNumberOrSlash(event)" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}" required title="Must be in format MM/DD/YYYY">
		</div>
      </div>
		<div class="col-sm-offset-2 col-sm-10">
			<button name="date" type="submit" class="btn btn-default">Search Date</button>
        </div>
      </div>
	</form>
	<table class="table table-striped">
	    <tr>
          <td>
            Date
          </td>
          <td>
			Time
          </td>
        </tr>
        <% 
		//Assuming hours are from 10:00AM to 6:00PM 
		  for(int i = 10; i < 18; i++) {
			  if(!unavailable(i,Recordset1)) {
        %>
        <tr>
          <td>
		  <%= inputDate %>
		  </td>
		  <td>
		  <%= i %>:00
		  </td>
          <td>
		  <form action="submitappointment.jsp">
			<button name="time" type="submit" value="<%= i*100 %>" class="btn btn-default">Create Appointment</button>
          </td>
        </tr>
        <%
			  }
		  }
		  Conn.close();
		  StatementRecordset1.close();
		%>
    </table>
	
</div>

<script>
function isNumberOrSlash(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if(charCode > 31 && (charCode < 47 || charCode > 57)){
		return false};
	return true;
}
</script>
</body>
</html>