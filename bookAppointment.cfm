<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(244, 244, 244);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: rgb(255, 255, 255);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: rgb(51, 51, 51);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: rgb(51, 51, 51);
        }
        .form-group input[type="text"], .form-group input[type="date"], .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid rgb(221, 221, 221);
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            background-color: rgb(0, 123, 255);
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-group input[type="submit"]:hover {
            background-color: rgb(0, 86, 179);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Book an Appointment</h1>
        <cfif structKeyExists(form, "submitBtn")>
            <!-- Form Submission Logic -->
            <cfquery name="bookAppointment">
                INSERT INTO appointments (p_id, doctor_name, appointment_date, reason)
                VALUES (
                    <cfqueryparam value="#form.patient_id#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#form.doctor_name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#form.appointment_date#" cfsqltype="cf_sql_date">,
                    <cfqueryparam value="#form.reason#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
           
            <cfset message = "Appointment booked successfully!">
            <cflocation url="index.cfm">
        </cfif>

        <!-- Appointment Booking Form -->
        <form action="bookAppointment.cfm" method="post">
            <div class="form-group">
                <label for="patient_id">Patient ID:</label>
                <input type="text" id="patient_id" name="patient_id" required>
            </div>
            <div class="form-group">
                <label for="doctor_name">Doctor name:</label>
                <input type="text" id="doctor_name" name="doctor_name" required>
            </div>
            <div class="form-group">
                <label for="appointment_date">Appointment Date:</label>
                <input type="date" id="appointment_date" name="appointment_date" required>
            </div>
            <div class="form-group">
                <label for="reason">Reason for Appointment:</label>
                <input type="text" id="reason" name="reason" required>
            </div>
            <div class="form-group">
                <input type="submit" name="submitBtn" value="Book Appointment">
            </div>
        </form>
    </div>
</cfoutput>
</body>
</html>
