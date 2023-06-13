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
@WebServlet(name = "TrabajadorEditado", urlPatterns = {"/TrabajadorEditado"})
public class TrabajadorEditado extends HttpServlet {

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

            String dni_actual = request.getParameter("dni_actual");
            String telefono_actual = request.getParameter("telefono_actual");
            String correo_actual = request.getParameter("correo_actual");
            String nombre_actual = request.getParameter("nombre_actual");
            String apellido_actual = request.getParameter("apellido_actual");
            String tipoUsuario_actual = request.getParameter("tipoUsuario_actual");
            String direccion_actual = request.getParameter("direccion_actual");
            

            String telefono_nuevo = request.getParameter("telefono");
            String correo_nuevo = request.getParameter("correo");
            String nombre_nuevo = request.getParameter("nombre");
            String apellido_nuevo = request.getParameter("apellido");
            String tipoUsuario_nuevo = request.getParameter("tipoUsuario");
            String direccion_nuevo = request.getParameter("direccion");

            boolean datosValidos = true;

            // Comprobamos si el teléfono está modificado y si es válido
            if (!telefono_actual.equals(telefono_nuevo)) {
                if (usuarioDao.comprobarTLF(telefono_nuevo)) {
                    datosValidos = false;
                }
            }

            // Comprobamos si el correo está modificado y si es válido
            if (!correo_actual.equals(correo_nuevo)) {
                if (usuarioDao.comprobarEmail(correo_nuevo)) {
                    datosValidos = false;
                }
            }

            // Comprobamos si el DNI está modificado y si es válido (si tienes la funcion necesaria)
            /* if (!dni_actual.equals(dni_nuevo)) {
                if (usuarioDao.comprobarDNI(dni_nuevo)) {
                    datosValidos = false;
                }
            } */
            // Actualizamos si los datos son correctos
            if (datosValidos) {
                usuarioDao.actualizarEmpleado(dni_actual, telefono_nuevo, correo_nuevo, nombre_nuevo, apellido_nuevo, tipoUsuario_nuevo, direccion_nuevo);
                response.sendRedirect("AdministrarTrabajadores");
            } else {
                request.setAttribute("usuario", new Usuario(dni_actual, correo_actual,"", nombre_actual, apellido_actual, tipoUsuario_actual, direccion_actual));
                request.setAttribute("telefono", telefono_actual);
                request.setAttribute("noeditado", true);
                request.getRequestDispatcher("gestion/jefe/editarTrabajador.jsp").forward(request, response);
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
