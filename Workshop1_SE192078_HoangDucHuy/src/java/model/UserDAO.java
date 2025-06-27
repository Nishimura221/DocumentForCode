/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DbUtils;

public class UserDAO {

    public UserDAO() {
    }

    public boolean login(String username, String password) {
        try {
            UserDTO user = getUserByName(username);
            if (user != null) {
                if (user.getPassword().equals(password)) {
                 return true;
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    public UserDTO getUserByName(String username) {
        try {
            String sql = "SELECT*FROM tblUsers" + " WHERE Username=?";

            Connection conn = DbUtils.getConnection();

            PreparedStatement pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            ResultSet rs = pr.executeQuery();

            while (rs.next()) {
                String Username = rs.getString("Username");
                String name = rs.getString("Name");
                String password = rs.getString("Password");
                String role = rs.getString("Role");

                UserDTO userDTO = new UserDTO(Username, name, password, role);
                return userDTO;
            }
            return null;
        } catch (Exception e) {
            return null;
        }

    }

}
