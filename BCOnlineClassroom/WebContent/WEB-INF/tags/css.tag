<%@tag description="CSS Tag" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="WEB-INF/jsp/css/style.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
          body { background: #FFFFFF; }
		  .jumbotron {
		  		background-color: #121212;
		  		margin-top: -30px;
			    padding: 0.5em 0.6em; 
			}
          textarea { resize: none; }
          k { font-size: 44.5px; }
          cell_size { font-size: 12px; }
			input[type=checkbox]
			{
			  -ms-transform: scale(1); /* IE */
			  -moz-transform: scale(1); /* FF */
			  -webkit-transform: scale(1); /* Safari and Chrome */
			  -o-transform: scale(1); /* Opera */
			  padding: 10px;
			}
          h2 {
			    	color: pink;
			    	margin-left: 20px;
			    }
			    h5 {
			        color: #6C7B8B;
			        margin-left: 20px;	
			        .btn {
			            padding: 0.5em;
			        }
		.modal-dialog{ width: 450px; }
		.modal-header { height: 50px; }
		.modal-body{ height: 180px; }
		.modal-footer{ height: 50px: }
		#inbox, .btn-default{
		        height: 35px; 
		        width: 400px;
		        margin-bottom: 4px;
		        text-align: left;
		}
		
		
	<!-- SIDEBAR -->
	
	#wrapper {
	  padding-left: 250px;
	  transition: all 0.4s ease 0s;
	}
	
	#sidebar-wrapper {
	  margin-left: -250px;
	  left: 250px;
	  width: 250px;
	  background: #000;
	  position: fixed;
	  height: 100%;
	  overflow-y: auto;
	  z-index: 1000;
	  transition: all 0.4s ease 0s;
	}
	
	#page-content-wrapper {
	  width: 100%;
	}
	
	.sidebar-nav {
	  position: absolute;
	  top: 0;
	  width: 250px;
	  list-style: none;
	  margin: 0;
	  padding: 0;
	}
	
	.sidebar-nav li {
	  line-height: 40px;
	  text-indent: 20px;
	}
	
	.sidebar-nav li a {
	  color: #999999;
	  display: block;
	  text-decoration: none;
	}
	
	.sidebar-nav li a:hover {
	  color: #fff;
	  background: rgba(255,255,255,0.2);
	  text-decoration: none;
	}
	
	.sidebar-nav li a:active,
	.sidebar-nav li a:focus {
	  text-decoration: none;
	}
	
	.sidebar-nav > .sidebar-brand {
	  height: 65px;
	  line-height: 60px;
	  font-size: 18px;
	}
	
	.sidebar-nav > .sidebar-brand a {
	  color: #999999;
	}
	
	.sidebar-nav > .sidebar-brand a:hover {
	  color: #fff;
	  background: none;
	}
	
	.content-header {
	  height: 65px;
	  line-height: 65px;
	}
	
	.content-header h1 {
	  margin: 0;
	  margin-left: 20px;
	  line-height: 65px;
	  display: inline-block;
	}
	
	#menu-toggle {
	  display: none;
	}
	
	.inset {
	  padding: 20px;
	}
	
	@media (max-width:767px) {
	
	#wrapper {
	  padding-left: 0;
	}
	
	#sidebar-wrapper {
	  left: 0;
	}
	
	#wrapper.active {
	  position: relative;
	  left: 250px;
	}
	
	#wrapper.active #sidebar-wrapper {
	  left: 250px;
	  width: 250px;
	  transition: all 0.4s ease 0s;
	}
	
	#menu-toggle {
	  display: inline-block;
	}
	
	.inset {
	  padding: 15px;
	}
	
	}
		
		
		
    </style>
    
