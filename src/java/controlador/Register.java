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
import modelo.dao.UsuarioDAO;

/**
 *
 * @author javie
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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

            //Inicializamos los parámtros
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("tlf");
            String dni = request.getParameter("dni");
            String password = request.getParameter("password");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String tipoUsuario = "usuario";

            //Booleanos para comprobar si los datos son válidos
            boolean emailCorrecto = false;
            boolean dniCorrecto = false;
            boolean telefonoCorrecto = false;
            boolean telefonoIntroducido = false;

            boolean mensajeError = false;

            //Objeto
            UsuarioDAO usuarioDao = new UsuarioDAO();

            //Comprobamos si el DNI ya existe
            if (!usuarioDao.comprobarDNI(dni)) {
                dniCorrecto = true;
            }

            //Comprobamos si ya existe el correo
            if (!usuarioDao.comprobarEmail(correo)) {
                emailCorrecto = true;
            }

            if (!usuarioDao.comprobarTLF(telefono)) {
                telefonoCorrecto = true;
            }

            //Comprobamos si los datos son validos para crear el usuario
            if (emailCorrecto && dniCorrecto && telefonoCorrecto) {

                //Damos de alta al usuario
                usuarioDao.addUsuario(dni, telefono, correo, password, nombre, apellido, tipoUsuario);
                response.sendRedirect("login.jsp");
                return;

            } else if (!emailCorrecto && !dniCorrecto && !telefonoCorrecto) {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Por favor, introduzca otro 'Email', 'DNI','Teléfono'.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            } else if (!dniCorrecto && !emailCorrecto) {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Por favor, introduzca otro 'Email' y 'DNI'.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            } else if (!telefonoCorrecto && !emailCorrecto) {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Por favor, introduzca otro 'Email' y 'Teléfono'.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            } else if (!dniCorrecto && !telefonoCorrecto) {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Por favor, introduzca otro 'DNI' y 'Teléfono'.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            } else if (!dniCorrecto) {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Por favor, introduzca otro 'DNI'.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            } else if (!telefonoCorrecto) {
                //Redirigimos
                mensajeError = true;
                request.setAttribute("mensajeError", mensajeError);
                request.setAttribute("error", "Por favor, introduzca otro 'Teléfono'.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
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
