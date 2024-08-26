<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgb(242, 242, 242);
            margin: 0;
            padding: 0;
        }

        .profile-container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: rgb(255, 255, 255);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-info {
            margin-bottom: 15px;
        }

        .profile-info label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: rgb(0, 123, 255);
        }

        .profile-info p {
            margin: 0;
            padding: 10px;
            border: 1px solid rgb(204, 204, 204);
            border-radius: 4px;
            background-color: rgb(255, 255, 255);
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2 class="profile-title">Doctor Profile</h2>


        <!--- Check if ID parameter is provided --->
       
            <!--- Query to get the doctor's profile using ID from URL parameter --->
            <cfquery name="getDoctorProfile">
                SELECT doctor_id, name, specialization, post
                FROM doctor_details
                WHERE doctor_id = #SESSION.DoctorID#
            </cfquery>
            <!--- <cfdump var="#getDoctorProfile#"><cfabort> --->

            <cfif getDoctorProfile.recordCount>
                <div class="profile-info">
                    <label>Name:</label>
                    <p>#getDoctorProfile.name#</p>
                </div>
                <div class="profile-info">
                    <label>Specialization:</label>
                    <p>#getDoctorProfile.specialization#</p>
                </div>
                <div class="profile-info">
                    <label>Post:</label>
                    <p>#getDoctorProfile.post#</p>
                </div>
            <cfelse>
                <p>No profile information found.</p>
            </cfif>
     
     
    </div>
</body>
</html>
</cfoutput>
