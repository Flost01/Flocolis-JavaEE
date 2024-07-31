package com.flocolis.traitement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String code=request.getParameter("id");
		Connection con=null;
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
			PreparedStatement pst=con.prepareStatement("DELETE FROM `colis` WHERE `id_colis`= ?");
			pst.setString(1, code);
			pst.executeUpdate();
			
			session.setAttribute("ERROR", "Le produit a été supprimé avec succès");
			response.sendRedirect("MaPage.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}