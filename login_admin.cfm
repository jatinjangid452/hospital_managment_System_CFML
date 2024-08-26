<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HMS | Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: rgb(242, 242, 242);
                margin: 0;
                padding: 0;
            }

            .form-container {
                width: 50%;
                margin: 50px auto;
                padding: 20px;
                background-color: rgb(255, 255, 255);
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-title {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid rgb(204, 204, 204);
                border-radius: 4px;
            }

            .form-group .submit-btn {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: rgb(0, 123, 255);
                color: white;
                border: none;
                border-radius: 4px;
                text-align: center;
                cursor: pointer;
                margin-bottom: 10px; /* Space between buttons */
            }

            .form-group .submit-btn:hover {
                background-color: rgb(0, 86, 179);
            }

            .form-footer {
                text-align: center;
                margin-top: 20px;
            }

            .form-footer a {
                color: rgb(0, 123, 255);
                text-decoration: none;
            }

            .form-footer a:hover {
                text-decoration: underline;
            }
            
            .btn-forgot-password {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: rgb(108, 117, 125); /* Grey color */
                color: white;
                border: none;
                border-radius: 4px;
                text-align: center;
                cursor: pointer;
                text-decoration: none;
            }

            .btn-forgot-password:hover {
                background-color: rgb(83, 89, 94); /* Darker grey color */
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2 class="form-title">HMS | Admin Login</h2>
            <form action="loginHandler_admin.cfm" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="submit-btn">Login</button>
                </div>
                <!--- <a href="" class="btn-forgot-password">Forgot Password?</a> --->
                <!-- Uncomment if needed
                <div class="form-footer">
                    <a href="register_patient.cfm">Don't have an account? Register here</a>
                </div>
                -->
            </form>
        </div>
    </body>
    </html>
</cfoutput>
