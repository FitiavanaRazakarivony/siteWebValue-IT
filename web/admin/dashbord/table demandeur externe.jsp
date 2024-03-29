<%@ page import="table.test"%>
<%@ page import="table.teste"%>
<%@ page import="table.demande_accExt"%>
<%@ page import="table.admin"%>
<%@ page import="table.demandeurExt" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>
<%@page import="table.demande_accExt"%>
<%@page import="table.demande_accInt"%>
<%@page import="table.demande_refEx"%>
<%@page import="table.demande_refInt"%>
<%@page import="table.demandeurExt"%>
<%@page import="table.demandeurInt"%>
<%
   String email_admin= (String) session.getAttribute("email");
   Connection con = Connexion.connect();
   ResultSet V_res = admin.afficherAdmin(email_admin, con);
   ResultSet V_res1 = admin.afficherAdmin(email_admin, con);
    String type= (String) session.getAttribute("type"); 
   
   ResultSet AllEmpl = demandeurExt.getDemandeurExterne(con);     
   ResultSet AllEmplteste = demandeurExt.getDemandeurExterneTeste(con);   

   ResultSet AllTeste = demandeurExt.getDemandeurExterne(con);   
   ResultSet AllDem_accEx = demande_accExt.afficherDeman_accEx(con); 
   //compte demandeur interne   
    ResultSet getcompteDemIn= demandeurInt.getCompDemIn(con);   

    //compte demandeur externe
    ResultSet getcompteDemEx= demandeurExt.getCompDemEx(con); 
    
    //compte demandeur accepeter apres la test externe
    ResultSet getcompteAccEx= demande_accExt.getDemandeAcc(con);   
        
    //compte demandeur accepeter apres la test interne
    ResultSet getcompteAccInt= demande_accInt.getDemandeAcc(con); 
            
    //compte demandeur supprimet Externe
    ResultSet getcompteSuppEx= demande_refEx.getDemandeSuppr(con); 
              
    //compte demandeur supprimet interne
    ResultSet getcompteSuppIn= demande_refInt.getDemandeSuppr(con); 

