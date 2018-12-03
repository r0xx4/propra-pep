<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*, data_management.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
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
                            <button id="btn_new_account" data-toggle="modal" data-target="#modal_new_account" class="btn btn-sm btn-outline-secondary">Neuer Account</button>
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
                                    <td><button id="btn_edit_account_2" data-toggle="modal" data-target="#modal_edit_account" class="btn btn-sm btn-outline-secondary text-right">Bearbeiten</button></td>
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
                                <p class="mb-2 mb-md-0">Universität Siegen Department Maschinenbau &copy; 2018</p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

         <!-- Modal Account hinzufügen -->
         <div class="modal fade" id="modal_new_account" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Account hinzufügen</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="select_role" class="col-form-label">Rolle:</label>
                                <select id="select_role" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Teammitglied</option>
                                    <option>Teamvorsitzender</option>
                                    <option>Juror</option>
                                    <option>Betreuer</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="input_first_name" class="col-form-label">Vorname:</label>
                                <input type="text" class="form-control" id="input_first_name">
                            </div>
                            <div class="form-group">
                                <label for="input_last_name" class="col-form-label">Nachname:</label>
                                <input type="text" class="form-control" id="input_last_name">
                            </div>
                            <div class="form-group">
                                <label for="input_email" class="col-form-label">Email:</label>
                                <input type="text" class="form-control" id="input_email">
                            </div>
                            <div class="form-group">
                                <label for="input_matriculation_number" class="col-form-label">Matrikelnummer:</label>
                                <input type="text" class="form-control" id="input_matriculation_number">
                            </div>
                            <div class="form-group">
                                <label for="select_course_of_studies" class="col-form-label">Studiengang:</label>
                                <select id="select_course_of_studies" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Bachelor Maschinenbau</option>
                                    <option>Master Maschinenbau</option>
                                    <option>Bachelor Architektur</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_university_chair" class="col-form-label">Lehrstuhl:</label>
                                <select id="select_university_chair" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Lehrstuhl für ???</option>
                                    <option>Lehrstuhl für ???</option>
                                    <option>Lehrstuhl für ???</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_team" class="col-form-label">Team:</label>
                                <select id="select_team" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Team 1</option>
                                    <option>Team 2</option>
                                    <option>Team 3</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="input_password" class="col-form-label">Passwort:</label>
                                <input type="password" class="form-control" id="input_password">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>
                        <button type="button" class="btn btn-primary">Hinzufügen</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Account bearbeiten -->
        <div class="modal fade" id="modal_edit_account" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Account bearbeiten</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="select_role_editmode" class="col-form-label">Rolle:</label>
                                <select id="select_role_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Teammitglied</option>
                                    <option>Teamvorsitzender</option>
                                    <option>Juror</option>
                                    <option>Betreuer</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="input_first_name_editmode" class="col-form-label">Vorname:</label>
                                <input type="text" class="form-control" id="input_first_name_editmode">
                            </div>
                            <div class="form-group">
                                <label for="input_last_name_editmode" class="col-form-label">Nachname:</label>
                                <input type="text" class="form-control" id="input_last_name_editmode">
                            </div>
                            <div class="form-group">
                                <label for="input_email_editmode" class="col-form-label">Email:</label>
                                <input type="text" class="form-control" id="input_email_editmode">
                            </div>
                            <div class="form-group">
                                <label for="input_matriculation_number_editmode" class="col-form-label">Matrikelnummer:</label>
                                <input type="text" class="form-control" id="input_matriculation_number_editmode">
                            </div>
                            <div class="form-group">
                                <label for="select_course_of_studies_editmode" class="col-form-label">Studiengang:</label>
                                <select id="select_course_of_studies_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Bachelor Maschinenbau</option>
                                    <option>Master Maschinenbau</option>
                                    <option>Bachelor Architektur</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_university_chair_editmode" class="col-form-label">Lehrstuhl:</label>
                                <select id="select_university_chair_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Lehrstuhl für ???</option>
                                    <option>Lehrstuhl für ???</option>
                                    <option>Lehrstuhl für ???</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_team_editmode" class="col-form-label">Team:</label>
                                <select id="select_team_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Team 1</option>
                                    <option>Team 2</option>
                                    <option>Team 3</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="btn_delete_groupe" type="button" class="btn btn-danger">Löschen</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>
                        <button type="button" class="btn btn-primary">Hinzufügen</button>
                    </div>
                </div>
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
            	window.open("/pep/home/view_personal_info", "_self");
            }
            document.querySelector('#btn_new_account').addEventListener("click", klickBtnNewAccountEvent);
            function klickBtnNewAccountEvent(){
                //Hier Code für neue Gruppe anlegen Button gedrückt
            }
            document.querySelector('#btn_edit_account_1').addEventListener("click", klickBtnEditAccount1);
            function klickBtnEditAccount1(){
                document.querySelector('#select_role_editmode').selectedIndex = 1;
                document.querySelector('#input_first_name_editmode').value = "Max";
                document.querySelector('#input_last_name_editmode').value = "Mustermann";
                document.querySelector('#input_email_editmode').value = "max.mustermann@sudent.uni-siegen.de";
                document.querySelector('#input_matriculation_number_editmode').value = "1234567";
                document.querySelector('#select_course_of_studies_editmode').selectedIndex = 1;
                document.querySelector('#select_university_chair_editmode').selectedIndex = 0;
                document.querySelector('#select_team_editmode').selectedIndex = 3;
            }
            document.querySelector('#btn_edit_account_2').addEventListener("click", klickBtnEditAccount2);
            function klickBtnEditAccount2(){
                document.querySelector('#select_role_editmode').selectedIndex = 3;
                document.querySelector('#input_first_name_editmode').value = "Peter";
                document.querySelector('#input_last_name_editmode').value = "Müller";
                document.querySelector('#input_email_editmode').value = "peter.müller@uni-siegen.de";
                document.querySelector('#input_matriculation_number_editmode').value = "";
                document.querySelector('#select_course_of_studies_editmode').selectedIndex = 0;
                document.querySelector('#select_university_chair_editmode').selectedIndex = 1;
                document.querySelector('#select_team_editmode').selectedIndex = 0;
            }
            document.querySelector('#btn_edit_account_3').addEventListener("click", klickBtnEditAccount3);
            function klickBtnEditAccount3(){
                document.querySelector('#select_role_editmode').selectedIndex = 2;
                document.querySelector('#input_first_name_editmode').value = "Beate";
                document.querySelector('#input_last_name_editmode').value = "Besemer";
                document.querySelector('#input_email_editmode').value = "beate.besemer@sudent.uni-siegen.de";
                document.querySelector('#input_matriculation_number_editmode').value = "2344543";
                document.querySelector('#select_course_of_studies_editmode').selectedIndex = 2;
                document.querySelector('#select_university_chair_editmode').selectedIndex = 0;
                document.querySelector('#select_team_editmode').selectedIndex = 1;
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