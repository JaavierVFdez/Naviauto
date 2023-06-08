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
import modelo.dao.ReparacionDAO;
import modelo.dao.UsuarioDAO;
import modelo.entidad.Reparacion;

/**
 *
 * @author javie
 */
@WebServlet(name = "Reparaciones", urlPatterns = {"/Reparaciones"})
public class Reparaciones extends HttpServlet {

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
            ReparacionDAO reparacionDao = new ReparacionDAO();

            //Abrimos la sesion
            HttpSession sesion = request.getSession();

            //Almacenamos la informacion del usuario para determinar el tipo de usuario que es
            String correo = (String) sesion.getAttribute("correo");
            String tipoUsuario = usuarioDao.obtenerTipoUsuario(correo);
            String dni = usuarioDao.obtenerDNI(correo);
            
            boolean matriculaExiste = false;
            if(request.getAttribute("matriculaExiste") != null) {
                matriculaExiste = (boolean)request.getAttribute("matriculaExiste");
            }

            //Creamos la lista con las reparaciones globales o del usuario en cuestion
            if (tipoUsuario.equals("jefe") || tipoUsuario.equals("admin")) {
                List<Reparacion> reparaciones = reparacionDao.obtenerReparaciones();
                request.setAttribute("reparaciones", reparaciones);
                request.setAttribute("matriculaExiste", matriculaExiste);
                
                request.getRequestDispatcher("gestion/admin/panelReparaciones.jsp").forward(request, response);
                return;

            } else {
                List<Reparacion> reparaciones = reparacionDao.obtenerReparacionesUsuario(dni);
                request.setAttribute("reparaciones", reparaciones);
                
                request.getRequestDispatcher("misReparaciones.jsp").forward(request, response);
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
