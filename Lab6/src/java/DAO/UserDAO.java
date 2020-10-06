/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
public class UserDAO {

    private Connection connection;
    private ArrayList<User> users;

    public UserDAO() {
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();
        users = new ArrayList<>();
        load();
    }
    public void load() {
        try {
            String sql = "SELECT * FROM users";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            users.clear();
            while (rs.next()) {
                users.add(new User(
                        rs.getString("userID"), 
                        rs.getString("password"),
                        rs.getString("firstname"), 
                        rs.getString("lastname"), 
                        rs.getInt("isSendNotification"), 
                        rs.getString("website"), 
                        rs.getInt("roleID"),
                        rs.getString("email")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertUser(String userID, String password, String firstname, String lastname, int isSendNotification, String website, String roleName, String email) {
        try {
            String sql = "INSERT INTO `users`(`userID`, `password`, `firstname`, `lastname`, `isSendNotification`, `website`, `roleID`, `email`) VALUES (?, MD5(?), ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, password);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setInt(5, isSendNotification);
            ps.setString(6, website);
            ps.setString(7, roleName);
            ps.setString(8, email);
            ps.execute();
            load();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<User> getUsers() {
        return users;
    }

    public User login(String userID, String password) {
        try {
            String sql = "SELECT * FROM users WHERE userID=? AND password=MD5(?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getString("userID"), 
                        rs.getString("password"),
                        rs.getString("firstname"), 
                        rs.getString("lastname"), 
                        rs.getInt("isSendNotification"), 
                        rs.getString("website"), 
                        rs.getInt("roleID"),
                        rs.getString("email")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void changeRole(String userID, int roleID) {
        try {
            String sql = "UPDATE `users` SET `roleID`=? WHERE userID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleID);
            ps.setString(2, userID);
            ps.execute();
            load();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getSub() {
        int i=0;
        for(User u: users) {
            if(u.getRoleID() == 2) {
                i++;
            }
        }
        return i;
    }
    public int getAd() {
        int i=0;
        for(User u: users) {
            if(u.getRoleID() == 1) {
                i++;
            }
        }
        return i;
    }
    
    public ArrayList<User> getUser(int roleID) {
        ArrayList<User> us = new ArrayList<>();
        for(User u : users) {
            if(u.getRoleID() == roleID) {
                us.add(u);
            }
        }
        return us;
    }
    
    public int getSize() {
        return users.size();
    }
}
