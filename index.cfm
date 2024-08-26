<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        .navbar {
            background: rgb(111,66,193); 
            background: linear-gradient(135deg, rgb(111,66,193), rgb(0,123,255));
            position: relative;
            z-index: 1; 
        }

        .navbar-brand img {
            width: 40px;
            height: 40px; 
        }

        .navbar-nav {
            margin-left: auto;
        }

        .header-text {
            position: relative; 
            text-align: center; 
            color: white; 
            padding: 100px 0; 
            z-index: 1; 
        }

        .image-container img {
            width: 100%;
            height: auto;
        }

        .card {
            border-radius: 0.75rem; 
        }
        .about {
    padding: 20px;
}

.about-content {
    display: flex;
    align-items: center;
}

.about-image {
    width: 500px;
    height: auto;
    margin-right: 20px; 
}

.about-text {
    max-width: 600px; 
}
.gallery {
    text-align: center; 
    padding: 20px;
}

.gallery h4 {
    margin-bottom: 20px;
}

.gallery-images {
    display: inline-block; 
    margin: 10px;
}

.gallery-images img {
    width: 100%; 
    max-width: 300px; 
    height: auto;
    border-radius: 8px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.gallery-images img:hover {
    transform: scale(1.05); 
}
footer {
    background-color: lightgray;/
    color: darkslategray;
    padding: 10px;
    text-align: center; 
    border-top: 1px solid gainsboro; 
    width: 100%; 
    position: relative; 
}

.contact-info {
    margin: 0;
}

.contact-info p {
    margin: 5px 0; 
    font-size: 14px; 
}


    </style>
</head>

<body>
    <header class="p-3">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="">
                    <img src="images/download.png" alt="Logo">
                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link active text-white" aria-current="page" href="">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="##sevice">Service</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="##about">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="##gal">Gallery</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="##contact">Contact Us</a>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="image-container">
        <img src="images/1693563230013.jpg" alt="Girl in a jacket" style="height: 170px;">
    </div>
<div>
    <br>
   <center><h3 class="display-5 " id="sevice"><u>Services</u></h3></center> 
   <div class="container mt-4">
    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Admin Side</h5>
                    <p class="card-text">Our hospital operations with the Admin panel. Manage staff, handle records, and ensure smooth operations. Access detailed reports and control various aspects of hospital management. Optimize administrative workflows and improve efficiency.</p>
                    <button class="btn btn-primary"><a href="login_admin.cfm" class="card-link text-white">Login</a></button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Doctor Side</h5>
                    <p class="card-text">Manage patient care and appointments through the Doctor panel. Access detailed patient records and update treatment plans. Schedule and track appointments efficiently. Collaborate with other healthcare professionals for better patient outcomes.</p>
                    <button class="btn btn-primary"><a href="login_doctor.cfm" class="card-link text-white">Login</a></button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Patient Side</h5>
                    <p class="card-text">Book and manage appointments easily from the Patient panel. View your medical history and update personal information. Access health records and track your treatment progress. Communicate with healthcare providers conveniently.</p>
                    <button class="btn btn-primary"><a href="login_patient.cfm" class="card-link text-white">Login</a></button>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="about" id="about">
    <div class="about-content">
        <img src="images/paient.webp" alt="About Our Hospital" class="about-image">
        <div class="about-text">
            <h2>About Our Hospital</h2>
            <p>Welcome to our Hospital Name, a leading healthcare provider dedicated to delivering compassionate and comprehensive medical care. Founded with a vision to improve community health, our hospital combines state-of-the-art technology with a skilled team of healthcare professionals.

                We offer a wide range of services, including emergency care, specialized treatments, and preventive health programs. Our facilities are designed to ensure patient comfort and safety, featuring modern amenities and a supportive environment.
                
                At our Hospital Name, we prioritize patient-centered care, emphasizing personalized treatment plans and holistic support. Our multidisciplinary team works collaboratively to address complex medical needs and achieve optimal health outcomes.
                
                Committed to excellence, we continuously invest in advanced medical research and education. Our dedicated staff is here to provide expert care, from routine check-ups to complex procedures, with empathy and professionalism.
                
                Thank you for choosing our Hospital Name as your trusted healthcare partner. We are honored to serve you and your loved ones, striving every day to enhance the health and well-being of our community.
                
                </p>
        </div>
    </div>
</section>

<section class="gallery" id="gal">
    <center><h4>Gallery</h4></center>
    <div class="gallery-images">
        <img src="images/images (1).jpg" alt="Gallery Image">
    </div>
    <div class="gallery-images">
        <img src="images/images (2).jpg" alt="Gallery Image">
    </div>
    <div class="gallery-images">
        <img src="images/images (3).jpg" alt="Gallery Image">
    </div>

</section>
<style>
     .contact-form {
            margin-top: 20px;
        }
        .contact-form label {
            margin-top: 10px;
        }
</style>
<div class="container">
    <h1 class="mt-4">Contact Us</h1>
    
    <!-- Contact Form -->
    <form method="post" action="" class="contact-form">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" class="form-control" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary mt-3">Send Message</button>
    </form>
</div>
<footer>
    <div class="contact-info" id="contact">
        <center><h1>Contacts us</h1></center>
        <p>Address: 123 Street Name, City, Country</p>
        <p>Phone: +123 456 7890</p>
        <p>Email: contact@hospital.com</p>
    </div>
</footer>

 
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="dashboard.js"></script>
</body>
</html>
</cfoutput>