<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-9/assets/css/registration-9.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<body class="bg-success">
<cfoutput>
    
        <!-- Logout Button -->
        <div style="text-align: right; margin-top: 20px;">
            <a href="index.cfm" 
               style="display: inline-block; padding: 10px 20px; background-color: rgb(220, 53, 69); color: rgb(255, 255, 255); text-decoration: none; border-radius: 5px; font-size: 16px; cursor: pointer;">
               Logout
            </a>
        </div>
  <div style="text-align: right; margin-top: 20px;">
    <a href="form.cfm" style="display: inline-block; padding: 10px 20px; background-color: blue; color: rgb(255, 255, 255); text-decoration: none; border-radius: 5px; font-size: 16px; cursor: pointer;">Update password</a>
   
</div>
        

        <!-- Logout Link with Inline CSS -->
    <!-- Profile 1 - Bootstrap Brain Component -->
    <section class="bg-light py-3 py-md-5 py-xl-8">
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                    <hr class="w-100 mx-auto mb-5 mb-xl-9 border-dark-subtle">
                    <h2 class="mb-2 display-7 text-center text-dark">Welcome  #SESSION.fname#</h2>
                    <hr>
                    <h2 class="mb-2 display-7 text-center text-dark">Profile</h2>
                    <hr class="w-100 mx-auto mb-5 mb-xl-9 border-dark-subtle">
                </div>
            </div>
        </div>
        <div style="text-align: center; margin: 10px;">
        <a class="btn btn-warning" href="bookAppointment.cfm" role="button">Book Appointment</a>
    </div>
        <div class="container ">
            <div class="col-12">
                <div class="card widget-card shadow-sm ">
                    <div class="card-body p-4">
                        <ul class="nav nav-tabs" id="profileTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="overview-tab" data-bs-toggle="tab" data-bs-target="##overview-tab-pane" type="button" role="tab" aria-controls="overview-tab-pane" aria-selected="true">Overview</button>
                            </li>
                         
                        </ul>
                        <div class="tab-content pt-4" id="profileTabContent">
                            <div class="tab-pane fade show active" id="overview-tab-pane" role="tabpanel" aria-labelledby="overview-tab" tabindex="0">
                                <h5 class="mb-3">About</h5>
                                
                                <div class="row g-0">
                                    <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                        <div class="p-2">Patient id</div>
                                    </div>
                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                        <div class="p-2">#SESSION.patientID#</div>
                                    </div>
                                    <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                        <div class="p-2">Full Name</div>
                                    </div>
                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                        <div class="p-2">#SESSION.fname#</div>
                                    </div>
                                    <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                        <div class="p-2">Address</div>
                                    </div>
                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                        <div class="p-2">#SESSION.address#</div>
                                    </div>
                                    <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                        <div class="p-2">City</div>
                                    </div>
                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                        <div class="p-2">#SESSION.city#</div>
                                    </div>
                                    <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                        <div class="p-2">Gender</div>
                                    </div>
                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                        <div class="p-2">#SESSION.gender#</div>
                                    </div>
                                    <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                        <div class="p-2">Email</div>
                                    </div>
                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                        <div class="p-2">#SESSION.email#</div>
                                    </div>

                                </div>
                            </div>

            <!--- <cfquery name="getAppointments">
                SELECT patient_id, doctor_name, appointment_date, reason
                FROM appointments
            </cfquery> --->
                            <!-- Other tabs content -->
                            <div class="tab-content pt-4" id="profileTabContent">
                                <div class="tab-pane fade show active" id="history-tab-pane" role="tabpanel" aria-labelledby="overview-tab" tabindex="0">
                                    <cfquery name="getAppointments">
                                        SELECT p_id, doctor_name, appointment_date, reason
                                        FROM appointments
                                        Where p_id=#SESSION.patientID#
                                        -- Where patient_id=p_id;
                                    </cfquery>
                            
                                    <!-- Display appointments in a table -->
                                    <h3>Appointment history</h3>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Patient ID</th>
                                                <th>Doctor Name</th>
                                                <th>Appointment Date</th>
                                                <th>Reason</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <cfloop query="getAppointments">
                                                <tr>
                                                    <td>#p_id#</td>
                                                    <td>#doctor_name#</td>
                                                    <td>#appointment_date#</td>
                                                    <td>#reason#</td>
                                                </tr>
                                            </cfloop>
                                        </tbody>
                                    </table>
    
                                    </div>
                                </div>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</cfoutput>
</body>
</html>
