
import DAO.UserDAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tangminhtin
 */
public class test {
    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        udao.insertUser("SE123", "123", "Minh Tin", "Tang", 0, "tin.com", "admin", "minhtin@gmail.com");
    }
}
