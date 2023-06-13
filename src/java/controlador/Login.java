/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.UsuarioDAO;

/**
 *
 * @author javie
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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

        //Inicializamos los parámtros
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        //Tipos de usuarios
        boolean jefe = false;
        boolean admin = false;
        boolean registrado = false;

        boolean mensajeError = false;

        //Creamos las sesiones
        HttpSession sesion = request.getSession();
        sesion.setAttribute("correo", correo);

        //Objeto
        UsuarioDAO usuarioDao = new UsuarioDAO();

        //Comprobamos que los campos no esten vacíos
        if (correo != null && password != null) {

            //Comprobamos que las credenciales sean correctas
            if (usuarioDao.comprobarCredenciales(correo, password)) {

                //Comprobamos el tipo de usuario
                if (usuarioDao.tipoUsuario(correo).equals("jefe")) {
                    jefe = true;
                    request.setAttribute("jefe", jefe);
                    sesion.setAttribute("jefe", jefe);
                    sesion.setAttribute("tipoUsuario", "jefe");
                    response.sendRedirect(("PanelJefe"));
                    return;
                }
                if (usuarioDao.tipoUsuario(correo).equals("admin")) {
                    admin = true;
                    request.setAttribute("admin", admin);
                    sesion.setAttribute("admin", admin);
                    sesion.setAttribute("tipoUsuario", "admin");
                    usuarioDao.cerrarConexion();
                    response.sendRedirect(("PaginaAdmin"));
                    return;
                }
                if (usuarioDao.tipoUsuario(correo).equals("usuario")) {
                    registrado = true;
                    request.setAttribute("registrado", registrado);
                    sesion.setAttribute("registrado", registrado);
                    sesion.setAttribute("tipoUsuario", "registrado");
                    usuarioDao.cerrarConexion();
                    response.sendRedirect(("index.jsp"));
                    return;
                }
            } else {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Credenciales Incorrectas.");
                usuarioDao.cerrarConexion();
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
