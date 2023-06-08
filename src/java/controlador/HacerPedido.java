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
import modelo.dao.DetallePedidoDAO;
import modelo.dao.PedidoDAO;
import modelo.dao.ProductoDAO;
import modelo.dao.UsuarioDAO;
import modelo.entidad.Carrito;

/**
 *
 * @author javie
 */
@WebServlet(name = "HacerPedido", urlPatterns = {"/HacerPedido"})
public class HacerPedido extends HttpServlet {

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

            //Abrimos sesion
            HttpSession sesion = request.getSession();
            List<modelo.entidad.Carrito> carritos = (List<modelo.entidad.Carrito>) sesion.getAttribute("carritos");

            //Objetos
            PedidoDAO pedidoDao = new PedidoDAO();
            DetallePedidoDAO detallePedidoDao = new DetallePedidoDAO();
            UsuarioDAO usuarioDao = new UsuarioDAO();
            ProductoDAO productoDao = new ProductoDAO();
            CarritoDAO carritoDao = new CarritoDAO();

            //Almacenamos los datos
            String nombre_usuario = request.getParameter("nombre_usuario");
            String apellido_usuario = request.getParameter("apellido_usuario");
            String telefono = request.getParameter("telefono_usuario");
            String correo = (String) sesion.getAttribute("correo");
            String dni = usuarioDao.obtenerDNI(correo);
            String direccion = request.getParameter("direccion_usuario");

            //Variables para almacenar la informacion de los productos
            int id_producto = 0;
            int id_carrito = 0;
            int id_pedido = 0;
            int cantidad = 0;
            float precio = 0;
            float precio_total = Float.parseFloat(request.getParameter("precio_con_iva"));
            String estado = "pendiente";

            System.out.println("NOMBRE: " + nombre_usuario);
            System.out.println("APELLIDO: " + apellido_usuario);
            System.out.println("CORREO: " + correo);
            System.out.println("DNI: " + dni);
            System.out.println("TELEFONO: " + telefono);
            System.out.println("PRECIO_TOTAL: " + precio_total);
            System.out.println("DIRECCION: " + direccion);
            System.out.println("ESTADO: " + estado);

            //Insertamos el pedido
            pedidoDao.addPedido(dni, precio_total, direccion, estado);
            id_pedido = pedidoDao.obtenerIdPedido(dni);

            //Hacemos el pedido
            for (modelo.entidad.Carrito carrito : carritos) {

                id_producto = carrito.getId_producto();
                id_carrito = carrito.getId_carrito();
                cantidad = carrito.getCantidad();
                precio = carrito.getPrecio();
                dni = carrito.getDni_cliente();

                //Insertamos los detalles del pedido
                detallePedidoDao.addDetallePedido(id_pedido, id_producto, cantidad, precio);

                //Actualizamos el stock de los productos comprados
                productoDao.actualizarStock(id_producto, cantidad);
            }

            //Vaciamos la cesta
            carritoDao.vaciarCesta(dni);
            detallePedidoDao.cerrarConexion();
            usuarioDao.cerrarConexion();
            productoDao.cerrarConexion();
            pedidoDao.cerrarConexion();
            //Redirigimos
            boolean comprado = true;
            request.setAttribute("comprado", comprado);
            request.getRequestDispatcher("Carrito").forward(request, response);
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
