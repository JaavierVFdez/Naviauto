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
import modelo.dao.CarritoDAO;
import modelo.dao.UsuarioDAO;


/**
 *
 * @author javie
 */
@WebServlet(name = "Carrito", urlPatterns = {"/Carrito"})
public class Carrito extends HttpServlet {

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
            CarritoDAO carritoDao = new CarritoDAO();
            UsuarioDAO usuarioDao = new UsuarioDAO();
            
            //Abrimos la sesion
            HttpSession sesion = request.getSession();
            
            //Almacenamos la informacion del usuario en cuestion
            String correo = (String)sesion.getAttribute("correo");
            String nombre = usuarioDao.obtenerNombre(correo);
            String apellido = usuarioDao.obtenerApellido(correo);
            String dni = usuarioDao.obtenerDNI(correo);
            String telefono = usuarioDao.obtenerTLF(correo);
            String direccion = "";
            
            if(usuarioDao.direccionExiste(correo)) {
                direccion = usuarioDao.obtenerDireccion(correo);
            }
            
            request.setAttribute("nombre_usuario", nombre);
            request.setAttribute("apellido_usuario", apellido);
            request.setAttribute("dni_usuario", dni);
            request.setAttribute("telefono_usuario", telefono);
            request.setAttribute("correo_usuario", correo);
            request.setAttribute("direccion_usuario", direccion);
            
            
            //Almacenamos el carrito del usuario
            List<modelo.entidad.Carrito> carritos = carritoDao.getListaCarrito(dni);
            sesion.setAttribute("carritos", carritos); 
            usuarioDao.cerrarConexion();
            carritoDao.cerrarConexion();
            //Redirigimos
            boolean comprado = false;
            if(request.getAttribute("comprado") != null) {
                comprado = (boolean)request.getAttribute("comprado");
            }
            request.getRequestDispatcher("carrito.jsp").forward(request, response);
            return;
            
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