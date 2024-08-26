<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Management</title>
    <!--- <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../assets/css/style.css"> --->
<style>
    body {
    font-family: Arial, sans-serif;
    background-image: url('pexels-jake-pnw-1761279.jpg'); /* Replace with your image URL */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.doctor-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.doctor-table th, .doctor-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.doctor-table th {
    background-color: #f2f2f2;
}

.action-links {
    text-align: center;
}

.button {
    display: inline-block;
    padding: 8px 12px;
    text-decoration: none;
    border-radius: 4px;
    font-size: 14px;
}

.add-button {
    background-color: #28a745;
    color: white;
    margin-bottom: 20px;
}

.add-button:hover {
    background-color: #218838;
}

.edit-button {
    background-color: #007BFF;
    color: white;
}

.edit-button:hover {
    background-color: #0056b3;
}

.delete-button {
    background-color: #dc3545;
    color: white;
}

.delete-button:hover {
    background-color: #c82333;
}

.submit-button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    display: block;
    width: 100%;
}

.submit-button:hover {
    background-color: #0056b3;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

.form-group input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}
.action-links {
    display: flex;
    justify-content: center; /* Centers the buttons horizontally */
    gap: 10px; /* Adds space between the buttons */
}

</style>
</head>
<body>
    <cfoutput>
        <section class="h-100 h-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-8 col-xl-6">
                        <div class="card rounded-3">
                            <div class="card-body p-4 p-md-5">
                                <div style="color:white">
                                    <center><h1><u>Doctor Management</u></h1></center>
                                </div>
    
                                <!-- Add New Doctor Button -->
                                <a href="doctor_management.cfm?doctor_id=0" class="button add-button">Add New Doctor</a>  
    
                                <!-- Fetch Existing Doctors -->
                                <cfquery name="Get_Doctors">
                                    SELECT doctor_id, name, specialization, post
                                    FROM doctor_details
                                   
                                </cfquery>
    
                                <!-- Display Doctors in Table -->
                                <table class="doctor-table">
                                    <tr>
                                        <th>Doctor Id</th>
                                        <th>Name</th>
                                        <th>Specialization</th>
                                        <th>Post</th>
                                        <th>Actions</th>
                                        <!--- <th>Appointment Patient_id</th> --->
                                    </tr>
                                    <cfloop query="Get_Doctors">
                                    <tr>
                                        <td>#doctor_id#</td>
                                        <td>#name#</td>
                                        <td>#specialization#</td>
                                        <td>#post#</td>
                                        <td class="action-links">
                                            <a href="doctor_management.cfm?doctor_id=#doctor_id#" class="button edit-button">Edit</a>
                                            <a href="doctor_management.cfm?delete_id=#doctor_id#" class="button delete-button">Delete</a>
                                        </td>
                                      
                                    </tr>
                                    </cfloop>
                                </table>
                                <!-- Display Form Only When Adding or Editing -->
                                <cfif structKeyExists(url, 'doctor_id')>
                                    <cfset doctor_id = 0>
                                    <cfset name = ''>
                                    <cfset specialization = ''>
                                    <cfset post = ''>
    
                                    <!-- If Editing, Fetch Doctor Details -->
                                    <cfif url.doctor_id GT 0>
                                        <cfquery name="Get_Doctor">
                                            SELECT doctor_id, name, specialization, post
                                            FROM doctor_details
                                            WHERE doctor_id = <cfqueryparam value="#url.doctor_id#" cfsqltype="cf_sql_integer">
                                        </cfquery>
                                        <cfif Get_Doctor.recordCount GT 0>
                                            <cfset doctor_id = Get_Doctor.doctor_id>
                                            <cfset name = Get_Doctor.name>
                                            <cfset specialization = Get_Doctor.specialization>
                                            <cfset post = Get_Doctor.post>
                                        </cfif>
                                    </cfif>
    
                                    <!-- Form for Adding or Editing Doctor -->
                                    <cfform name="doctorForm" method="POST" action="doctor_management.cfm">
                                        <cfinput type="hidden" name="doctor_id" id="doctor_id" value="#doctor_id#">
                                        <div class="form-group">
                                            <label for="name">Name:</label>
                                            <cfinput name="name" type="text" id="name" value="#name#" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="specialization">Specialization:</label>
                                            <cfinput name="specialization" type="text" id="specialization" value="#specialization#" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="post">Post:</label>
                                            <cfinput name="post" type="text" id="post" value="#post#" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <cfinput name="submitBtn" type="submit" id="submitBtn" value="Submit" class="button submit-button">
                                        </div>
                                    </cfform>
                                </cfif>
    
                                <!-- Backend Logic for Inserting/Updating Doctor -->
                                <cfif structKeyExists(form, 'name') AND form.name NEQ ''>
                                    <cfif form.doctor_id GT 0>
                                        <!-- Update existing doctor -->
                                        <cfquery name="Update_Doctor">
                                            UPDATE doctor_details 
                                            SET name = <cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">,
                                                specialization = <cfqueryparam value="#form.specialization#" cfsqltype="cf_sql_varchar">,
                                                post = <cfqueryparam value="#form.post#" cfsqltype="cf_sql_varchar">
                                            WHERE doctor_id = <cfqueryparam value="#form.doctor_id#" cfsqltype="cf_sql_integer">
                                        </cfquery>
                                    <cfelse>
                                        <!-- Insert new doctor -->
                                        <cfquery name="Insert_Doctor">
                                            INSERT INTO doctor_details (name, specialization, post)
                                            VALUES (
                                                <cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">,
                                                <cfqueryparam value="#form.specialization#" cfsqltype="cf_sql_varchar">,
                                                <cfqueryparam value="#form.post#" cfsqltype="cf_sql_varchar">
                                            )
                                        </cfquery>
                                    </cfif>
                                    <!-- Redirect after form submission -->
                                    <cflocation url="doctor_management.cfm">
                                </cfif>
    
                                <!-- Backend Logic for Deleting Doctor -->
                                <cfif structKeyExists(url, 'delete_id') AND url.delete_id GT 0>
                                    <cfquery name="Delete_Doctor">
                                        DELETE FROM doctor_details
                                        WHERE doctor_id = <cfqueryparam value="#url.delete_id#" cfsqltype="cf_sql_integer">
                                    </cfquery>
                                    <!-- Redirect after deletion -->
                                    <cflocation url="doctor_management.cfm">
                                </cfif>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </cfoutput>
    
        <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../assets/js/template.js"></script>
</body>
</html>
