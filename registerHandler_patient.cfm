<cfoutput>
    <cftry>
        <!--- Capture form data --->
        <cfset fname = trim(FORM.fname)>
        <cfset address = trim(FORM.address)>
        <cfset city = trim(FORM.city)>
        <cfset gender = trim(FORM.gender)>
        <cfset email = trim(FORM.email)>
        <cfset password = trim(FORM.password)>
     
        <!--- Insert data into the database --->
        <cfquery>
            INSERT INTO register_patient (fname, address, city, gender, email, password)
            VALUES (
                <cfqueryparam value="#fname#" cfsqltype="cf_sql_varchar" maxlength="100">,
                <cfqueryparam value="#address#" cfsqltype="cf_sql_varchar" maxlength="100">,
                <cfqueryparam value="#city#" cfsqltype="cf_sql_varchar" maxlength="100">,
                <cfqueryparam value="#gender#" cfsqltype="cf_sql_varchar" maxlength="100">,
                <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar" maxlength="100">,
                <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar" maxlength="100">
            )
        </cfquery>
       
        <cflocation url="login_patient.cfm" addToken="false">
    <cfcatch>
        <!--- Handle any errors --->
        <script>
       
            alert('An error occurred while processing your registration. Please try again.');
            history.back();
        </script>
    </cfcatch>
    </cftry>
    </cfoutput>
    