<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*, data_management.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Gruppenansicht</title>
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
                    <li id="link_show_all_groups" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted active"><i class="o-archive-folder-1 mr-3 text-gray"></i><span>Gruppen</span></a></li>
                    <li id="link_show_all_teams" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-archive-1 mr-3 text-gray"></i><span>Teams</span></a></li>
                    <li id="link_show_all_accounts" class="sidebar-list-item"><a href="#" class="sidebar-link text-muted"><i class="o-profile-1 mr-3 text-gray"></i><span>Accounts</span></a></li>
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
                        <h1 class="h2">Gruppenansicht</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <button id="btn_new_group" data-toggle="modal" data-target="#modal_new_group" class="btn btn-sm btn-outline-secondary">Neue Gruppe</button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Teams</th>
                                <th scope="col">Studenten</th>
                                <th scope="col">Juror 1</th>
                                <th scope="col">Juror 2</th>
                                <th scope="col">Juror 3</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">Gruppe 1</th>
                                <td>9</td>
                                <td>59</td>
                                <td>Phillip M�ller</td>
                                <td>Tim Kunse</td>
                                <td>Klaus Mustermann</td>
                                <td><button id="btn_edit_group_1" data-toggle="modal" data-target="#modal_edit_group" class="btn btn-sm btn-outline-secondary text-right">Bearbeiten</button></td>
                            </tr>
                            <tr>
                                <th scope="row">Gruppe 2</th>
                                <td>8</td>
                                <td>52</td>
                                <td>Anne Zimmermann</td>
                                <td>Dieter Weingart</td>
                                <td>Susanne Schneider</td>
                                <td><button id="btn_edit_group_2" data-toggle="modal" data-target="#modal_edit_group" class="btn btn-sm btn-outline-secondary">Bearbeiten</button></td>
                            </tr>
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

        <!-- Modal Gruppe hinzuf�gen -->
        <div class="modal fade" id="modal_new_group" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Gruppe hinzuf�gen</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="input_name_new_group" class="col-form-label">Name:</label>
                                <input type="text" class="form-control" readonly id="input_name_new_group" placeholder="Gruppe 3">
                            </div>
                            <div class="form-group">
                                <label for="select_juror_1" class="col-form-label">Juror 1:</label>
                                <select id="select_juror_1" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Phillip M�ller</option>
                                    <option>Tim Kunse</option>
                                    <option>Klaus Mustermann</option>
                                    <option>Susanne Schneider</option>
                                    <option>Anne Zimmermann</option>
                                    <option>Dieter Weingart</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_juror_2" class="col-form-label">Juror 2:</label>
                                <select id="select_juror_2" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Phillip M�ller</option>
                                    <option>Tim Kunse</option>
                                    <option>Klaus Mustermann</option>
                                    <option>Susanne Schneider</option>
                                    <option>Anne Zimmermann</option>
                                    <option>Dieter Weingart</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_juror_3" class="col-form-label">Juror 3:</label>
                                <select id="select_juror_3" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Phillip M�ller</option>
                                    <option>Tim Kunse</option>
                                    <option>Klaus Mustermann</option>
                                    <option>Susanne Schneider</option>
                                    <option>Anne Zimmermann</option>
                                    <option>Dieter Weingart</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>
                        <button type="button" class="btn btn-primary">Hinzuf�gen</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Gruppe bearbeiten -->
        <div class="modal fade" id="modal_edit_group" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Gruppe bearbeiten</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="input_name_new_group_editmode" class="col-form-label">Name:</label>
                                <input type="text" class="form-control" readonly id="input_name_new_group_editmode" placeholder="Gruppe 3">
                            </div>
                            <div class="form-group">
                                <label for="select_juror_1_editmode" class="col-form-label">Juror 1:</label>
                                <select id="select_juror_1_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Phillip M�ller</option>
                                    <option>Tim Kunse</option>
                                    <option>Klaus Mustermann</option>
                                    <option>Susanne Schneider</option>
                                    <option>Anne Zimmermann</option>
                                    <option>Dieter Weingart</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_juror_2_editmode" class="col-form-label">Juror 2:</label>
                                <select id="select_juror_2_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Phillip M�ller</option>
                                    <option>Tim Kunse</option>
                                    <option>Klaus Mustermann</option>
                                    <option>Susanne Schneider</option>
                                    <option>Anne Zimmermann</option>
                                    <option>Dieter Weingart</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="select_juror_3_editmode" class="col-form-label">Juror 3:</label>
                                <select id="select_juror_3_editmode" class="custom-select form-control">
                                    <option selected>-</option>
                                    <option>Phillip M�ller</option>
                                    <option>Tim Kunse</option>
                                    <option>Klaus Mustermann</option>
                                    <option>Susanne Schneider</option>
                                    <option>Anne Zimmermann</option>
                                    <option>Dieter Weingart</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="btn_delete_groupe" type="button" class="btn btn-danger">L�schen</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>
                        <button type="button" class="btn btn-primary">Hinzuf�gen</button>
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
            document.querySelector('#btn_new_group').addEventListener("click", klickBtnNewGroupEvent);
            function klickBtnNewGroupEvent(){
                //Hier Code f�r neue Gruppe anlegen Button gedr�ckt   
            }
            document.querySelector('#btn_edit_group_1').addEventListener("click", klickBtnEditGroup1);
            function klickBtnEditGroup1(){
                document.querySelector('#input_name_new_group_editmode').value = "Gruppe 1";
                document.querySelector('#select_juror_1_editmode').selectedIndex = 1;
                document.querySelector('#select_juror_2_editmode').selectedIndex = 2;
                document.querySelector('#select_juror_3_editmode').selectedIndex = 3;
            }
            document.querySelector('#btn_edit_group_2').addEventListener("click", klickBtnEditGroup2);
            function klickBtnEditGroup2(){
                document.querySelector('#input_name_new_group_editmode').value = "Gruppe 2";
                document.querySelector('#select_juror_1_editmode').selectedIndex = 5;
                document.querySelector('#select_juror_2_editmode').selectedIndex = 6;
                document.querySelector('#select_juror_3_editmode').selectedIndex = 4;
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