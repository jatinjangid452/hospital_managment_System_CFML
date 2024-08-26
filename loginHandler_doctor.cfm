<cfoutput>
    <!--- <cfdump var="#FORM#"><cfabort> --->
        <cfset email = FORM.email>
        <cfset password = FORM.password>

        <!--- Query to check doctor credentials --->
        <cfquery name="getDoctor" >
            SELECT * 
            FROM doctor_login
            WHERE email = "#email#" AND password = "#password#"
        </cfquery>
        
        <!--- <cfdump var="#getDoctor#"><cfabort> --->
        <!--- Check if credentials are valid --->
        <cfif getDoctor.recordCount EQ 1>

            <!--- Set session variable and redirect to dashboard --->
            <cfset SESSION.DoctorID = getDoctor.id1>
            <cfset SESSION.password = getDoctor.password>
            
            <!--- <cfdump var="#session#"><cfabort> --->
            <cflocation url="doctor/src/index.cfm" addtoken="no">
        <cfelse>
            <!--- Output error message and return to login form --->
            <cfoutput>
                <script>
                    alert('Invalid email or password. Please try again.');
                    history.back();
                </script>
            </cfoutput>
        </cfif>
    

</cfoutput>
