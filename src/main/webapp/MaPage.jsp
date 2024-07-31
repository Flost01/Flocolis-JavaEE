<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("Nom")==null){
		response.sendRedirect("index.jsp");
	}
%>
<%@page import="java.sql.* "%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Ma page</title>

  <!-- Favicons -->
  
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>++237 691168931</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
   <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="index.jsp">Flocolis<span>.</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Acceuil</a></li>
          <li><a class="nav-link scrollto" href="#about">A propos</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          <li><a class="nav-link scrollto " href="#portfolio">Nos partenaires</a></li>
          <li><a class="nav-link scrollto" href="#team">Equipe</a></li>
          
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
           <li> <div class="dropdown-divider"></div>
           <a class="dropdown-item" href="logout" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                   Deconnexion
                                </a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="../logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
  <main id="main" data-aos="fade-up">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Bienvenue <%=session.getAttribute("Nom")%></h2>
          <ol>
            <li><a href="index.jsp">Accieul</a></li>
            <li><a href="MaPage.jsp">Ma page</a></li>
            <li>Mon blog personnel</li>
          </ol>
        </div>

      </div>
    </section><!-- Breadcrumbs Section -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
    
        <div class="row gy-4">

          <div class="col-lg-8">
            <h3 class="text-center">Liste des colis</h3>
			<hr>
			<div class="container text-left">

				<a href="#" class="btn btn-primary" data-bs-target="#exampleModalToggle1" data-bs-toggle="modal">Add
					New colis</a>
				<div class="modal fade" id="exampleModalToggle1" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Ajouter colis</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form class='input-group-register' method="post" action="AddColis">
             <div class="deux" style="display: flex;">
              <div class="form-floating mb-3 mx-3">
                <input type="text" class="form-control" name="Des" id="floatingInput" placeholder="nom" required>
                <label for="floatingInput">Description colis :</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" name="nomD" id="floatingInput" placeholder="prenom" required>
                <label for="floatingInput">Nom destinataire :</label>
              </div>
             </div>
             <div class="deux" style="display: flex;">
              <div class="form-floating mb-3 mx-3">
                <input type="email" class="form-control" name="emailD" id="floatingInput" placeholder="name@example.com" required>
                <label for="floatingInput">Email destinataire :</label>
              </div>
              <div class="form-floating mb-3">
                <input type="date" class="form-control" id="floatingPassword" name="delai" placeholder="Password" required>
                <label for="floatingPassword">Delai de livraison:</label>
              </div>
             </div>
              <div class="deux" style="display: flex;">
              <div class="form-floating mb-3 mx-3">
                <input type="number" class="form-control" name="phoneD" id="floatingInput" placeholder="phone" required>
                <label for="floatingInput">Tel destinataire:</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" name="adresseD" id="floatingInput" placeholder="adresse" required>
                <label for="floatingInput">Destination colis:</label>
              </div>
              </div>
               <div class="form-floating mb-3">
                <select class="form-select" id="floatingSelect" name="cat" aria-label="Floating label select example" required>
				    <option selected>Catégories colis</option>
				    <%
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
    PreparedStatement ps=conn.prepareStatement("select * from categories");
    ResultSet rst=ps.executeQuery();
    
    while(rst.next()){%>
				    <option value="<%=rst.getString(1)%>" ><%=rst.getString(2) %></option>
				    <%
				    }
    rst.close();
    ps.close();
    conn.close();
%>
				 </select>
              </div>
                <button class="btn btn-outline-primary" type="submit" name="envoi">Enregistrer</button>
          </form>
      </div>
    
    </div>
  </div>
</div>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>code</th>
						<th>Description</th>
						<th>Delai de livraison</th>
						<th>Destination</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>

						
						<% 
						int i=1;
						  try {
							//Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
							PreparedStatement pst=con.prepareStatement("select id_colis,Descrition,delai_livraison,Destination,status_colis from colis where id_clent="+session.getAttribute("id_clent"));
							
							ResultSet st=pst.executeQuery();
							
							while(st.next()){%>
							<tr>
								<td><%=i %></td>
								<td><%=st.getString(2) %></td>
								<td><%=st.getString(3) %></td>
								<td><%=st.getString(4) %></td>
								<td><%=st.getString(5) %></td>
								<td>
								<%if(st.getString(5).equals("save")){%>
								<a href="editColis.jsp?id=<%=st.getString(1) %>"><i class="bi bi-pencil-square"></i></a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a style="color:red"
								href="Delete?id=<%=st.getString(1) %>"><i class="bi bi-trash3"></i></a>
						<%}else{%>none<%}%>
								</td>
								</tr>
							<% i++;}
						  }catch(Exception e){
							  e.printStackTrace();
						  }%>
						
						
				</tbody>
			</table>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3><%=session.getAttribute("Nom")%> <%=session.getAttribute("Prenom")%></h3>
              <ul>
                <li><strong>Email</strong>: <%=session.getAttribute("Email")%></li>
                <li><strong>Tel</strong>: <%=session.getAttribute("Phone")%></li>
                <li><strong>Adresse</strong>: <%=session.getAttribute("Adresse")%></li>
                <li><strong>Nbre de colis</strong>: <%=i-1 %></li>
              </ul>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-newsletter">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <h4>Join Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>BizLand<span>.</span></h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>BizLand</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>