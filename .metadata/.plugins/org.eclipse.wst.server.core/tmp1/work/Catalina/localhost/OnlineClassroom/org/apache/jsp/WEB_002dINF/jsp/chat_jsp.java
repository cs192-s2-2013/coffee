/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2014-03-20 14:24:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class chat_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!doctype html>\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>Blue Coffee</title>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/bootstrap.css\"/>\r\n");
      out.write("\t<link href=\"http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("\t\r\n");
      out.write("\t<style>\r\n");
      out.write("          body { background: #FFFFFF; }\r\n");
      out.write("          .container { background: ; }\r\n");
      out.write("    </style>\r\n");
      out.write("\t\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<font color=\"#336699\">\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- tried this one on the first tut <button class=\"btn btn-success\">Test</button> -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- fixed navigaiton bar with dropdown menu\r\n");
      out.write("\t***************************************************-->\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t<div class=\"navbar navbar-inverse navbar-fixed-top\">\r\n");
      out.write("\t<div class=\"navbar-inner\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t<a href=\"#\" class=\"navbar-brand\">Blue Coffee</a> \r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"navbar-collapse collapse\">\r\n");
      out.write("\t\t\t\t<ul class=\"nav navbar-nav nav-pills\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"index.html\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"resource.html\">Resources</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"feature.html\">Forum</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li  class=\"active\"><a href=\"chat.html\">Chat</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"about.html\">About</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- Tooltips and Popovers\r\n");
      out.write("\t**************************************************-->\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-md-12\">\r\n");
      out.write("\t\t\t</br><?br></br>\r\n");
      out.write("\t\t\t\t<h2>Something something</h2> <hr/>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<a class=\"btn btn-primary\" id=\"mytooltip\" href=\"#\" data-toggle=\"tooltip\" title=\"Hello :)\" data-placement=\"right\">\r\n");
      out.write("\t\t\t\t\tA button\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Footer and Modal\r\n");
      out.write("\t**************************************************-->\r\n");
      out.write("\t\t\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-md-12\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<hr/>\r\n");
      out.write("\t\t\t\t<p>Copyright &copy; Blue Coffee.\r\n");
      out.write("\t\t\t\t<!--<a href=\"#\">Terms and Conditions</a> -->\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a data-toggle=\"modal\" href=\"#myModal\">Terms and Conditions</a>\r\n");
      out.write("\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<!--Modal -->\r\n");
      out.write("\t\t\t\t<div class=\"modal fade\" id=\"myModal\" tabinex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\r\n");
      out.write("\t\t\t\t\t<div class=\"modal-dialog\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"modal-content\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"modal-header\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Terms and Conditions</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>The text will go here...</p>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"modal-footer\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Close</button>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t</font>\r\n");
      out.write("\t<!-- Comment --->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<script src=\"js/jquery.js\"></script>\r\n");
      out.write("\t<script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("\t<script src=\"js/contentHover.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t$('document').ready(function(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t$('#mytooltip').tooltip();\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("<!--\r\n");
      out.write("\r\n");
      out.write("16 -  tutorial 1 : creating website from scratch\r\n");
      out.write("17 - tutorial 2 : responsive navigation bar\r\n");
      out.write("-->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
