<%@page language="java" import="java.sql.*"%>
<%
Driver DriverRecordset1 = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb?user=root&password=password");
Statement StatementRecordset1 = Conn.createStatement();
String inputName = request.getParameter("name");
ResultSet Recordset1 = StatementRecordset1.executeQuery("SELECT * FROM patient WHERE name LIKE '%"+ inputName + "%'");

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
    <a href="index.jsp" class="btn btn-default">Back</a>
    <form class="form-horizontal" action="searchpatients.jsp" method="get">
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-4">
          <input name="name" type="name" class="form-control" id="inputEmail3">
        </div>
      </div>
      <button name="search" type="submit" class="btn btn-default">Search Patients</button>
    </form>
    <table class="table table-striped">
	    <tr>
          <td>
            Name
          </td>
          <td>
			DoB
          </td>
          <td>
            Address
          </td>
          <td>
            Sex
          </td>
		  <td>
			Phone
		  </td>
      <td>
        Create Appointment
      </td>
        </tr>
        <%
          while(Recordset1.next()){
            String currentpID = Recordset1.getString("pID");

        %>
        <tr>
          <td>
            <%= Recordset1.getString("name") %>
          </td>
          <td>
            <%= Recordset1.getString("dateofbirth") %>
          </td>
          <td>
            <%= Recordset1.getString("address") %>
          </td>
          <td>
            <%= Recordset1.getString("sex") %>
          </td>
		  <td>
			<%= Recordset1.getString("telno") %>
		  </td>
          <td>
			<form method="link" action="searchcaregivers.jsp">
				<button name="patientID" type="submit" class="btn btn-default" value="<%= currentpID %>" > Find Caregiver</button>
			</form>
          </td>
          <td>
            <form action="getappts.jsp">
              <button name="caregiverID" type="submit" class="btn btn-default">Show Appointments</button>
            </form>
          </td>
        </tr>
        <%
		  }
		  Conn.close();
		  StatementRecordset1.close();
        %>
    </table>
</div>

<script>
function storeSelection(input) {
	sessionStorage.setItem("selectedpID", input);
}
</script>
</body>
</html>
