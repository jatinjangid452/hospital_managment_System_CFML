<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            color: #fff;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            margin: 0 5px;
        }
        .btn-edit {
            background-color: #4CAF50; /* Green */
        }
        .btn-delete {
            background-color: #f44336; /* Red */
        }
        .edit-form {
            margin-top: 20px;
        }
        .edit-form label {
            display: block;
            margin: 10px 0 5px;
        }
        .edit-form input, .edit-form select {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn-save {
            padding: 10px 15px;
            text-decoration: none;
            color: #fff;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            background-color: #4CAF50; /* Green */
        }
        #myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}
    </style>
</head>
<body>
    <cfoutput>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
    <div class="container">
        <h1>Patient Details</h1>

        <!-- Handle Edit and Delete Actions -->
        <cfif IsDefined("url.action")>
            <cfif url.action == "delete">
                <!-- Handle Deletion -->
                <cfquery>
                    DELETE FROM register_patient
                    WHERE p_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfquery>
                <!--- <cfset Message = "Patient deleted successfully."> --->
                <cfset url.action = ""> <!-- Clear action -->
                <cflocation url="patient_details.cfm">
            </cfif>
            <cfif url.action == "edit">
                <!-- Handle Editing -->
                <cfif IsDefined("form.submit")>
                    <cfquery>
                        UPDATE register_patient
                        SET fname = <cfqueryparam value="#form.fname#" cfsqltype="cf_sql_varchar">,
                            address = <cfqueryparam value="#form.address#" cfsqltype="cf_sql_varchar">,
                            city = <cfqueryparam value="#form.city#" cfsqltype="cf_sql_varchar">,
                            gender = <cfqueryparam value="#form.gender#" cfsqltype="cf_sql_varchar">,
                            email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
                        WHERE p_id = <cfqueryparam value="#form.p_id#" cfsqltype="cf_sql_integer">
                    </cfquery>
                    <!--- <cfset Message = "Patient details updated successfully."> --->
                    <cflocation url="patient_details.cfm"> <!-- Redirect to avoid form display -->
                </cfif>

                <!-- Display Edit Form -->
                <cfquery name="getPatient">
                    SELECT * FROM register_patient
                    WHERE p_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfquery>
                <cfif getPatient.RecordCount>
                    <form method="post" class="edit-form">
                        <input type="hidden" name="p_id" value="#getPatient.p_id#">
                        <label for="fname">First Name:</label>
                        <input type="text" id="fname" name="fname" value="#getPatient.fname#" required>
                        
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="#getPatient.address#" required>
                        
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" value="#getPatient.city#" required>
                        
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" required>
                            <option value="Male" <cfif getPatient.gender == "Male">selected</cfif>>Male</option>
                            <option value="Female" <cfif getPatient.gender == "Female">selected</cfif>>Female</option>
                        </select>
                        
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="#getPatient.email#" required>
                        
                        <button type="submit" name="submit" class="btn btn-save">Save Changes</button>
                    </form>
                </cfif>
            </cfif>
        </cfif>

        <!-- Display Message -->
        <cfif IsDefined("Message")>
            <p>#Message#</p>
        </cfif>

        <!-- Display Patient Data -->
        <cfquery name="getPatients">
            SELECT * FROM register_patient
        </cfquery>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="getPatients">
                    <tr>
                        <td>#p_id#</td>
                        <td>#fname#</td>
                        <td>#address#</td>
                        <td>#city#</td>
                        <td>#gender#</td>
                        <td>#email#</td>
                        <td>
                            <!-- Edit Button -->
                            <a href="?action=edit&id=#p_id#" class="btn btn-edit">Edit</a>
                            <!-- Delete Button -->
                            <a href="?action=delete&id=#p_id#" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this patient?');">Delete</a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
    <script>
        function myFunction() {
            // Get the value from the search input
            var input = document.getElementById("myInput");
            var filter = input.value.toUpperCase();
            
            // Get the table and all the rows
            var table = document.querySelector("table tbody");
            var tr = table.getElementsByTagName("tr");
            
            // Loop through all table rows and hide those who don't match the search query
            for (var i = 0; i < tr.length; i++) {
                // Get the first cell (which contains the patient's name)
                var td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    var txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }       
            }
        }
    </script>
    
    </cfoutput>
</body>
</html>
