/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.User;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tangminhtin
 */
public class UserController extends HttpServlet {
    private UserDAO udao;

    public UserController() {
        udao = new UserDAO();
    }
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        
        
        if(request.getParameter("choice") ==null || request.getParameter("choice").equals("all")) {
            request.getSession().setAttribute("users", udao.getUsers());
//            response.sendRedirect("management.jsp");
        } else if(request.getParameter("choice").equals("admin")) {
            request.getSession().setAttribute("users", udao.getUser(1));
//            response.sendRedirect("management.jsp");
        } else if(request.getParameter("choice").equals("sub")) {
             request.getSession().setAttribute("users", udao.getUser(2));
//             response.sendRedirect("management.jsp");
        }
        
        if (request.getParameter("btnChange")!=null) {
            String[] userChanges = request.getParameterValues("cbUsers");
            int roleID = Integer.parseInt(request.getParameter("cbRole"));
            if(userChanges !=null) {
                for (String userID : userChanges) {
                    udao.changeRole(userID, roleID);
                }
//                response.sendRedirect("management.jsp");
            } else {
//                response.sendRedirect("management.jsp");
            }
//            response.sendRedirect("management.jsp");
        }
        
        if(request.getParameter("logout")!=null) {
            request.getSession().removeAttribute("user");
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("management.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        String userID = request.getParameter("userID");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String website = request.getParameter("website");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        int noti = request.getParameter("noti") == null? 0: Integer.parseInt(request.getParameter("noti")) ;
        String role = request.getParameter("cbRole");


        if (request.getParameter("btnLogin")!=null) {
            User user = udao.login(userID, password);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("users", udao.getUsers());
                response.sendRedirect("management.jsp");
            } else {
                request.getSession().setAttribute("msg", "Your username or password incorrect!");
                response.sendRedirect("index.jsp");
//                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        
        
        
        if (request.getParameter("btnCreate")!=null) {
            if(password.equals(confirm)) {
                udao.insertUser(userID, password, firstname, lastname, noti, website, role, email);
                request.getSession().setAttribute("users", udao.getUsers());
                response.sendRedirect("management.jsp");
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
