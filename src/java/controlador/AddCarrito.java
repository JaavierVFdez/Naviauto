/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.CarritoDAO;
import modelo.dao.ProductoDAO;
import modelo.dao.UsuarioDAO;
import modelo.entidad.Usuario;

/**
 *
 * @author javie
 */
@WebServlet(name = "AddCarrito", urlPatterns = {"/AddCarrito"})
public class AddCarrito extends HttpServlet {

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
            CarritoDAO carritoDao = new CarritoDAO();
            ProductoDAO productoDao = new ProductoDAO();

            //Almacenamos la informacion
            String correoUsuario = "";
            String dni = "";

            boolean productoAdded = false;
            boolean noLog = false;
            boolean noActualizar = false;

            //Creamos la sesion
            HttpSession sesion = request.getSession();

            if (sesion.getAttribute("correo") == null || sesion.getAttribute("correo").equals("")) {
                noLog = true;
                request.setAttribute("noLog", noLog);
                request.setAttribute("noLogado", "Tienes que iniciar sesión para comprar.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Productos");
                dispatcher.forward(request, response);
            } else {
                correoUsuario = (String) sesion.getAttribute("correo");
                dni = usuarioDao.obtenerDNI(correoUsuario);

                //productos
                int idProducto = Integer.parseInt(request.getParameter("codigoProducto"));
                float precio = Float.parseFloat(request.getParameter("precio"));
                int cantidad = 1;

                //Comprobamos si el producto ya esta añadido en la cesta y le sumamos 1
                if (carritoDao.comprobarProductoCarrito(idProducto, dni)) {
                    cantidad = carritoDao.obtenerCantidad(dni, idProducto) + 1;
                    precio = precio * cantidad;

                    //Actualizamos el stock
                    carritoDao.actualizarStockProductoCarrito(dni, idProducto, cantidad, precio);
                    noActualizar = true;
                }

                //Comprobamos si queda stock
                if (!productoDao.comprobarStock(idProducto, cantidad)) {

                    //Comprobamos si el usuario va a añadir mas del mismo producto o es nuevo
                    if (!noActualizar) {
                        carritoDao.addProductoCarrito(dni, idProducto, cantidad, precio);

                    }
                    usuarioDao.cerrarConexion();
                    productoDao.cerrarConexion();
                    carritoDao.cerrarConexion();
                    productoAdded = true;
                    request.setAttribute("productoAdded", productoAdded);
                    request.setAttribute("mensajeCarrito", "Producto añadido.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Productos");
                    dispatcher.forward(request, response);

                } else {
                    usuarioDao.cerrarConexion();
                    productoDao.cerrarConexion();
                    carritoDao.cerrarConexion();
                    request.setAttribute("productoAdded", productoAdded);
                    request.setAttribute("mensajeCarrito", "No puedes añadir más, sin stock.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Productos");
                    dispatcher.forward(request, response);
                }
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
