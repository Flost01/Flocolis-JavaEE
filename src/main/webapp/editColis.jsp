<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("Nom")==null){
		response.sendRedirect("index.jsp");
	}
%>
<%@page import="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<title>Edit colis</title>
</head>
<body>
   <section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h3 class="text-center">Mettre à jour les infos d'un colis</h3>
				<%
				  String code=request.getParameter("id");
				  Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
				  
				  PreparedStatement pst=con.prepareStatement("select * from colis where id_colis=?");
				  pst.setString(1, code);
				  ResultSet st=pst.executeQuery();
				  System.out.println(st.next());
				
				%>
						 <form class='input-group-register' method="post" action="EditColis">
             <div class="deux" style="display: flex;">
              <div class="form-floating mb-3 mx-3">
              <input
									type="hidden" name="id" value="<%=st.getString(1) %>" placeholder="Libelé produit" />
                <input type="text" class="form-control" value="<%=st.getString(6) %>" name="Des" id="floatingInput" placeholder="nom">
                <label for="floatingInput">Description colis :</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" name="nomD" value="<%=st.getString(9) %>" id="floatingInput" placeholder="prenom">
                <label for="floatingInput">Nom destinataire :</label>
              </div>
             </div>
             <div class="deux" style="display: flex;">
              <div class="form-floating mb-3 mx-3">
                <input type="email" class="form-control" value="<%=st.getString(10) %>" name="emailD" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Email destinataire :</label>
              </div>
              <div class="form-floating mb-3">
                <input type="date" class="form-control" id="floatingPassword" value="<%=st.getString(8) %>" name="delai" placeholder="Password">
                <label for="floatingPassword">Delai de livraison:</label>
              </div>
             </div>
              <div class="deux" style="display: flex;">
              <div class="form-floating mb-3 mx-3">
                <input type="number" class="form-control" value="<%=st.getString(11) %>" name="phoneD" id="floatingInput" placeholder="phone">
                <label for="floatingInput">Tel destinataire:</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" name="adresseD" value="<%=st.getString(12) %>" id="floatingInput" placeholder="adresse">
                <label for="floatingInput">Destination colis:</label>
              </div>
              </div>
               <div class="form-floating mb-3">
                <select class="form-select" id="floatingSelect" name="cat" aria-label="Floating label select example">
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
                <button class="btn btn-outline-primary" type="submit" name="envoi">Mise à jour</button>
          </form>
					
					</div>
				</div>
			</div>
		</section>
</body>
</html>