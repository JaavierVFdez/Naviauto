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
import modelo.dao.UsuarioDAO;
import modelo.dao.VehiculoDAO;

/**
 *
 * @author javie
 */
@WebServlet(name = "AddVehiculo", urlPatterns = {"/AddVehiculo"})
public class AddVehiculo extends HttpServlet {

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
            VehiculoDAO vehiculoDao = new VehiculoDAO();
            UsuarioDAO usuarioDao = new UsuarioDAO();

            boolean cocheAdded = false;
            boolean cocheNoAdded = false;

            //Almacenamos la informacion del vehiculo
            String matricula = request.getParameter("matricula");
            String dni = request.getParameter("dni");
            String modelo = request.getParameter("modelo");
            String marca = request.getParameter("marca");
            String anyoVehiculo = request.getParameter("anyoVehiculo");
            double kilometrajeActual = Double.parseDouble(request.getParameter("kilometrajeActual"));

            //Comprobamos si el usuario existe mediante su dni
            if (usuarioDao.comprobarDNI(dni)) {
                //Añadimos el vehiculo
                vehiculoDao.addVehiculo(matricula, dni, modelo, marca, anyoVehiculo, kilometrajeActual);

                cocheAdded = true;
                usuarioDao.cerrarConexion();
                vehiculoDao.cerrarConexion();
                request.setAttribute("cocheAdded", cocheAdded);
                request.getRequestDispatcher("Vehiculos").forward(request, response);
            } else {
                usuarioDao.cerrarConexion();
                vehiculoDao.cerrarConexion();
                cocheNoAdded = true;
                request.setAttribute("cocheNoAdded", cocheNoAdded);
                request.getRequestDispatcher("gestion/admin/nuevoVehiculo.jsp").forward(request, response);
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
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddVehiculo.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddVehiculo.class.getName()).log(Level.SEVERE, null, ex);
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
