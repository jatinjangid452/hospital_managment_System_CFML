<cfquery name="getPatients">
    SELECT 
        `id`,
        `Patient Name`,
        `Patient Email`,
        `Patient Mobile Number`,
        `Patient Address`,
        `Patient Gender`,
        `Patient Age`,
        `Patient Medical History (if any)`,
        `Patient Reg Date`
    FROM patinet_details
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .action-links a {
            margin-right: 5px;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
        }
        .edit {
            background-color: #007bff; /* Blue */
        }
        .edit-form {
            margin-top: 20px;
        }
        .edit-form label {
            margin-top: 10px;
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
        <h1 class="mt-4">Patient Details</h1>

        <!-- Display Patient Data in Table -->
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Patient Name</th>
                    <th>Patient Email</th>
                    <th>Patient Mobile Number</th>
                    <th>Patient Address</th>
                    <th>Patient Gender</th>
                    <th>Patient Age</th>
                    <th>Patient Medical History</th>
                    <th>Patient Reg Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="patientTableBody">
                <cfoutput query="getPatients">
                    <tr>
                        <td>#getPatients['Patient Name']#</td>
                        <td>#getPatients['Patient Email']#</td>
                        <td>#getPatients['Patient Mobile Number']#</td>
                        <td>#getPatients['Patient Address']#</td>
                        <td>#getPatients['Patient Gender']#</td>
                        <td>#getPatients['Patient Age']#</td>
                        <td>#getPatients['Patient Medical History (if any)']#</td>
                        <td>#getPatients['Patient Reg Date']#</td>
                        <td class="action-links">
                            <a href="patient.cfm?action=edit&id=#getPatients.id#" class="button edit">Edit</a>
                        </td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>

        <!-- Edit Form (Appears if 'action=edit' in URL) -->
        <cfif IsDefined("url.action") AND url.action == "edit">
            <cfquery name="getPatient">
                SELECT * FROM patinet_details
                WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfif getPatient.RecordCount>
                <h3 class="mt-5">Edit Patient Details</h3>
                <form method="post" class="edit-form">
                    <input type="hidden" name="id" value="#getPatient.id#">

                    <label for="PatientName">Patient Name:</label>
                    <input type="text" id="PatientName" name="PatientName" class="form-control" value="#getPatient['Patient Name']#" required>

                    <label for="PatientEmail">Patient Email:</label>
                    <input type="email" id="PatientEmail" name="PatientEmail" class="form-control" value="#getPatient['Patient Email']#" required>

                    <label for="PatientMobileNumber">Patient Mobile Number:</label>
                    <input type="text" id="PatientMobileNumber" name="PatientMobileNumber" class="form-control" value="#getPatient['Patient Mobile Number']#" required>

                    <label for="PatientAddress">Patient Address:</label>
                    <input type="text" id="PatientAddress" name="PatientAddress" class="form-control" value="#getPatient['Patient Address']#" required>

                    <label for="PatientGender">Patient Gender:</label>
                    <select id="PatientGender" name="PatientGender" class="form-control" required>
                        <option value="Male" <cfif getPatient['Patient Gender'] == "Male">selected</cfif>>Male</option>
                        <option value="Female" <cfif getPatient['Patient Gender'] == "Female">selected</cfif>>Female</option>
                    </select>

                    <label for="PatientAge">Patient Age:</label>
                    <input type="number" id="PatientAge" name="PatientAge" class="form-control" value="#getPatient['Patient Age']#" required>

                    <label for="PatientMedicalHistory">Patient Medical History (if any):</label>
                    <input type="text" id="PatientMedicalHistory" name="PatientMedicalHistory" class="form-control" value="#getPatient['Patient Medical History (if any)']#">

                    <button type="submit" name="submit" class="btn btn-primary mt-3">Save Changes</button>
                </form>
            </cfif>
        </cfif>

        <!-- Handle Form Submission -->
        <cfif IsDefined("form.submit")>
            <cfquery>
                UPDATE patinet_details
                SET `Patient Name` = <cfqueryparam value="#form.PatientName#" cfsqltype="cf_sql_varchar">,
                    `Patient Email` = <cfqueryparam value="#form.PatientEmail#" cfsqltype="cf_sql_varchar">,
                    `Patient Mobile Number` = <cfqueryparam value="#form.PatientMobileNumber#" cfsqltype="cf_sql_varchar">,
                    `Patient Address` = <cfqueryparam value="#form.PatientAddress#" cfsqltype="cf_sql_varchar">,
                    `Patient Gender` = <cfqueryparam value="#form.PatientGender#" cfsqltype="cf_sql_varchar">,
                    `Patient Age` = <cfqueryparam value="#form.PatientAge#" cfsqltype="cf_sql_integer">,
                    `Patient Medical History (if any)` = <cfqueryparam value="#form.PatientMedicalHistory#" cfsqltype="cf_sql_varchar">
                WHERE id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cflocation url="patient.cfm">
        </cfif>
    </div>
</cfoutput>

<script>
    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.querySelector(".table tbody");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0]; // Searching based on Patient Name which is the first column
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>
