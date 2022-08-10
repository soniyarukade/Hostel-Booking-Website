<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<script>
function myFunction() {
  alert("Added Successfully");
}
</script>

<h2>Enter Your Hostel Details</h2>
<br>
<div class="container">
  <form action="add_hostel_action.jsp" onsubmit = "myFunction()" method="post">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">Hostel Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="hostel_name" placeholder="Hostel name" required>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country">Country</label>
      </div>
      <div class="col-75">
        <select id="country" name="country">
          <option value="india">India</option>
        </select>
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="country">State</label>
      </div>
      <div class="col-75">
        <select id="country" name="state">
          <option value="maharashtra">Maharashtra</option>
        </select>
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="lname">Location (Area)</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="location" placeholder="Enter locality" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">Address</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="hostel_address" placeholder="Address." required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">Contact no.</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="contact" placeholder="Contact no." required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">1_sharing</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="1_sharing" placeholder="Enter beds available" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">2_sharing</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="2_sharing" placeholder="Enter beds available" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">3_sharing</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="3_sharing" placeholder="Enter beds available" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">1_sharing Rent</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="1_sharing_rent" placeholder="Enter rent/month" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">2_sharing Rent</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="2_sharing_rent" placeholder="Enter rent/month" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="lname">3_sharing Rent</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="3_sharing_rent" placeholder="Enter rent/month" required>
      </div>
    </div>
    <div class="row">
    
    <div class="row">
      <div class="col-25">
        <label for="country">For Girls</label>
      </div>
      <div class="col-75">
        <select id="country" name="gender_girl">
          <option value="yes">yes</option>
          <option value="no">no</option>
          
        </select>
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="country">For Boys</label>
      </div>
      <div class="col-75">
        <select id="country" name="gender_boy">
          <option value="yes">yes</option>
          <option value="no">no</option>
          
        </select>
      </div>
    </div>

    
    <div class="row">
      <div class="col-25">
        <label for="subject">Hostel Description</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="description" placeholder="Enter Hostel Facilities..." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>

</body>
</html>
