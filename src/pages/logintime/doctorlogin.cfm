<cfoutput>
    <!--- Check if DoctorID exists in the session --->
    <cfif NOT structKeyExists(SESSION, "DoctorID")>
        <cflocation url="login_doctor.cfm" addtoken="no">
    </cfif>

    <!--- Retrieve the doctor's login sessions from the database --->
    <cfquery name="getDoctorSessions" >
        SELECT login_time, logout_time 
        FROM doctor_sessions
        WHERE id1 = <cfqueryparam value="#SESSION.DoctorID#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Display the login sessions in a table --->
    <h2>Doctor Login Sessions</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Login Time</th>
            <th>Logout Time</th>
        </tr>
        <cfoutput query="getDoctorSessions">
            <tr>
                <td>#dateFormat(login_time, "yyyy-mm-dd")# #timeFormat(login_time, "HH:mm:ss")#</td>
                <td>
                    <cfif logout_time IS NOT NULL>
                        #dateFormat(logout_time, "yyyy-mm-dd")# #timeFormat(logout_time, "HH:mm:ss")#
                    <cfelse>
                        Still Logged In
                    </cfif>
                </td>
            </tr>
        </cfoutput>
    </table>
</cfoutput>
