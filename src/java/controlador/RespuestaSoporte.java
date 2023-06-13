package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.MensajeDAO;

@WebServlet(name = "RespuestaSoporte", urlPatterns = {"/RespuestaSoporte"})
public class RespuestaSoporte extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int codigo_mensaje = Integer.parseInt(request.getParameter("codigo_mensaje"));
            String correo = request.getParameter("email");
            String respuesta = request.getParameter("respuesta");

            System.out.println("CORREO: " + correo);
            System.out.println("RESPUESTA: " + respuesta);
            System.out.println("CODIGO: " + codigo_mensaje);

            // Configuración de las propiedades de correo electrónico
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.user", "naviauto.taller.soporte@gmail.com"); // Tu correo de Gmail
            properties.put("mail.smtp.password", "kqov ikmu mojn rmgc"); // Tu contraseña de Gmail

            // Creación de la sesión
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(properties.getProperty("mail.smtp.user"),
                            properties.getProperty("mail.smtp.password"));
                }
            });

            // Creación del mensaje de correo electrónico
            try {
                Message mimeMessage = new MimeMessage(session);
                mimeMessage.setFrom(new InternetAddress(properties.getProperty("mail.smtp.user")));
                mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correo));

                // Puedes agregar un título personalizado aquí
                String asunto = request.getParameter("asunto");

                mimeMessage.setSubject(asunto);

                // Y aquí puedes agregar contenido personalizado al cuerpo del mensaje
                String contenido = respuesta;
                mimeMessage.setText(contenido);

                // Enviar el mensaje
                Transport.send(mimeMessage);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

            MensajeDAO mensajeDao = new MensajeDAO();
            mensajeDao.actualizarRepuesta(codigo_mensaje, respuesta);

            request.getRequestDispatcher("Soporte").forward(request, response);
            return;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
