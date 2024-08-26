<cfoutput>
    <cftry>

        <cfset email = trim(FORM.email)>
        <cfset password = trim(FORM.password)>

        <cfquery name="getAdmin">
            SELECT id
            FROM admin_login
            WHERE email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar" maxlength="100" />
            AND password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar" maxlength="100" />
            LIMIT 1
        </cfquery>
        
        <cfif getAdmin.recordCount EQ 1>

            <cfset SESSION.adminID = getAdmin.id>
            <!--- <cfset SESSION.email=getAdmin.email> --->
            <!--- <cfset SESSION.password = getAdmin.password> --->
            <cflocation url="/src/index.cfm">
        <cfelse>
            <script>
                alert('Invalid email or password. Please try again.');
                history.back();
            </script>
        </cfif>
    <cfcatch>
        <script>
            alert('An error occurred while processing your request. Please try again later.');
        </script>
    </cfcatch>
    </cftry>
    
    </cfoutput>
    