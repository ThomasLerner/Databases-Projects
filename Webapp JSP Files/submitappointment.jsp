<%@page language="java" import="java.sql.*"%>
<%
Driver DriverRecordset1 = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb?user=root&password=password");
if (request.getParameter("time") != null) {
  String pID = (String) session.getAttribute("storedpID");
  String eID = (String) session.getAttribute("storedeID");
  String bID = (String) session.getAttribute("storedbID");
  String date = (String) session.getAttribute("storedDate");
  String time = request.getParameter("time");
  try {
    PreparedStatement stmt = Conn.prepareStatement("INSERT INTO reserves (pID,eID,bID,date,time) VALUES (?,?,?,?,?)");
	stmt.setString(1,pID);
    stmt.setString(2,eID);
    stmt.setString(3,bID);
    stmt.setString(4,date);
    stmt.setString(5,time);
    stmt.executeUpdate();
	stmt.close();
  } catch (SQLException e){

  } finally {
    Conn.close();
  } 
}

%>
<HTML>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<Body>
<a href="index.jsp" class="btn btn-default">Back</a>
Appointment Submitted!
</Body>
</HTML>