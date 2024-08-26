<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Appointments</title>
        <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
        <style>
            /* Container Styling */
.container {
    max-width: 1200px;
    margin: 50px auto; /* Centered container with space around */
    padding: 20px;
    background-color: var(--container-background);
    box-shadow: 0 0 10px var(--shadow-color);
    border-radius: 8px;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 30px 0; /* Space around the table */
    padding: 0; /* No padding directly on the table */
    background-color: var(--container-background);
}

/* Table Borders */
table, th, td {
    border: 2px solid var(--border-color); /* Thicker border for visibility */
}

th, td {
    padding: 15px; /* Increased padding for better readability */
    text-align: left;
}

th {
    background-color: var(--background-color);
    color: var(--text-color);
    font-weight: bold;
}

td {
    color: rgb(68, 68, 68);
}

/* Zebra Striping */
tr:nth-child(even) {
    background-color: hsl(0, 0%, 98%);
}

tr:nth-child(odd) {
    background-color: var(--container-background);
}

/* Hover Effect */
tr:hover {
    background-color: hsl(0, 0%, 90%);
}

/* Responsive Table */
@media (max-width: 768px) {
    table {
        font-size: 14px;
    }
}
</style>
    </head>
    <body>
        <div class="container">
            <h1>Query</h1>
    
<cfquery name="get">
    select name,email,query_details,query_date
     from patient_queries
</cfquery>
<table>
    <thead>
        <tr>
    <th>name</th>
    <th>email</th> 
    <th>query_details</th>
     <th>query_date</th>
    </tr>
</thead>
<tbody>
     <cfloop query="get">
        <tr>
     <td>#name#</td>
     <td>#email#</td>
     <td>#query_details#</td>
     <td>#query_date#</td>
    </tr>
</cfloop>
</tbody>
</table>
</div>

</cfoutput>