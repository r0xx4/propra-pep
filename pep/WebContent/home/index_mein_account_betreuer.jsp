<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*, data_management.Driver"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mein Account</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- Google fonts - Popppins for copy-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
<!-- orion icons-->
<link rel="stylesheet"
	href="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/css/orionicons.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet"
	href="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/css/custom.css">

<!-- JavaScript files-->
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/jquery/jquery.min.js"></script>
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/popper.js/umd/popper.min.js">
	
</script>
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/jquery.cookie/jquery.cookie.js">
	
</script>
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/chart.js/Chart.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/js/charts-custom.js"></script>
<script
	src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/js/front.js"></script>
</head>

<body>
	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
			<a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i
				class="fas fa-align-left"></i></a><a href="#"
				class="navbar-brand font-weight-bold text-uppercase text-base">Planungs-
				und Entwicklungsprojekt</a>
			<ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
				<li class="nav-item"><a id="link_logout"
					class="nav-link text-gray" href="#">Abmelden</a></li>
			</ul>
		</nav>
	</header>
	<div class="d-flex align-items-stretch">
		<div id="sidebar" class="sidebar py-3">
			<div
				class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">Main</div>
			<ul class="sidebar-menu list-unstyled">
				<li id="link_home" class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted"><i
						class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
				<li id="link_show_teams" class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted"><i
						class="o-archive-1 mr-3 text-gray"></i><span>Teams</span></a></li>
			</ul>
			<div
				class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">Meine
				Daten</div>
			<ul class="sidebar-menu list-unstyled">
				<li id="link_personal_settings" class="sidebar-list-item"><a
					href="#" class="sidebar-link text-muted active"><i
						class="o-user-1 mr-3 text-gray"></i><span>Mein Account</span></a></li>
			</ul>
		</div>
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-5">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Mein Account</h1>
				</div>
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-1 mb-3 border-bottom">
					<h1 class="h4">Persönliche Daten</h1>
					<%
						Driver datenhaltung = new Driver();
						String user = datenhaltung.getSessionUser(request.getParameter("session_id"));
						HashMap<String, String> html_contents = datenhaltung.getSubCat("account", user).get(0);
					%>
				</div>
				<div>
					<div class="form-group row">
						<div class="form-group col-sm">
							<label for="input_first_name">Vorname:</label> <input
								id="input_first_name"
								value=<%out.print(html_contents.get("vorname"));%> type="text"
								class="form-control">
						</div>
						<div class="form-group col-sm">
							<label for="input_last_name">Nachname:</label> <input
								id="input_last_name"
								value=<%out.print(html_contents.get("nachname"));%> type="text"
								class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-sm">
							<label for="input_email">Email:</label> <input id="input_email"
								value=<%out.print(html_contents.get("accountname_ID"));%>
								type="text" class="form-control" readonly>
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-sm">
							<label for="input_course_of_studies">Lehrstuhl:</label> <select
								id="input_course_of_studies" class="custom-select form-control">
								<option selected>
									<%
										out.print(html_contents.get("lehrstuhlname_ID"));
									%>
								</option>
								<%
									ArrayList<HashMap<String, String>> lehrstuhl = datenhaltung.getSubCat("lehrstuhl");
									for (HashMap<String, String> h : lehrstuhl) {
										int i = 1;
								%>
								<option>
									<%
										out.print(lehrstuhl.get(i++).get("lehrstuhlname_ID"));
									%>
								</option>
								<%
									}
								%>
							</select>
						</div>
					</div>
				</div>
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-1 mb-3 border-bottom">
					<h1 class="h4">Passwort ändern</h1>
				</div>
				<div>
					<div class="form-group row">
						<div class="form-group col-sm">
							<label for="input_old_password">Altes Passwort:</label> <input
								id="input_old_password" type="password" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-sm">
							<label for="input_new_password">Neues Passwort:</label> <input
								id="input_new_password" type="password" class="form-control">
						</div>
						<div class="form-group col-sm">
							<label for="input_new_password_repeat">Neues Passwort
								wiederholen:</label> <input id="input_new_password_repeat"
								type="password" class="form-control">
						</div>
					</div>
				</div>

				<!-- Button Ändern -->
				<div class="float-sm-right btn-toolbar mb-md-0 pt-3 pb-3">
					<button id="btn_submit"
						class="btn font-weight-bold text-light btn-lg btn-primary">Änderungen
						speichern</button>
				</div>
			</div>
			<footer
				class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 text-center text-md-left text-primary">
							<p class="mb-2 mb-md-0">Universität Siegen Department
								Maschinenbau &copy; 2018</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script>
		//Hier Javascript Code
		document.querySelector('#link_home').addEventListener("click",
				klickLinkHomeEvent);
		function klickLinkHomeEvent() {
			//Hier Code für aufrufen von Startseite
			window.alert("Home");
		}
		document.querySelector('#link_logout').addEventListener("click",
				klickLinkLogoutEvent);
		function klickLinkLogoutEvent() {
			//Hier Code für Logout Button gedrückt
			window.alert("Logout");
		}
		document.querySelector('#link_show_teams').addEventListener("click",
				klickLinkShowTeamsEvent);
		function klickLinkShowTeamsEvent() {
			//Hier Code für zeige Teams Button gedrückt
			window.alert("Show Teams");
		}
		document.querySelector('#link_personal_settings').addEventListener(
				"click", klickLinkPersonalSettingsEvent);
		function klickLinkPersonalSettingsEvent() {
			//Hier Code für zeige persönliche Daten Button gedrückt
			window.alert("Personal Settings");
		}
        document.querySelector('#btn_submit').addEventListener("click", sendPostToDb);
        function sendPostToDb(){
        	var data = {};
        	data["accountname_ID"] = document.querySelector('#input_email').value;
        	data["vorname"] = document.querySelector('#input_first_name').value;
        	data["nachname"] = document.querySelector('#input_last_name').value;
        	data["lehrstuhl"] = document.querySelector('#input_course_of_studies').value;
        
        	
        	if(input_old_password.value!=null)
        			if(input_new_password.value==input_new_password_repeat.value)
        				data["password"] = document.querySelector('#input_new_password').value;
        			else
        				alert("Die neuen Passwörter stimmen nicht über ein!");

        	post("/pep/home/view_personal_info", data);
        }
	</script>
</body>
</html>