%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Value-IT -  table demandeurs externes </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
           
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />
      <link rel="stylesheet" href="fonts/flaticon.css" />
      <!-- message css -->    	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

   </head>
 
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="../../index.jsp">
                        </a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <% while (V_res.next()) { %> 
                           <div class="user_img">
                              <a href="../../index.jsp">
                              <img class="img-responsive" src="../../image/<% out.println(V_res.getString("image_admin")); %>" alt="image" />
                              </a>
                              </div>
                              <div class="user_info">
                                 <h6> <% out.println(V_res.getString("type_admin")); %></h6>
                                 <p><span class="online_animation"></span>Online</p>
                              </div>
                           </div>
                           <%}%>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>General</h4>
                   <ul class="list-unstyled components">
                     <li><a href="dashboard.jsp"><i class="fa fa-dashboard yellow_color"></i> <span>Dashboard</span></a></li>

                     <li><a href="Les travailleurs.jsp"><i class="fa fa-laptop orange_color"></i> <span>Les travailleurs</span></a></li>
                     <li>
                        <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cart-plus purple_color2"></i> <span>Ajouts elements</span></a>
                        <ul class="collapse list-unstyled" id="element">
                           <li><a href="Publication.jsp">> <span>Publication</span></a></li>
                           <li><a href="les Chefs.jsp">> <span>Chef</span></a></li>
                           <li><a href="annonce.jsp">> <span>annonce</span></a></li>
                           <li><a href="Travailleur.jsp">> <span>Travailleur</span></a></li>
                        </ul>
                     </li> 

                     <li class="active">
                        <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-briefcase yellow_color"></i> <span> Liste des demandes</span></a>
                        <ul class="collapse list-unstyled" id="additional_page">
 
                            <% while (getcompteDemEx.next()) {  %> 
                            <li>
                                <a href="table demandeur externe.jsp">> <span>Liste demandeurs externes </span> <a href="../#"><span class="badge"><% out.println(getcompteDemEx.getString("compteE")); %></span></a>
                            </li>
                            <% } %> 
                            <% while (getcompteDemIn.next()) { %>
                                <li>
                                    <a href="table demandeur interne.jsp">> <span>Liste demandeurs internes </span><span class="badge"><% out.print(getcompteDemIn.getString("compteI")); %></span> </a>
                                </li>
                            <% } %>
                                                       
                        </ul>
                     </li>
                     
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../images/agreement.png" alt="#" />Demandeur en teste
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin" aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table teste du demandeur externe.jsp">>> <span> Les externes</span></a>
                        </li>
                        <li>
                            <a href="table teste du demandeur interne.jsp">>> <span> Les internes</span></a>
                        </li>
                      </ul>
                    </li>
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../images/agreement.png" alt="#" />Demandeur accepter
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <% while (getcompteAccEx.next()) {  %> 
                        <li>
                            <a href="table demandeur externe accepter.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span> <span class="badge"><% out.println(getcompteAccEx.getString("compteDext")); %></span></a>
                        </li>
                        <% }  %>  
                        <% while (getcompteAccInt.next()) {  %> 
                        <li>
                           <a href="table demandeur interne accepter.jsp">
                           <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span> <span class="badge"><% out.println(getcompteAccInt.getString("compteDint")); %></span></a>
                        </li>
                        <% }  %>  
                      </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <img style="width: 27px;" class="img-responsive rounded-circle" src="../../images/delete-folder.png" alt="#" />Demandeur supprimer
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table demandeur externe refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span></a>
                        </li>
                        <li>
                            <a href="table demandeur interne refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span></a>
                        </li>
                      </ul>
                    </li>
                    
                    <li>
                        <a href="contact.jsp">
                        <i class="fa fa-phone red_color"></i> <span>Contact</span></a>
                    </li>
                    
                  </ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="full">
                           <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                           <div class="logo_section">
                              <a href="index.jsp"></a>
                           </div>
                           <div class="right_topbar">
                              <div class="icon_info">
                                
                                 <ul class="user_profile_dd">
                                    <li>
                                       <% while (V_res1.next()) { %>
                                            <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                          <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                             <%}%>                                   
                                          <div class="dropdown-menu">
                                          
                                          <% if (email_admin != null){ %>
                                             <form action="../../DeconServlet" method="GET">
                                                <a class="dropdown-item" href="#">
                                                   <button type="submit" class="btn btn-danger">
                                                      <span>Deconnexion</span> <i class="fa fa-sign-out"></i>
                                                   </button>
                                                </a>
                                             </form>
                                       <% } %> 
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                    </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
                <div class="midde_cont">
                     <div class="container-fluid">

                        <div class="row column_title">
                           <div class="col-md-12">
                              <div class="page_title">
                                 <h2>Liste demandeurs externes </h2> 
                              </div>
                           </div>
                        </div>  
                         
                        <div class="input-group mb-3 col-lg-4" style="float: inline-end;">
                            <input placeholder="Recherche" type="text" id="searchCode" name="recherche" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                         <%-- table --%>
                         <table class="table">
                           <thead>
                              <tr>
                                 <th scope="col">Nom</th>
                                 <th scope="col">Prenom</th>
                                 <th scope="col">Email</th>
                                 <th scope="col">Metier</th>
                                 <th scope="col">Sexe</th>   
                                 <th scope="col">Action</th>
                                 <th scope="col">Observation</th>  
                                 <th scope="col"></th>


                              </tr>
                           </thead>
                           
                              <% while (AllEmpl.next()) { %>
         
                           <tbody>
                              <tr>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllEmpl.getString("nom_eurExt")); %>
                                 </td>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllEmpl.getString("prenom_eurExt")); %>
                                 </td>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllEmpl.getString("email_eurExt")); %>
                                 </td>
                                 <td style="vertical-align: middle;">                               
                                    <% out.println(AllEmpl.getString("nom_nosMet")); %>
                                 </td>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllEmpl.getString("sexe")); %>
                                 </td>
                                 <td class="row btn-action">
                                    
                                    <a href="demandeur Externe.jsp?id_eurExt=<% out.println(AllEmpl.getString("id_eurExt")); %>">
                                        
                                        <img          
                                        title="Voir"
                                        data-bs-toggle="modal"
                                        data-bs-target="#" 
                                        data-bs-whatever=""
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" 
                                        src="../../images/hypermetropie.png"
                                        class="btn-voir"
                                        >
                                    </a>
                                    </a>
                                    <% if(demandeurExt.getTestById(AllEmpl.getInt("id_eurExt"), con).compareTo("")==0){  %>

                                    <img 
                                        src="../../images/accept.png"
                                        title="Accepter"
                                        data-bs-toggle="modal" 
                                        data-bs-target="#exampleModal" 
                                        data-bs-recipient="<% out.println(AllEmpl.getString("email_eurExt")); %>"
                                         data-bs-id="<% out.println(AllEmpl.getString("id_eurExt")); %>"
                                        style="width: 2rem;margin-top: 2px;"
                                     >
                                    
                                    <%}%>
                                    
                                    <form method="post" action="../../insertionDemande_accEx">
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Message par email</h5>
                                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                  <div class="mb-3">
                                                    <label for="recipient-name" class="col-form-label">Recipient:</label>
                                                    <input type="text" class="form-control" name="rec" value="<% out.println(AllEmpl.getString("email_eurExt")); %>" id="recipient-name">
                                                    <input type="hidden" class="id form-control" name="id_eurExt" value="<% out.println(AllEmpl.getString("id_eurExt")); %>" id="recipient-name">
                                                  </div>
                                                  <div class="mb-3">
                                                    <label for="date-input" class="col-form-label">Date du test d'embauche</label>
                                                    <input type="date" class="form-control" id="date-input" name="date">
                                                  </div>
                                                  <div class="mb-3">
                                                    <label for="time-input" class="col-form-label">Heure du test d'embauche</label>
                                                    <input type="time" class="form-control" id="time-input" name="heure">
                                                 </div>
                                                </div>
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                                                  
                                                    <button type="button" 
                                                          class="btn btn-success"
                                                          data-bs-toggle="modal"
                                                          data_1 ="<% out.println(AllEmpl.getString("id_eurExt")); %>"
                                                          data-bs="<% out.println(AllEmpl.getString("nom_nosMet")); %>"  
                                                          data-bs-target="#exampleModal1"
                                                    >Envoyer</button>
                                                          
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel2">Acc�ptation</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                         <h4 class="modal-title" id="exampleModalLabel">�tes-vous s�r d'envoyer ce message avec la date du test d'embauche en email?</h4>
                                                        <input type="hidden" class="id2 form-control" name="id" value="<% out.println(AllEmpl.getString("id_eurExt")); %>" id="id2">
                                                       
                                                        <div class="mt-4" style="display: flex; justify-content: flex-end;">
                                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">NON</button>
                                                            <input type="submit" class="btn btn-success" value="Oui">
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>


                                    <form method="post" action="../../insertionDemande_refEx" >
                                        <img    
                                            src="../../images/supprimer.png"
                                            type="button"
                                            class="btn-supprimer" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#btnOuiNon" 
                                            prend_id="<% out.println(AllEmpl.getString("id_eurExt")); %>">
                                        
                                        <div class="modal fade" id="btnOuiNon" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Acc�ptation</h5>

                                                </div>
                                                <div class="modal-body">
                                                    <h4 class="modal-title" id="exampleModalLabel">�tes vous s�r de supprimer ?</h4>
                                                    <input type="hidden" class="id form-control" name="id" id="exampleFormControlInput1" >

                                                    <div class="mt-4" style="display: flex;column-gaprow-gap: 4px;justify-content: end;column-gap: 22px;">
                                                        <div class="accept">
                                                            <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                <div class="btn btn-danger "> NON </div>
                                                            </span>
                                                        </div>
                                                        <div class="accept">
                                                            <button class="btn btn-success" type="submit">
                                                                OUI
                                                            </button>
                                                        </div>
                                                    </div>

                                                </div>
                                              </div>
                                            </div>
                                        </div>    
                                            
                                        
                                    </form>
                                </td>
                                
                                <td style="vertical-align: middle;">
                                    <% out.println(demandeurExt.getTestById(AllEmpl.getInt("id_eurExt"), con)); %>

                                </td>
                           </tbody> 
                        <%}%>
                        </table> 
                         <%-- fin table --%>
                             
                     </div>
                </div>
               <!-- Modal -->
            </div>
         </div>
      </div>
     
    <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>  
    <script src="js/js_erreur/jsError.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
            <!-- custom js -->
    <script src="js/chart_custom_style1.js"></script>
    <script src="js/custom.js"></script>
      
    <script>
        var exampleModal = document.getElementById('exampleModal1')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var recipient = button.getAttribute('data-bs')   
        
        var recipient1 = button.getAttribute('data_1') 
        var id2 = document.getElementById("id2")

       // var modalBodyClassId2 = exampleModal.querySelector('.modal-body .id2')
        
        var id = button.getAttribute('data')
        var modalBodyClassId = exampleModal.querySelector('.modal-body .id')
        
        var id_eurInt = button.getAttribute('data-bs-id')
        var modalBodyClassId_eurInt = exampleModal.querySelector('.modal-footer .id_eurInt')

        var modalTitle = document.getElementById('exampleModalLabel2')
        var modalBodyInput = exampleModal.querySelector('.modal-body .id')   
        
        modalTitle.textContent = 'Repondre message '
        modalBodyInput.value = recipient1 
        id2.value = recipient1
       

        })
     </script>

    <script>
        var exampleModal = document.getElementById('btnOuiNon')
        btnOuiNon.addEventListener('show.bs.modal', function (event) {
          var button = event.relatedTarget

        var prend_id = button.getAttribute('prend_id')
        var modalBodyPrend_id = btnOuiNon.querySelector('.modal-body .id')

          var modalTitle = btnOuiNon.querySelector('.modal-title')
          var modalBodyInput = btnOuiNon.querySelector('.modal-body input')

          modalTitle.textContent = 'Nouveau message ' 
          modalBodyPrend_id.value = prend_id
        })

    </script>     
    <script>
        var exampleModal = document.getElementById('exampleModal')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var recipient = button.getAttribute('data-bs-recipient')   
        
        var id = button.getAttribute('data-bs-id')
        var modalBodyClassId = exampleModal.querySelector('.modal-body .id')

        var recipient1 = button.getAttribute('data_1') 
        var id2 = document.getElementById("id2")
        
        var button = document.querySelector('button[data_1]'); 
        button.setAttribute('data_1', id);
        
        var modalBodyClassId = exampleModal.querySelector('.modal-body .id')
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')   
        
        modalTitle.textContent = 'Repondre message ' + id 
        modalBodyInput.value = recipient 
        modalBodyClassId.value = id       
      

        })
     </script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>

      <script>
         (function () {
            'use strict'
         
            var forms = document.querySelectorAll('.needs-validation')
         
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
            .forEach(function (form) {
               form.addEventListener('submit', function (event) {
                  if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                  }
         
                  form.classList.add('was-validated')
               }, false)
            })
         })()
      </script>
      
    <script>
        const searchInput = document.getElementById("searchCode");     
        const error = document.getElementById("msg-error");  


        const rows = document.querySelectorAll('.table tbody tr');
        
        searchInput.addEventListener('keyup', function(event) {
            const searchString = event.target.value.toLowerCase();
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
               
                if (text.includes(searchString)) {
                    
                    row.style.display = 'table-row';  
                    error.style.display = 'none';

                }else {
                    row.style.display = 'none';  
                    error.style.display = 'inline';

                } 
            });
       
        });
    </script>
                      
    <!-- message js-->	
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            if (message == 1) {
              // Afficher la notification de succ�s avec Swal.fire()
              Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Message email',
                showConfirmButton: false,
                timer: 1500
              });
            } else if (message == 0) {
              // Afficher la notification d'erreur avec Swal.fire()
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!'
              });
            }
        </script>

     
   </body>
</html>