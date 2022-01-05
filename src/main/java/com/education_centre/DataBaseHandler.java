package com.education_centre;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;

public class DataBaseHandler {

    public static Connection getConnection() throws SQLException{
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/coursework", "root", "");
        System.out.println("Connection success");
        return connection;


    }

    public static ObservableList<Students_TookBook> getDataStudents() throws SQLException {
        Connection conn = getConnection();
        ObservableList<Students_TookBook> list = FXCollections.observableArrayList();
        try {
            assert conn != null;
            PreparedStatement ps = conn.prepareStatement("select * from `coursework`.students_tookbook");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Students_TookBook(rs.getInt("num"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("author"), rs.getString("book"), rs.getString("date_of_took")));
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ObservableList<Teachers_TookBook> getDataTeachers() throws SQLException {
        Connection conn = getConnection();
        ObservableList<Teachers_TookBook> list = FXCollections.observableArrayList();
        try {
            assert conn != null;
            PreparedStatement ps = conn.prepareStatement("select * from `coursework`.teachers_tookbook");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Teachers_TookBook(rs.getInt("num"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("author"), rs.getString("book"), rs.getString("date_of_took")));
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }



}
