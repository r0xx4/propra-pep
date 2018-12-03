<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*, data_management.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Accountansicht</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!-- Google fonts - Popppins for copy-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <!-- orion icons-->
        <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/css/orionicons.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/css/custom.css">
       
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>

    <body>
        <!-- navbar-->
        <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a><a href="#" class="navbar-brand font-weight-bold text-uppercase text-base">Planungs- und Entwicklungsprojekt</a>
                <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
                    <li class="nav-item">
                        <a id="link_logout" class="nav-link text-gray" href="#">Abmelden</a>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="d-flex align-items-stretch">
            <div id="sidebar" class="sidebar py-3">
                <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">Main</div>
                <ul class="sidebar-menu list-unstyled">
                    <li id="link_home" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
                    <li id="link_show_all_groups" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-archive-folder-1 mr-3 text-gray"></i><span>Gruppen</span></a></li>
                    <li id="link_show_all_teams" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-archive-1 mr-3 text-gray"></i><span>Teams</span></a></li>
                    <li id="link_show_all_accounts" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted active"><i class="o-profile-1 mr-3 text-gray"></i><span>Accounts</span></a></li>
                    <li id="link_project_settings" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-imac-screen-1 mr-3 text-gray"></i><span>Projekt Settings</span></a></li>
                </ul>
                <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">Meine Daten</div>
                <ul class="sidebar-menu list-unstyled">
                    <li id="link_personal_settings" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-user-1 mr-3 text-gray"></i><span>Mein Account</span></a></li>
                </ul>
            </div>
            <div class="page-holder w-100 d-flex flex-wrap">
                <div class="container-fluid px-xl-5">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Accountansicht</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <button id="btn_new_account" class="btn btn-sm btn-outline-secondary">Neuer Account</button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Rolle</th>
                                    <th scope="col">Vorname</th>
                                    <th scope="col">Nachname</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Matrikelnummer</th>
                                    <th scope="col">Studiengang</th>
                                    <th scope="col">Lehrstuhl</th>
                                    <th scope="col">Team</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                           		<% 	
                           		Driver datenhaltung = new Driver();
                           		ArrayList<HashMap<String, String>> html_contents = datenhaltung.getSubCat("account");
                           		int counter = 1;
                           		for (HashMap<String, String> row : html_contents)
                           		{
                           		%>
	                           		<tr>
	                                    <th scope="row"><% out.print(counter); %></th>
	                                    <td><% out.print(row.get("rollename_ID")); %></th>
	                                    <td><% out.print(row.get("vorname")); %></td>
	                                    <td><% out.print(row.get("nachname")); %></td>
	                                    <td><% out.print(row.get("accountname_ID")); %></td>
	                                    <td><% out.print(row.get("matrikelnummer")); %></td>
	                                    <td><% out.print(row.get("studiengangname_ID")); %></td>
	                                    <td><% out.print(row.get("lehrstuhlname_ID")); %></td>
	                                    <td>-</td>
	                                    <td><button id="group_setup" class="btn btn-sm btn-outline-secondary text-right">Bearbeiten</button></td>
	                                </tr>
                           			<%
                           			counter++;
                           		}
                           		%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-left text-primary">
                                <p class="mb-2 mb-md-0">Universit�t Siegen Department Maschinenbau &copy; 2018</p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script>   
            //Hier Javascript Code
            document.querySelector('#link_home').addEventListener("click", klickLinkHomeEvent); 
            function klickLinkHomeEvent(){
            	window.open("/pep/home", "_self");
            }
            document.querySelector('#link_logout').addEventListener("click", klickLinkLogoutEvent); 
            function klickLinkLogoutEvent(){
                window.open("/pep/home/logout", "_self");
            }
            document.querySelector('#link_show_all_groups').addEventListener("click", klickLinkShowAllGroupsEvent); 
            function klickLinkShowAllGroupsEvent(){
            	window.open("/pep/home/show_groups", "_self");
            }
            document.querySelector('#link_show_all_teams').addEventListener("click", klickLinkShowAllTeamsEvent); 
            function klickLinkShowAllTeamsEvent(){
            	window.open("/pep/home/show_teams", "_self");
            }
            document.querySelector('#link_show_all_accounts').addEventListener("click", klickLinkShowAllAccountsEvent); 
            function klickLinkShowAllAccountsEvent(){
            	window.open("/pep/home/show_accounts", "_self");
            }
            document.querySelector('#link_project_settings').addEventListener("click", klickLinkGeneralSettingsEvent); 
            function klickLinkGeneralSettingsEvent(){
            	window.open("/pep/home/show_project_settings", "_self");
            }
            document.querySelector('#link_personal_settings').addEventListener("click", klickLinkPersonalSettingsEvent); 
            function klickLinkPersonalSettingsEvent(){
                //Hier Code f�r zeige pers�nliche Daten Button gedr�ckt
                window.alert("Personal Settings"); 
            }
            document.querySelector('#btn_new_account').addEventListener("click", klickBtnNewAccountEvent);
            function klickBtnNewAccountEvent(){
                //Hier Code f�r neue Gruppe anlegen Button gedr�ckt
                window.alert("New Account");
            }
        </script>
        
        <!-- JavaScript files-->
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/jquery/jquery.min.js"></script>
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/popper.js/umd/popper.min.js"> </script>
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/jquery.cookie/jquery.cookie.js"> </script>
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/vendor/chart.js/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/js/charts-custom.js"></script>
        <script src="https://d19m59y37dris4.cloudfront.net/bubbly-dashboard/1-0/js/front.js"></script>
    </body>
</html>


