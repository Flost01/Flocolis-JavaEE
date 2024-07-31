package com.flocolis.traitement;

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

@WebServlet("/EditColis")
public class edit extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    // Retrieve the client ID from the session, assuming the attribute name is "id_client"
    String idColis=request.getParameter("id");
    String cate = request.getParameter("cat");
    String description = request.getParameter("Des");
    String nomD = request.getParameter("nomD");
    String emailD = request.getParameter("emailD");
    String delai = request.getParameter("delai");
    int phone = Integer.parseInt(request.getParameter("phoneD"));
    String destination = request.getParameter("adresseD");
    Timestamp time = new Timestamp(System.currentTimeMillis());

    System.out.println(description + "" + idColis+ "" +cate);
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
      //Class.forName("com.mysql.cj.jdbc.Driver");
     
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flocolis","root","");
      preparedStatement = connection.prepareStatement("UPDATE `colis` SET `id_cat`=?,`Descrition`=?,`date_creation`=?,`delai_livraison`=?,`NomDes`=?,`EmailDes`=?,`PhoneDes`=?,`Destination`=? WHERE id_colis=?");
      // Set the client ID as the first parameter (assuming it's a String)
      preparedStatement.setString(1, cate);
      preparedStatement.setString(2, description);
      preparedStatement.setTimestamp(3, time);
      preparedStatement.setString(4, delai);
      preparedStatement.setString(5, nomD);
      preparedStatement.setString(6, emailD);
      preparedStatement.setInt(7, phone);
      preparedStatement.setString(8, destination);
      preparedStatement.setString(9, idColis);

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
