/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.UsuarioDAO;
import modelo.entidad.Usuario;

/**
 *
 * @author javie
 */
@WebServlet(name = "EditarPerfil", urlPatterns = {"/EditarPerfil"})
public class EditarPerfil extends HttpServlet {

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

            //Objetos
            UsuarioDAO usuarioDao = new UsuarioDAO();

            boolean telefonoNoExiste;

            Object correoNoExisteObj = request.getAttribute("correoNoExiste");

            if (correoNoExisteObj instanceof Boolean) {
                boolean correoNoExiste = (Boolean) correoNoExisteObj;
                request.setAttribute("correoNoExiste", correoNoExiste);
            }

            //Abrimos la seseion
            HttpSession sesion = request.getSession();

            String correo = (String) sesion.getAttribute("correo");
            String dni = "";
            String nombre = "";
            String apellido = "";
            String telefono = "";
            String direccion = "";

            boolean usuarioLogado = false;

            if (sesion.getAttribute("correo") != null || !sesion.getAttribute("correo").equals("")) {
                correo = (String) sesion.getAttribute("correo");
                dni = usuarioDao.obtenerDNI(correo);
                nombre = usuarioDao.obtenerNombre(correo);
                apellido = usuarioDao.obtenerApellido(correo);
                telefono = usuarioDao.obtenerTLF(correo);
                direccion = usuarioDao.obtenerDireccion(correo);
                usuarioLogado = true;
            }

            System.out.println(correo);
            System.out.println(nombre);
            System.out.println(apellido);
            System.out.println(direccion);

            Usuario usuario = new Usuario(dni, correo, "", nombre, apellido, "", direccion);
            request.setAttribute("usuario", usuario);
            request.setAttribute("telefono", telefono);

            if (usuarioLogado) {
                request.getRequestDispatcher("editarInformacionUsuario.jsp").forward(request, response);
                return;
            } else {
                request.getRequestDispatcher("PaginaInicio").forward(request, response);
                return;
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
        request.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
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
