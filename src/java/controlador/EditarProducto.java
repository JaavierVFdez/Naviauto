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
import modelo.dao.CategoriaDAO;
import modelo.entidad.Categoria;
import modelo.entidad.Producto;

/**
 *
 * @author javie
 */
@WebServlet(name = "EditarProducto", urlPatterns = {"/EditarProducto"})
public class EditarProducto extends HttpServlet {

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
            
            CategoriaDAO categoriaDao = new CategoriaDAO();
            
            //Almacenamos los datos
            int id_producto = Integer.parseInt(request.getParameter("id_producto"));
            String url = request.getParameter("url_producto");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String categoria = request.getParameter("categoria");
            int stock = Integer.parseInt(request.getParameter("stock"));
            float precio = Float.parseFloat(request.getParameter("precio"));
            
            //Objeto
            List<Categoria> categorias = categoriaDao.mostrarCategorias();
            Producto producto = new Producto(id_producto, nombre, descripcion, categoria, url, precio, stock);
            request.setAttribute("producto", producto);
            request.setAttribute("categorias", categorias);
            request.getRequestDispatcher("gestion/admin/editarProducto.jsp").forward(request, response);
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
