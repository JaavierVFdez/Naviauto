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
import modelo.dao.PiezaDAO;
import modelo.dao.ReparacionDAO;

/**
 *
 * @author javie
 */
@WebServlet(name = "AddPieza", urlPatterns = {"/AddPieza"})
public class AddPieza extends HttpServlet {

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
            ReparacionDAO reparacionDao = new ReparacionDAO();
            PiezaDAO piezaDao = new PiezaDAO();

            boolean reparacionExiste = false;
            boolean reparacionNoExiste = false;

            //Almacenamos los datos
            int codigo_reparacion = Integer.parseInt(request.getParameter("codigoReparacion"));
            String nombre = request.getParameter("nombre");
            String fabricante = request.getParameter("fabricante");
            float precio = Float.parseFloat(request.getParameter("precio"));

            //Comprobamos si la reparacion insertada existe
            if (reparacionDao.codigoReparacionExiste(codigo_reparacion)) {
                
                piezaDao.addPieza(codigo_reparacion, nombre, fabricante, precio);
                
                reparacionExiste = true;
                reparacionDao.cerrarConexion();
                piezaDao.cerrarConexion();
                request.setAttribute("reparacionExiste", reparacionExiste);
                request.getRequestDispatcher("Piezas").forward(request, response);
                return;
            } else {

                reparacionDao.cerrarConexion();
                piezaDao.cerrarConexion();
                reparacionNoExiste = true;
                request.setAttribute("reparacionNoExiste", reparacionNoExiste);
                request.getRequestDispatcher("gestion/admin/nuevaPieza.jsp").forward(request, response);
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
