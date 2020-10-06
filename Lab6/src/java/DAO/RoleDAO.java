/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Role;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tangminhtin
 */
public class RoleDAO {
    private Connection connection;
    private ArrayList<Role> roles;

    public RoleDAO() {
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();
        roles = new ArrayList<>();
        load();
    }
    
    public void load() {
        try {
            String sql = "SELECT * FROM roles";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                roles.add(new Role(
                        rs.getInt("roleID"),
                        rs.getString("roleName")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getRole(int roleID) {
        for(Role r: roles) {
            if(r.getRoleID() == roleID) {
                return r.getRoleName();
            }
        }
        return "";
    }
    
    
    
}
