<!doctype html>

<html>
<head>
	<title>Blue Coffee</title>
	
	
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	
	<style>
          body { background: #FFFFFF; }
          .container { background: ; }
    </style>
	
</head>

<body>

	<font color="#336699">
	
	<!-- tried this one on the first tut <button class="btn btn-success">Test</button> -->

	<!-- fixed navigaiton bar with dropdown menu
	***************************************************-->
	<div class="container">
	<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand">Blue Coffee</a> 
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav nav-pills">
					<li><a href="index.html">Home</a></li>
					<li class="divider-vertical"></li>
					<li><a href="resource.html">Resources</a></li>
					<li class="divider-vertical"></li>
					<li><a href="feature.html">Forum</a></li>
					<li class="divider-vertical"></li>
					<li  class="active"><a href="chat.html">Chat</a></li>
					<li class="divider-vertical"></li>
					<li><a href="about.html">About</a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>

	<!-- Tooltips and Popovers
	**************************************************-->
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			</br><?br></br>
				<h2>Something something</h2> <hr/>
				
				<a class="btn btn-primary" id="mytooltip" href="#" data-toggle="tooltip" title="Hello :)" data-placement="right">
					A button
				</a>
				
			</div>
		</div>
	</div>
	
	
	<!-- Footer and Modal
	**************************************************-->
		
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<hr/>
				<p>Copyright &copy; Blue Coffee.
				<!--<a href="#">Terms and Conditions</a> -->
				
					<a data-toggle="modal" href="#myModal">Terms and Conditions</a>
				</p>
				
				<!--Modal -->
				<div class="modal fade" id="myModal" tabinex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
							<h2>Terms and Conditions</h2>
							</div>
							<div class="modal-body">
								<p>The text will go here...</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			
	</font>
	<!-- Comment --->
					
			</div>
		</div>
	</div>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/contentHover.js"></script>
	
	<script type="text/javascript">
		$('document').ready(function(){
		
			$('#mytooltip').tooltip();
			
		});
	
	</script>
</body>
</html>

<!--

16 -  tutorial 1 : creating website from scratch
17 - tutorial 2 : responsive navigation bar
-->