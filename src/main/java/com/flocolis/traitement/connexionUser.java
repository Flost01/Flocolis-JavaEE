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

@WebServlet("/connexion")
public class connexionUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("emaill");
        String password = request.getParameter("mdpl");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        HttpSession session = null;
        RequestDispatcher dispatcher = null;
        System.out.println(username+" "+password);

        try {
            // Establish a secure database connection (consider using connection pooling)
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/flocolis", "root", "");

            // Use prepared statement to prevent SQL injection attacks
            preparedStatement = connection.prepareStatement("SELECT * FROM client WHERE Email = ? AND Password = ?");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password); // Hash and salt the password before storing in the database

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                session = request.getSession();
                session.setAttribute("id_clent", resultSet.getString("id_clent"));
                session.setAttribute("Nom", resultSet.getString("Nom"));
                session.setAttribute("Prenom", resultSet.getString("Prenom"));
                session.setAttribute("Email", resultSet.getString("Email"));
                session.setAttribute("Phone", resultSet.getString("Phone"));
                session.setAttribute("Adresse", resultSet.getString("Adresse"));// Use "name" instead of "uname" (assuming it's stored correctly)
                
                if(session.getAttribute("Nom").equals("admin")) {
                	System.out.println("je suis admin");
                	dispatcher = request.getRequestDispatcher("index.jsp");
                }else {
                	dispatcher = request.getRequestDispatcher("MaPage.jsp");
                }
                
            } else {
                // Handle failed login attempt (e.g., redirect to login page with error message)
                System.out.println("Invalid login credentials");
                dispatcher = request.getRequestDispatcher("index.jsp?error=Invalid+credentials"); // Redirect to login page with error parameter
            }

            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle database errors gracefully (e.g., log the error and provide a generic error message to the user)
        } finally {
            // Close resources in reverse order of opening
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
