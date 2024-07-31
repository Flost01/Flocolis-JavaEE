package com.flocolis.traitement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.*;

@WebServlet("/register")
public class inscriptionUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String nom=request.getParameter("nom");
	    String prenom=request.getParameter("prenom");
	    String email=request.getParameter("email");
	    String password=request.getParameter("mdp");
	    int phone=Integer.parseInt(request.getParameter("phone"));
	    String addresse=request.getParameter("adresse");
	    Timestamp time=new Timestamp(System.currentTimeMillis()); 
		
		Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    HttpSession session = null;
	    RequestDispatcher dispatcher = null;
	    
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/flocolis", "root", "");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
            preparedStatement=connection.prepareStatement("INSERT INTO `client`(`Nom`, `Prenom`, `Email`, `Password`, `Phone`, `Adresse`,`create_at`) VALUES(?,?,?,?,?,?,?) ");
            preparedStatement.setString(1,nom);
            preparedStatement.setString(2,prenom);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,password);
            preparedStatement.setInt(5,phone);
            preparedStatement.setString(6,addresse);
            preparedStatement.setTimestamp(7, time);
			
            int compte= preparedStatement.executeUpdate();
            response.sendRedirect("index.jsp");
		}catch(Exception e) {
			e.printStackTrace();	}
	}

}
