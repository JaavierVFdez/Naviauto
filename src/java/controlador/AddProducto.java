/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.dao.ProductoDAO;
import modelo.entidad.Producto;

/**
 *
 * @author javie
 */
@WebServlet(name = "AddProducto", urlPatterns = {"/AddProducto"})
@MultipartConfig
public class AddProducto extends HttpServlet {

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
            ProductoDAO productoDao = new ProductoDAO();

            //Almacenamos los datos
            Part nombrePart = request.getPart("nombre");
            String nombre = null;
            if (nombrePart != null) {
                try (InputStream inputStream = nombrePart.getInputStream()) {
                    ByteArrayOutputStream result = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inputStream.read(buffer)) != -1) {
                        result.write(buffer, 0, length);
                    }
                    nombre = result.toString(StandardCharsets.UTF_8.name());
                }
            }

            Part descripcionPart = request.getPart("descripcion");
            String descripcion = null;
            if (descripcionPart != null) {
                try (InputStream inputStream = descripcionPart.getInputStream()) {
                    ByteArrayOutputStream result = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inputStream.read(buffer)) != -1) {
                        result.write(buffer, 0, length);
                    }
                    descripcion = result.toString(StandardCharsets.UTF_8.name());
                }
            }

            Part categoriaPart = request.getPart("categoria");
            String categoria = null;
            if (categoriaPart != null) {
                try (InputStream inputStream = categoriaPart.getInputStream()) {
                    ByteArrayOutputStream result = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inputStream.read(buffer)) != -1) {
                        result.write(buffer, 0, length);
                    }
                    categoria = result.toString(StandardCharsets.UTF_8.name());
                }
            }

            Part stockPart = request.getPart("stock");
            String stockValue = null;
            if (stockPart != null) {
                try (InputStream inputStream = stockPart.getInputStream()) {
                    ByteArrayOutputStream result = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inputStream.read(buffer)) != -1) {
                        result.write(buffer, 0, length);
                    }
                    stockValue = result.toString(StandardCharsets.UTF_8.name());
                }
            }
            int stock = 0;
            if (stockValue != null && !stockValue.trim().isEmpty()) {
                stock = Integer.parseInt(stockValue.trim());
            }

            Part precioPart = request.getPart("precio");
            String precioValue = null;
            if (precioPart != null) {
                try (InputStream inputStream = precioPart.getInputStream()) {
                    ByteArrayOutputStream result = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inputStream.read(buffer)) != -1) {
                        result.write(buffer, 0, length);
                    }
                    precioValue = result.toString(StandardCharsets.UTF_8.name());
                }
            }
            float precio = 0.0f;
            if (precioValue != null && !precioValue.trim().isEmpty()) {
                precio = Float.parseFloat(precioValue.trim());
            }

            //Obtener la parte de la imagen
            Part filePart = request.getPart("url_producto");
            String fileName = null;
            String url = "";
            
            if (filePart != null && filePart.getSize() > 0) {
                fileName = filePart.getSubmittedFileName();

                String applicationPath = request.getServletContext().getRealPath("");
                File uploads = new File(applicationPath + File.separator + "resources" + File.separator + "productos");

                // Crea la carpeta si no existe.
                if (!uploads.exists()) {
                    uploads.mkdirs();
                }

                // Crear el archivo en el servidor.
                File file = new File(uploads, fileName);

                // Escribir la imagen en el archivo.
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                // Aquí puedes obtener la URL de la imagen que vas a guardar en la base de datos.
                url = "resources/productos/" + fileName;
            }

            //Crear el producto y añadirlo mediante el DAO
            Producto producto = new Producto(nombre, descripcion, categoria, url, precio, stock);
            productoDao.addProducto(nombre, descripcion, categoria, url, precio, stock);

            //Redirigir a la página de administración de productos
            request.getRequestDispatcher("Productos").forward(request, response);
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
