
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <a href="index.jsp" class="btn btn-default">Back</a>
	  <form class="form-horizontal" action="patientsubmit.jsp">
      <div class="form-group">
        <label for="inputName" class="col-sm-2 control-label">*Name</label>
        <div class="col-sm-4">
          <input name="name" type="text" class="form-control" placeholder="First Last" pattern=".{3,}" required title="3 characters minimum">
        </div>
      </div>
      <div class="form-group">
        <label for="inputAddress" class="col-sm-2 control-label">*Address</label>
        <div class="col-sm-4">
          <input name="address" type="text" class="form-control" pattern=".{3,}" required title="3 characters minimum">
        </div>
      </div>
      <div class="form-group">
        <label for="inputDate" class="col-sm-2 control-label">*Date of Birth</label>
		<div class="col-sm-4">
			<input name="date" type="text" class="form-control" placeholder="MM/DD/YYYY" onkeypress="return isNumberOrSlash(event)" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}" required title="Must be in format MM/DD/YYYY">
		</div>
      </div>
      <div class="form-group">
        <label for="inputSex" class="col-sm-2 control-label">*Sex</label>
        <div class="col-sm-4">
          <select name="sex" class="form-control">
            <option>F</option>
            <option>M</option>
          </select>
        </div>
      </div>

      <div class="form-group">
        <label for="inputTelNo" class="col-sm-2 control-label">Phone Number</label>
        <div class="col-sm-4">
          <input name="telNumber" type="tel" class="form-control" onkeypress="return isNumber(event)" pattern=".{0}|.{10}" title="If used, must be 10 digits" />
        </div>
      </div>
      <div class="form-group">
        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-4">
          <input name="email" type="email" class="form-control" placeholder="something@example.com">
        </div>
      </div>
      <div class="form-group">
        <label for="inputInsurance" class="col-sm-2 control-label">Insurance ID</label>
        <div class="col-sm-4">
          <input name="insurance" type="name" class="form-control" maxlength="11" onkeypress="return isNumber(event)" >
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button name="submit" type="submit" class="btn btn-default">Create Patient</button>
        </div>
      </div>
    </form>
  </div>


</body>

<script>
function isNumber(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if(charCode > 31 && (charCode < 48 || charCode > 57)){
		return false};
	return true;
}
function isNumberOrSlash(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if(charCode > 31 && (charCode < 47 || charCode > 57)){
		return false};
	return true;
}
</script>

</html>
