/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ReparacionDAO;
import modelo.dao.VehiculoDAO;

/**
 *
 * @author javie
 */
@WebServlet(name = "AddReparaciones", urlPatterns = {"/AddReparaciones"})
public class AddReparaciones extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //Objetos
            ReparacionDAO reparacionDao = new ReparacionDAO();
            VehiculoDAO vehiculoDao = new VehiculoDAO();

            boolean matriculaExiste = false;
            boolean matriculaNoExiste = false;

            //Almacenamos los datos
            String matricula = request.getParameter("matricula");
            String descripcion = request.getParameter("descripcion");

            //Le asignamos la fecha
            String fechaE = request.getParameter("fechaEntrada");
            String fechaF = "";
            float precio = Float.parseFloat(request.getParameter("precio"));

            boolean fechaFIntroducida = false;

            if (request.getParameter("fechaFinalizacion") != null && !request.getParameter("fechaFinalizacion").trim().isEmpty()) {
                fechaFIntroducida = true;
                fechaF = request.getParameter("fechaFinalizacion");
            }

            String[] est = request.getParameterValues("estado");
            String estado = String.join(", ", est);

            //Comprobamos si la matricula insertada existe
            if (vehiculoDao.matriculaExiste(matricula)) {
                matriculaExiste = true;
                //Insertamos los datos
                if (fechaFIntroducida) {
                    reparacionDao.addReparacionConFechaFinalizacion(matricula, descripcion, fechaE, fechaF, estado, precio);
                } else {
                    reparacionDao.addReparacion(matricula, descripcion, fechaE, estado, precio);
                }

                reparacionDao.cerrarConexion();
                vehiculoDao.cerrarConexion();
                request.setAttribute("matriculaExiste", matriculaExiste);
                request.getRequestDispatcher("Reparaciones").forward(request, response);
                return;
            } else {

                reparacionDao.cerrarConexion();
                vehiculoDao.cerrarConexion();
                matriculaNoExiste = true;
                request.setAttribute("matriculaNoExiste", matriculaNoExiste);
                request.getRequestDispatcher("gestion/admin/nuevaReparacion.jsp").forward(request, response);
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
        try {
            request.setCharacterEncoding("UTF-8");
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddReparaciones.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            request.setCharacterEncoding("UTF-8");
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddReparaciones.class.getName()).log(Level.SEVERE, null, ex);
        }
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
