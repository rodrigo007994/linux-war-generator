package com.zencherry.pg.api;

import javax.servlet.http.*;
import java.io.*;

// Servlets that shows the current time
public class TimeServlet extends javax.servlet.http.HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException {

    response.setContentType("text/html; charset=UTF-8");  // required: HTML in UTF-8 (more)
    response.setCharacterEncoding("UTF-8");               // recommended: use UTF-8 (more)

    PrintWriter writer = response.getWriter();            // writer for sending text (more)
    writer.print("<html><head><title>Time</title></head><body>");
    writer.print("The current time is: ");
    writer.print((new java.util.Date()).toString());
    writer.print("</body></html>");
  }
}