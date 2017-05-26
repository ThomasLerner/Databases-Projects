<%@page language="java" import="java.sql.*"%>
<%
Driver DriverRecordset1 = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb?user=root&password=password");
if (request.getParameter("submit") != null) {
  String name = request.getParameter("name");
  String address = request.getParameter("address");
  String dOB = request.getParameter("date");
  String sex = request.getParameter("sex");
  String telnumber = request.getParameter("telNumber");
  String email = request.getParameter("email");
  String insurance = request.getParameter("insurance");
  try {
    PreparedStatement stmt = Conn.prepareStatement("INSERT INTO patient (dateOfBirth,sex,name,address,insuranceID,telno,email) VALUES (?,?,?,?,?,?,?)");
	stmt.setString(1,dOB);
    stmt.setString(2,sex);
    stmt.setString(3,name);
    stmt.setString(4,address);
    stmt.setString(5,insurance);
    stmt.setString(6,telnumber);
    stmt.setString(7,email);
    stmt.executeUpdate();
	stmt.close();
  } catch (SQLException e){

  } finally {
    Conn.close();
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
<Body>
<a href="index.jsp" class="btn btn-default">Back</a>
Patient Submitted!
</Body>
<html>