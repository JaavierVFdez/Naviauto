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
import modelo.entidad.Reparacion;

/**
 *
 * @author javie
 */
@WebServlet(name = "EditarReparacion", urlPatterns = {"/EditarReparacion"})
public class EditarReparacion extends HttpServlet {

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

            // Almacenamos los datos
            int codigo_reparacion = Integer.valueOf(request.getParameter("codigo_reparacion"));
            String matricula = request.getParameter("matricula");
            String descripcion = request.getParameter("descripcion");
            String fechaFinalizacion = "";

            if (request.getParameter("fechaFinalizacion") != null || request.getParameter("fechaFinalizacion").equals("")) {
                fechaFinalizacion = request.getParameter("fechaFinalizacion");
            }

            String fechaEntrada = request.getParameter("fechaEntrada");
            String estado = request.getParameter("estado");
            float precio = Float.parseFloat(request.getParameter("precio"));

            Reparacion reparacion = new Reparacion(codigo_reparacion, matricula, descripcion, fechaEntrada, fechaFinalizacion, estado, precio);

            request.setAttribute("reparacion", reparacion);
            request.getRequestDispatcher("gestion/admin/editarReparacion.jsp").forward(request, response);
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
