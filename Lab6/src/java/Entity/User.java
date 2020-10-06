/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author tangminhtin
 */
public class User {
    private String userID;
    private String password;
    private String firstname;
    private String lastname;
    private int isSendNotification;
    private String website;
    private int roleID;
    private String email;

    public User(String userID, String password, String firstname, String lastname, int isSendNotification, String website, int roleID, String email) {
        this.userID = userID;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.isSendNotification = isSendNotification;
        this.website = website;
        this.roleID = roleID;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getIsSendNotification() {
        return isSendNotification;
    }

    public void setIsSendNotification(int isSendNotification) {
        this.isSendNotification = isSendNotification;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleName) {
        this.roleID = roleName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
