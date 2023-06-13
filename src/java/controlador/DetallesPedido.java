/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.DetallePedidoDAO;
import modelo.dao.ProductoDAO;
import modelo.entidad.DetallePedido;
import modelo.entidad.Producto;

/**
 *
 * @author javie
 */
@WebServlet(name = "DetallesPedido", urlPatterns = {"/DetallesPedido"})
public class DetallesPedido extends HttpServlet {

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
            DetallePedidoDAO detallePedidoDao = new DetallePedidoDAO();
            ProductoDAO productoDao = new ProductoDAO();

            //Almacenamos los datos
            int id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
            float precio_total = Float.parseFloat(request.getParameter("precio_total"));
            
            List<DetallePedido> detallesPedidos = detallePedidoDao.obtenerDetallesPedido(id_pedido);
            List<Producto> productos = new ArrayList();

            String url = "";
            String nombre_producto = "";

            for (DetallePedido detalleP : detallesPedidos) {
                url = productoDao.obtenerUrlProducto(detalleP.getId_producto());
                nombre_producto = productoDao.obtenerNombreProducto(detalleP.getId_producto());
                
                Producto producto = new Producto(detalleP.getId_producto(), nombre_producto, url, detalleP.getPrecio());
                
                System.out.println(url);
                System.out.println(nombre_producto);
                System.out.println(detalleP.getId_producto());
                
                
                productos.add(producto);
            }

            request.setAttribute("precio_total", precio_total);
            request.setAttribute("productos", productos);
            request.setAttribute("detallesPedidos", detallesPedidos);
            request.getRequestDispatcher("detallePedido.jsp").forward(request, response);
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
