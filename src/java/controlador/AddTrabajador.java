/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.UsuarioDAO;
import modelo.entidad.Usuario;

/**
 *
 * @author javie
 */
@WebServlet(name = "AddTrabajador", urlPatterns = {"/AddTrabajador"})
public class AddTrabajador extends HttpServlet {

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
            UsuarioDAO usuarioDao = new UsuarioDAO();

            String dni_nuevo = request.getParameter("dni");
            String telefono_nuevo = request.getParameter("telefono");
            String correo_nuevo = request.getParameter("correo");
            String password = request.getParameter("password");
            String nombre_nuevo = request.getParameter("nombre");
            String apellido_nuevo = request.getParameter("apellido");
            String tipoUsuario_nuevo = request.getParameter("tipoUsuario");
            String direccion_nuevo = request.getParameter("direccion");

            boolean datosValidos = true;

            // Comprobamos si el teléfono está modificado y si es válido
            if (usuarioDao.comprobarTLF(telefono_nuevo)) {
                datosValidos = false;
            }

            // Comprobamos si el correo está modificado y si es válido
            if (usuarioDao.comprobarEmail(correo_nuevo)) {
                datosValidos = false;
            }
            // Añadimos al usuario si los datos son correctos
            if (datosValidos) {
                usuarioDao.addEmpleado(dni_nuevo, telefono_nuevo, correo_nuevo, password, nombre_nuevo, apellido_nuevo, tipoUsuario_nuevo, direccion_nuevo);
                response.sendRedirect("AdministrarTrabajadores");
            } else {
                request.setAttribute("usuario", new Usuario(dni_nuevo, correo_nuevo, password, nombre_nuevo, apellido_nuevo, tipoUsuario_nuevo, direccion_nuevo));
                request.setAttribute("telefono", telefono_nuevo);
                request.setAttribute("noeditado", true);
                request.getRequestDispatcher("gestion/jefe/nuevoEmpleado.jsp").forward(request, response);
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
