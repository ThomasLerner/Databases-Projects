<%@page language="java" import="java.sql.*"%>
<%
Driver DriverRecordset1 = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb?user=root&password=password");
Statement StatementRecordset1 = Conn.createStatement();
if (request.getParameter("patientID") != null) {
	session.setAttribute("storedpID",request.getParameter("patientID"));
}
String inputName = (String) session.getAttribute("storedpID");
String query = "SELECT * FROM Caregiver c, Building b, Reserves r INNER JOIN Patient ON Patient.pID = r.pID WHERE Patient.pID = " + inputName + " AND c.eID = r.eID AND b.bID = r.bID";
ResultSet Recordset1 = StatementRecordset1.executeQuery(query);
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
    <a href="searchpatients.jsp" class="btn btn-default">Back</a>
  	Selected Patient pID: <%= (String) session.getAttribute("storedpID") %>
	<table class="table table-striped">
	    <tr>
          <td>
            Caregiver
          </td>
		  <td>
			Building
		  </td>
          <td>
            Date
          </td>
          <td>
            Time
          </td>
        </tr>
    <table class="table table-striped">
        <%
          while(Recordset1.next()){
        %>
        <tr>
			<td>
			<%= Recordset1.getString("c.name") %>
			</td>
			<td>
			<%= Recordset1.getString("b.name") %>
			</td>
			<td>
			<%= Recordset1.getString("date") %>
			</td>
			<td>
			<%= Recordset1.getString("time") %>
			</td>
        </tr>
        <%
		  }
		  Conn.close();
		  StatementRecordset1.close();
        %>
    </table>
</div>
</body>
</html>
