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

@WebServlet("/AddColis")
public class add extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    // Retrieve the client ID from the session, assuming the attribute name is "id_client"
    String idClient = (String) session.getAttribute("id_clent");
    String cate = request.getParameter("cat");
    String description = request.getParameter("Des");
    String nomD = request.getParameter("nomD");
    String emailD = request.getParameter("emailD");
    String delai = request.getParameter("delai");
    int phone = Integer.parseInt(request.getParameter("phoneD"));
    String destination = request.getParameter("adresseD");
    Timestamp time = new Timestamp(System.currentTimeMillis());

    System.out.println(description + "" + idClient+ "" +cate);
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
      //Class.forName("com.mysql.cj.jdbc.Driver");
     
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
      preparedStatement = connection.prepareStatement("INSERT INTO `colis`(`id_clent`, `id_cat`, `Descrition`, `date_creation`, `delai_livraison`, `NomDes`, `EmailDes`, `PhoneDes`, `Destination`) VALUES(?,?,?,?,?,?,?,?,?) ");
      // Set the client ID as the first parameter (assuming it's a String)
      preparedStatement.setString(1, idClient);
      preparedStatement.setString(2, cate);
      preparedStatement.setString(3, description);
      preparedStatement.setTimestamp(4, time);
      preparedStatement.setString(5, delai);
      preparedStatement.setString(6, nomD);
      preparedStatement.setString(7, emailD);
      preparedStatement.setInt(8, phone);
      preparedStatement.setString(9, destination);

      preparedStatement.executeUpdate();
      response.sendRedirect("MaPage.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      // Close resources (connection, preparedStatement, resultSet) to avoid leaks
      if (connection != null) {
        try {
          connection.close();
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
      if (resultSet != null) {
        try {
          resultSet.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
  }
}
