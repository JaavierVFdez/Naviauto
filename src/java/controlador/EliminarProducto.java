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
import modelo.dao.CarritoDAO;
import modelo.dao.DetallePedidoDAO;
import modelo.dao.ProductoDAO;

/**
 *
 * @author javie
 */
@WebServlet(name = "EliminarProducto", urlPatterns = {"/EliminarProducto"})
public class EliminarProducto extends HttpServlet {

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
            
            //Almacenamos los datos
            int id_producto = Integer.parseInt(request.getParameter("id_producto"));
            
            ProductoDAO productoDao = new ProductoDAO();
            CarritoDAO carritoDao = new CarritoDAO();
            DetallePedidoDAO detallePedidoDao = new DetallePedidoDAO();
            
            //COmprobamos si el producto esta en el carrito, en caso de ser asi lo eliminamos
            if(carritoDao.productoExiste(id_producto)) {
                carritoDao.adminEliminarProductoCarrito(id_producto);
            }
            
            //Comprobamos si el producto esta en detalles pedido
            if(detallePedidoDao.productoExiste(id_producto)) {
                detallePedidoDao.adminEliminarProducto(id_producto);
            }
            
            //Eliminamos el producto
            productoDao.eliminarProducto(id_producto);
            response.sendRedirect("Productos");
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
