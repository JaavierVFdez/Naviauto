package controlador;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.dao.ProductoDAO;

@WebServlet(name = "ProductoEditado", urlPatterns = {"/ProductoEditado"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5)
public class ProductoEditado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProductoDAO productoDao = new ProductoDAO();

        // Obtén los valores de los campos del formulario
        String id_producto_value = request.getParameter("id_producto");
        int id_producto = 0;
        if (id_producto_value != null && !id_producto_value.trim().isEmpty()) {
            id_producto = Integer.parseInt(id_producto_value.trim());
        }

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String categoria = request.getParameter("categoria");

        String stockValue = request.getParameter("stock");
        int stock = 0;
        if (stockValue != null && !stockValue.trim().isEmpty()) {
            stock = Integer.parseInt(stockValue.trim());
        }

        String precioValue = request.getParameter("precio");
        float precio = 0.0f;
        if (precioValue != null && !precioValue.trim().isEmpty()) {
            precio = Float.parseFloat(precioValue.trim());
        }

        // Obtén la parte de la imagen del archivo cargado
        Part filePart = request.getPart("url_producto");

        String url = null;

        // Verifica si la parte de la imagen está presente y si tiene un tamaño superior a 0
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = filePart.getInputStream();
            String applicationPath = request.getServletContext().getRealPath("");
            File uploads = new File(applicationPath + File.separator + "resources" + File.separator + "productos");
            File file = new File(uploads, fileName);

            // Si el archivo existe en el servidor, eliminarlo
            if (file.exists()) {
                file.delete();
            }

            // Subir la nueva imagen
            try (InputStream input = fileContent) {
                Files.copy(input, file.toPath());
            }

            // Almacenar la URL de la imagen para actualizar la base de datos
            url = "resources/productos/" + fileName; // Asegúrate de que la ruta es correcta para tu aplicación

        } else {
            // Si no se sube un archivo, utiliza la URL de la imagen antigua.
            url = request.getParameter("imagen_antigua");
        }
        
        System.out.println(url);

        // Actualizar producto en base de datos
        productoDao.actualizarProducto(id_producto, nombre, descripcion, categoria, url, precio, stock);

        // Redireccionar a la página de productos
        response.sendRedirect("Productos");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }
}
