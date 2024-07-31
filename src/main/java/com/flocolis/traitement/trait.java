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
import java.sql.SQLException;


public class trait extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String stat="take";
		  Connection con;
		  HttpSession session=request.getSession();
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
			 PreparedStatement pst=con.prepareStatement("UPDATE `colis` SET `status_colis`=?,`id_livreur`="+session.getAttribute("id_livreur")+",`id_agence`="+session.getAttribute("id_agence")+"  where id_colis=?");
			 pst.setString(1, stat);
			 pst.setString(2, id);
			 
			 pst.executeUpdate();
				
				session.setAttribute("ERROR", "Le produit a été supprimé avec succès");
				response.sendRedirect("MaPageL.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}
