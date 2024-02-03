<%@page import="table.nosmetier"%>
<%@page import="table.admin"%>

<%@page import="table.sexe"%>
<%@page import="table.sousTitre"%>
<%@ page import="table.employeur" %>
<%@ page import="table.visiteur" %>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
     ResultSet V_res = admin.afficherAdmin(email_admin, con);
     ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    
    ResultSet AllSex = sexe.getAllSex(con); 
    ResultSet resann = nosmetier.getnosMetier(con); 
    ResultSet AllVisiteur = employeur.getAllVisiteur(con); 
    ResultSet AllIdVisiteur = employeur.getIdAllVisiteur(request.getParameter("id"),con);

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
      <title>Value-IT - Modification </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
           
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />


   </head>
 
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="index.jsp"></a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                              <% while (V_res.next()) { %> 
                        <div class="user_img"><img class="img-responsive" src="../../image/<% out.println(V_res.getString("image_admin")); %>" alt="image" /></div>
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
                     <li><a href="price.jsp"><i class="fa fa-briefcase blue1_color"></i> <span>Pricing Tables</span></a></li>
                     <li>
                        <a href="contact.jsp">
                        <i class="fa fa-phone red_color"></i> <span>Contact</span></a>
                     </li>
                     <li class="active">
                        <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-briefcase yellow_color"></i> <span> Liste des demandes</span></a>
                        <ul class="collapse list-unstyled" id="additional_page">
 
                           <li>
                              <a href="table demandeur interne.jsp">> <span>Liste demandeur interne</span></a>
                           </li>
                           <li>
                              <a href="table demandeur externe.jsp">> <span>Liste demandeur externe</span></a>
                           </li>
                        </ul>
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
                                 <ul>
                                    <li><a href="#"><i class="fa fa-bell-o"></i><span class="badge">2</span></a></li>
                                    <li><a href="#"><i class="fa fa-question-circle"></i></a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a></li>
                                 </ul>
                                 <ul class="user_profile_dd">
                                    <li>
                                    <% while (V_res1.next()) { %>
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="images/layout_img/user_img.jpg" alt="#" />
                                       <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                          <%}%>                                   
                                       <div class="dropdown-menu">
                                       <a class="dropdown-item" href="profile.jsp">Profile</a>
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
                                 <h2>Modification employeur</h2>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-12">
                           <div class="dash_blog">
                              <div class="dash_blog_inner">
                                    <div class="dash_head">
                                       <h3><span><i class="fa fa-edit"></i> Modification employeur</span></h3>
                                    </div>
                                 
                                    <div class="msg_list_main">
                                    <div class="col-md-12">
                                       <div class="card-body">
                                          <%-- example --%>
                                          
                                          <% while (AllIdVisiteur.next()) { %>
                                          
                                            <form class="row g-3 needs-validation" action="../../estModificationEmp" method="POST" enctype="multipart/form-data" novalidate>
                                                <input type="text" class="form-control" id="validationCustom01" name="id" value="<% out.println(AllIdVisiteur.getString("id_visit")); %>" style="display: none;" required>
                                                
                                                <div class="col-lg-12">
                                                    <div class="user_profle_side">
                                                       <div class="user_img"><img class="img-responsive" src="../../image/<% out.println(AllIdVisiteur.getString("image_visit")); %>" alt="#" /></div>
                                                    </div>
                                                    <label for="formFile validationCustom03" class="form-label" style="margin-top: 32px;">Changer la photo de profil</label>
                                                    <input class="form-control col-lg-4" type="file" name="file" id="formFile validationCustom03" value="<% out.println(AllIdVisiteur.getString("image_visit")); %>" required>
                                                    <div class="valid-feedback">
                                                        Looks good!
                                                    </div>
                                                    <div class="invalid-feedback">
                                                        Please select your profil.
                                                     </div>
                                                      
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationCustom02" class="form-label">Pseudo</label>
                                                        <input type="text" class="form-control" id="validationCustom02" name="pseudo" value="<% out.println(AllIdVisiteur.getString("pseudo_visit")); %>" required>
                                                    <div class="valid-feedback">
                                                        Looks good!
                                                    </div>
                                                    <div class="invalid-feedback">
                                                        Please select a first name.
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationCustom01" class="form-label">Nom</label>
                                                    <input type="text" class="form-control" id="validationCustom01" name="nom_empl" value="<% out.println(AllIdVisiteur.getString("nom_visit")); %>" required>
                                                    <div class="valid-feedback">
                                                        Looks good!
                                                    </div>
                                                    <div class="invalid-feedback">
                                                        Please select a name.
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label for="validationCustom02" class="form-label">Prenom</label>
                                                   <input type="text" class="form-control" id="validationCustom02" name="prenom_empl"  value="<% out.println(AllIdVisiteur.getString("prenom_visit")); %>" required>
                                                   <div class="valid-feedback">
                                                        Looks good!
                                                   </div>
                                                   <div class="invalid-feedback">
                                                        Please select a first name.
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label for="validationCustom02" class="form-label">tel</label>
                                                   <input type="text" class="form-control" id="validationCustom02" name="tel_empl" value="<% out.println(AllIdVisiteur.getString("tel_visit")); %>" required>
                                                   <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a tel.
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationCustom02" class="form-label">Mot de passe</label>
                                                    <input type="text" class="form-control" id="validationCustom02" name="mdp_empl" value="<% out.println(AllIdVisiteur.getString("motdepass_visit")); %>" required>
                                                    <div class="valid-feedback">
                                                       Looks good!
                                                       </div>
                                                       <div class="invalid-feedback">
                                                       Please select a password.
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label for="validationCustomUsername" class="form-label">email</label>
                                                   <div class="input-group has-validation">
                                                      <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                      <input type="text" class="form-control" id="validationCustomUsername" name="email_empl" aria-describedby="inputGroupPrepend" value="<% out.println(AllIdVisiteur.getString("email_visit")); %>" required>
                                                      <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a email.
                                                   </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label for="validationCustom03" class="form-label">adresse</label>
                                                   <input type="text" class="form-control" id="validationCustom03"   name="adress_empl"  value="<% out.println(AllIdVisiteur.getString("adress_visit")); %>"required>
                                                   <div class="valid-feedback">
                                                      Looks good!
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Please select a adresse.
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label  for="validationCustom04" class="form-label">sexe : <% out.println(AllIdVisiteur.getString("sexe")); %></label>
                                                   <select name="id_sexe" class="form-select col-md-6" id="validationCustom04" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example" required>
                                                      <option selected disabled value="<% out.println(AllIdVisiteur.getString("sexe")); %>">Choisir...</option>
                                                      <option>
                                                      <% while (AllSex.next()) { %>
                                                         <option value="<% out.println(AllSex.getString("id_sexe")); %>">
                                                            <% out.println(AllSex.getString("sexe")); %>
                                                         </option>
                                                      <% }%>
                                                      </option>
                                                   </select>
                                                   <div class="valid-feedback">
                                                   Looks good!
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Please select a sexe.
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="validationCustom03" class="form-label">Metier</label>
                                                    <input type="text" class="form-control" disabled="false" id="validationCustom03" value="<% out.println(AllIdVisiteur.getString("nom_nosMet")); %>"required>
                                                   <select name="id_nosMet" class="form-select col-md-6" id="validationCustom04" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example"  required>
                                                      <option selected disabled value="<% out.println(AllIdVisiteur.getString("nom_nosMet")); %>">Choisir...</option>
                                                      <option>
                                                         <% while (resann.next()) { %>
                                                            <option value="<% out.println(resann.getString("id_nosMet")); %>">
                                                                  <% out.println(resann.getString("nom_nosMet")); %>
                                                            </option>
                                                         <% }%>
                                                      </option>
                                                   </select>
                                                   <div class="valid-feedback">
                                                   Looks good!
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Please select a sexe.
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationCustom03" class="form-label">Type</label>

                                                    <input type="text" class="form-control" disabled="false" id="validationCustom03" value="<% out.println(AllIdVisiteur.getString("type_visit")); %>"required>
                                                   <div class="valid-feedback">
                                                      Looks good!
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Please select a adresse.
                                                   </div>
                                                </div>
                                                <div class="form-check mt-3">
                                                    <label for="validationCustom03" class="form-label">Changer le type : </label>

                                                    <div class="form-check col-md-4"> 
                                                       <input class="form-check-input" type="radio" name="type" value="Travailleur" checked>
                                                       <label class="form-check-label" for="flexRadioDefault1">
                                                          Travailleur
                                                       </label>
                                                    </div>

                                                    <div class="form-check">
                                                       <input class="form-check-input" type="radio" name="type" value="Admin" checked>
                                                       <label class="form-check-label" for="flexRadioDefault2">
                                                          Admin
                                                       </label>
                                                    </div>
                                                </div>
                                                      
                                                    <div class="read_more">
                                                       <div class="center"><input class="btn btn-success " type="submit" value="Enregistrer">
                                                       </div>
                                                    </div>
                                            </form>

                                          <%}%>

                                       </div>
                                    </div>
                                    
                                 </div>
                                 
                              </div>
                           </div>
                        </div>   
                     </div>
                </div>


               <!-- end dashboard inner -->
            </div>
         </div>
      </div>
     <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="js/chart_custom_style1.js"></script>
      <script src="js/custom.js"></script>
      <script>
         // Example starter JavaScript for disabling form submissions if there are invalid fields
         (function () {
            'use strict'
         
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
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
      
   </body>
</html>