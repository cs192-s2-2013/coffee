/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2014-04-01 14:07:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>Blue Coffee</title>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/bootstrap.css\"/>\r\n");
      out.write("\t<link href=\"http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("\t<link href=\"//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
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
      out.write("\r\n");
      out.write("\t<!-- fixed navigation bar with drop down menu\r\n");
      out.write("\t***************************************************-->\r\n");
      out.write("<div id=\"wrapper\">\t\r\n");
      out.write("\t<div class=\"navbar navbar-inverse navbar-fixed-top\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t<a href=\"#\" class=\"navbar-brand\">Online Classroom</a> \r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"navbar-collapse collapse\">\r\n");
      out.write("\t\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("\t\t\t\t\t<li class=\"active\"><a href=\"index.html\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"resource.html\">Resources</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"feature.html\">Forum</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"chat.html\">Chat</a></li>\r\n");
      out.write("\t\t\t\t\t<li class=\"divider-vertical\"></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"about.html\">About</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Carousel\r\n");
      out.write("\t***********************************-->\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"myCarousel\" class=\"carousel slide\">\r\n");
      out.write("\t\t<ol class=\"carousel-indicators\">\r\n");
      out.write("\t\t\t<li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("\t\t\t<li data-target=\"#myCarousel\" data-slide-to=\"1\" class=\"active\"></li>\r\n");
      out.write("\t\t\t<li data-target=\"#myCarousel\" data-slide-to=\"2\" class=\"active\"></li>\r\n");
      out.write("\t\t</ol>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"carousel-inner\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<div class=\"item active\">\r\n");
      out.write("\t\t\t\t<img src=\"image/scene1.jpg\"/>\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"carousel-caption\">\r\n");
      out.write("\t\t\t\t\t\t<font color=\"#336699\">\r\n");
      out.write("\t\t\t\t\t\t<h1>Resources</h1>\r\n");
      out.write("\t\t\t\t\t\t<p>Get files, samplex, codes, etc</p></font>\r\n");
      out.write("\t\t\t\t\t\t<p><a class=\"btn btn-large btn-danger\" action=\"materials\">Check Resources</a></p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"item\">\r\n");
      out.write("\t\t\t\t<img src=\"image/scene2.jpg\"/>\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"carousel-caption\">\r\n");
      out.write("\t\t\t\t\t\t<font color=\"#336699\">\r\n");
      out.write("\t\t\t\t\t\t<h1>Forum</h1>\r\n");
      out.write("\t\t\t\t\t\t<p>Blah blah</p></font>\r\n");
      out.write("\t\t\t\t\t\t<p><a class=\"btn btn-large btn-danger\" action=\"forum\">Check Forum</a></p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"item\">\r\n");
      out.write("\t\t\t\t<img src=\"image/scene3.jpg\"/>\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"carousel-caption\">\r\n");
      out.write("\t\t\t\t\t\t<font color=\"#336699\">\r\n");
      out.write("\t\t\t\t\t\t<h1>Chat</h1>\r\n");
      out.write("\t\t\t\t\t\t<p>Chat with the whole comsci community. wew</p></font>\r\n");
      out.write("\t\t\t\t\t\t<p><a class=\"btn btn-large btn-danger\" href=\"chat.html\">Chat now!</a></p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">\r\n");
      out.write("\t\t\t<span class=\"glyphicon glyphicon-chevron-left\"></span>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">\r\n");
      out.write("\t\t\t<span class=\"glyphicon glyphicon-chevron-right\"></span>\r\n");
      out.write("\t\t</a>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>\t\r\n");
      out.write("\t<!-- Grid\r\n");
      out.write("\t****************************************-->\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"col-md-12\">\r\n");
      out.write("\t\t\t\t<h2>Online Classroom</h2>\r\n");
      out.write("\t\t\t\t<p>App that lets you collaborate with your professor and classmates online! Come on and have your class online!</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<div class=\"col-md-4\">\r\n");
      out.write("\t\t\t\t<a href=\"materials\"><h2>Resources</h2></a>\r\n");
      out.write("\t\t\t\t<p>Some text will go here. Some text will go here. Some text will go here. Some text will go here.</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"col-md-4\">\r\n");
      out.write("\t\t\t\t<a href=\"forum\"><h2>Forum</h2></a>\r\n");
      out.write("\t\t\t\t<p>Some text will go here. Some text will go here. Some text will go here. Some text will go here.</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"col-md-4\">\r\n");
      out.write("\t\t\t\t<a href=\"#\"><h2>Chat</h2></a>\r\n");
      out.write("\t\t\t\t<p>Some text will go here. Some text will go here. Some text will go here. Some text will go here.</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Font Awesome Icons\r\n");
      out.write("\t***************************************************-->\r\n");
      out.write("\t\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-md-12\">\r\n");
      out.write("\t\t\t\t\t<div class=\"well\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-android\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-twitter\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-linkedin\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-youtube\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-skype\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-google-plus\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><i class=\"largeicon icon-apple\"></i></a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"push\"></div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Footer and Modal\r\n");
      out.write("\t**************************************************-->\r\n");
      out.write("\t<div id=\"footer\">\r\n");
      out.write("\t<hr/>\t\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-md-12\">\r\n");
      out.write("\r\n");
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
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\t</font>\r\n");
      out.write("\t\r\n");
      out.write("\t<script src=\"js/jquery.js\"></script>\r\n");
      out.write("\t<script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
