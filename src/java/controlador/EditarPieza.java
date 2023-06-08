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
import modelo.dao.ReparacionDAO;
import modelo.entidad.Pieza;
import modelo.entidad.Reparacion;

/**
 *
 * @author javie
 */
@WebServlet(name = "EditarPieza", urlPatterns = {"/EditarPieza"})
public class EditarPieza extends HttpServlet {

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
            
            //Objeto
            ReparacionDAO reparacionDao = new ReparacionDAO();
            
            boolean reparacionNoExiste = false;
            request.setAttribute("reparacionNoExiste", reparacionNoExiste);

            // Almacenamos los datos
            int codigo_pieza = Integer.parseInt(request.getParameter("codigo_pieza"));
            int codigo_reparacion = Integer.parseInt(request.getParameter("codigo_reparacion"));
            String nombre = request.getParameter("nombre");
            String fabricante = request.getParameter("fabricante");
            float precio = Float.parseFloat(request.getParameter("precio"));
            
            System.out.println(codigo_pieza);
            System.out.println(codigo_reparacion);
            System.out.println(nombre);
            System.out.println(fabricante);
            System.out.println(precio);

            Pieza pieza = new Pieza(codigo_pieza, codigo_reparacion, nombre, fabricante, precio);
            
            request.setAttribute("pieza", pieza);
            request.getRequestDispatcher("gestion/admin/editarPieza.jsp").forward(request, response);
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
