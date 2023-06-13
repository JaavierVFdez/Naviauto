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
import modelo.dao.CategoriaDAO;
import modelo.dao.ProductoDAO;
import modelo.dao.UsuarioDAO;
import modelo.entidad.Categoria;
import modelo.entidad.Producto;

/**
 *
 * @author javie
 */
@WebServlet(name = "Productos", urlPatterns = {"/Productos"})
public class Productos extends HttpServlet {

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
            ProductoDAO productoDao = new ProductoDAO();
            CategoriaDAO categoriaDao = new CategoriaDAO();
            
            List<Producto> productos = productoDao.getListaProducto();
            List<Categoria> categorias = categoriaDao.mostrarCategorias();
            

            //Abrimos la sesion
            HttpSession sesion = request.getSession();

            String correo = (String) sesion.getAttribute("correo");
            String tipoUsuario = usuarioDao.obtenerTipoUsuario(correo);
            String dni = usuarioDao.obtenerDNI(correo);
            

            request.setAttribute("correo", correo);
            request.setAttribute("productos", productos);
            request.setAttribute("categorias", categorias);
            productoDao.cerrarConexion();

            //Creamos la lista con las reparaciones globales o del usuario en cuestion
            if (tipoUsuario.equals("jefe") || tipoUsuario.equals("admin")) {
                request.getRequestDispatcher("gestion/admin/panelProductos.jsp").forward(request, response);
                return;

            } else {
                //Redirigimos
                request.getRequestDispatcher("productos.jsp").forward(request, response);
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
