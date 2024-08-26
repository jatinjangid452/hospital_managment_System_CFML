<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgb(245, 245, 245);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgb(255, 255, 255);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: rgb(50, 50, 50);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: rgb(80, 80, 80);
        }
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid rgb(200, 200, 200);
            border-radius: 5px;
            font-size: 16px;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: rgb(0, 123, 255);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: rgb(0, 105, 217);
        }
    </style>
</head>
<body>
    <cfoutput>
<div class="container">
    <h2>Update Password</h2>
    <form action="" method="post">
        <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
        </div>
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" value="Update Password">
        </div>
    </form>
</div>


<cfif structKeyExists(form, "submit")>
    <cfif form.currentPassword eq SESSION.password >
        <cfif structKeyExists(form, "newPassword") and len(trim(form.newPassword))>
            <cfquery name="UpdatePassword">
                UPDATE admin_login
                SET password =  "#form.newPassword#"
                WHERE id = #SESSION.adminID#;
            </cfquery>
            <!-- Update the session password after successful update -->
            <cfset SESSION.password = form.newPassword>
            <script>
                alert("Password Updated Successfully!");
                window.location.href ="/src/index.cfm";
            </script>
        <cfelse>
            <script>
                alert("Current password is incorrect. Please try again.");
            </script>
        </cfif>
    </cfif>
</cfif>
</cfoutput>

</body>
</html>
