<cfoutput>
    <cftry>

        <cfset email = trim(FORM.email)>
        <cfset password = trim(FORM.password)>
        <cfquery name="checkPatient">
            SELECT p_id, fname,address,city,gender, email,password
            FROM register_patient
            WHERE email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar" maxlength="100">
            AND password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar" maxlength="100">
        </cfquery>
        <!--- <cfdump var="#checkPatient#"><cfabort> --->
        
      
        <cfif checkPatient.recordcount EQ 1>
            <cfset SESSION.patientID = checkPatient.p_id>
            <cfset SESSION.fname = checkPatient.fname>
            <cfset SESSION.address = checkPatient.address>
            <cfset SESSION.city = checkPatient.city>
            <cfset SESSION.gender = checkPatient.gender>
            <cfset SESSION.email = checkPatient.email>
            <cfset SESSION.password = checkPatient.password>
             <!--- <cfdump var="#SESSION#"><cfabort> --->
            <cflocation url="PatientDashboard.cfm" addToken="false">
        <cfelse>


            <script>
                alert('Invalid email or password. Please try again.');
                history.back();
            </script>
        </cfif>
    <cfcatch>
        <script>
            alert('An error occurred while processing your login. Please try again.');
            history.back();
        </script>
    </cfcatch>
    </cftry>
 
    </cfoutput>
    