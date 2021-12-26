<%-- 
    Document   : staff_your_colleagues
    Created on : 19 Oct, 2021, 8:58:23 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="commonutility.CommonUtility"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : admin
    Created on : 21 Jun, 2021, 7:01:32 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--<meta http-equiv="X-UA-Compatible" content="ie=edge" />-->
        <title>CMS</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
              crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css" />
        <link rel="stylesheet" href="./mobile-style.css">

    </head>
    <body>
        <header>
            <div class="container-fluid p-0">
                <!--p-0 to remove padding -- to use class just type .cls and enter(tag auto appears)-->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">E-Courier/Your Colleagues</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <div class="mr-auto"></div>
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="staff.jsp">Home
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Help</a>
                                </li>                                                        
                                <li class="nav-item">
                                    <a class="nav-link" href="#">LogOut<i class="fas fa-sign-out-alt"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
            </div>
        </nav>
    </div>     
</header>

<!--vertical navbar-->
<div class="vertical-nav bg-white" id="sidebar">
    <div class="py-4 px-3 mb-4 bg-light">
        <div class="media d-flex align-items-center"><img src="images/admin.png" alt="" width="80" height="80" class="mr-3 rounded-circle img-thumbnail shadow-sm">
            <div class="media-body">
                <h4 class="m-0">Shriya</h4>
                <p class="font-weight-normal text-muted mb-0">Staff</p>
            </div>
        </div>
    </div>
    <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Dashboard</p>
    <ul class="nav flex-column bg-white mb-0">
        <li class="nav-item">
            <a href="staff_cancel_by_customer.jsp" class="nav-link text-dark">
                <i class="fas fa-user-shield mr-3 text-primary fa-fw"></i>
                Cancelled by customer
            </a>
        </li>        
        <li class="nav-item">
            <a href="staff_parcel_to_deliver.jsp" class="nav-link text-dark">
                <i class="fas fa-user-shield mr-3 text-primary fa-fw"></i>
                Parcels to Deliver
            </a>
        </li>
        <li class="nav-item">
            <a href="staff_parcel_delivered.jsp" class="nav-link text-dark">
                <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                Parcels Delivered
            </a>
        </li>
        <li class="nav-item">
            <a href="staff_view_all_parcels.jsp" class="nav-link text-dark">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                View All Parcels
            </a>
        </li>
        <li class="nav-item">
            <a href="staff_your_colleagues.jsp" class="nav-link text-dark bg-light">
                <i class="fas fa-people-carry mr-3 text-primary fa-fw"></i>
                Your Colleagues
            </a>
        </li>        
    </ul>
    <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">PROFILE</p>
    <ul class="nav flex-column bg-white mb-0">
        <li class="nav-item">
            <a href="staff_profile.jsp" class="nav-link text-dark">
                <i class="fas fa-id-card mr-3 text-primary fa-fw"></i>
                Update Profile
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-dark">
                <i class="fas fa-sign-out-alt mr-3 text-primary fa-fw"></i>
                Logout
            </a>
        </li>                
    </ul>
</div>

<div class="page-content p-5" id="content">
    <div class="row">
        <div class="col-md-1">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
                <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
            </button>
        </div>          
        <div class="col-md-9 text-center">            
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 text-left">
            <a href="admin_staff_add.jsp" class="btn btn-primary">Register Staff</a>            
        </div>        
        <div class="col-md-4">
            <form action="" method="get">
                <input title="Type and Press Enter" type="text" class="form-control" name="q" placeholder="Search Here...">
            </form>
        </div>        
    </div>    
    <p></p>
    <table class="table table-bordered table-hover" style="overflow-x:scroll;overflow-y: scroll;">
        <thead>
            <tr>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center" hidden="true">ID</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Name</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Gender</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Date of Birth</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">State</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">District</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">City</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Address</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Pin</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Email</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Mobile</th>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Active?</th>
            </tr>
        </thead>
        <form action="" method="post">
            <tbody>
                <%
                    try {
                        Connection con = CommonUtility.getCon();
                        Statement st = con.createStatement();
                        ResultSet res;
                        String qry = request.getParameter("q");
                        String data;
                        if (qry != null) {
                            data = "select bs_id,bs_name,bs_gender,bs_dob,bs_state,bs_district,bs_city,bs_address,bs_pin,bs_email,bs_mob,bs_isactive from branch_staff where bs_id='" + qry + "' or bs_name='" + qry + "' or bs_gender='" + qry + "' or bs_state='" + qry + "' or bs_district='" + qry + "' or bs_city='" + qry + "' or bs_address='" + qry + "' or bs_pin='" + qry + "' or bs_email='" + qry + "' or bs_mob='" + qry + "'";
                        } else {
                            data = "select bs_id,bs_name,bs_gender,bs_dob,bs_state,bs_district,bs_city,bs_address,bs_pin,bs_email,bs_mob,bs_isactive from branch_staff";
                        }
                        res = st.executeQuery(data);
                        while (res.next()) {
                %>

                <tr>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center" hidden="true"><%=res.getString("bs_id")%></td>
                    <td class="col-md-2 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_name")%></td>
                    <td class="col-md-2 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_gender")%></td>
                    <td class="col-md-2 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_dob")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_state")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_district")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_city")%></td>  
                    <td class="col-md-3 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_address")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_pin")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_email")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_mob")%></td>
                    <%
                        String p;
                        int a = res.getInt("bs_isactive");
                        if (a == 1) {
                            p = "Yes";
                        } else {
                            p = "No";
                        }
                    %>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=p%></td>                  
                </tr>

                <%
                        }
                    } catch (Exception e) {
                        System.out.print(e);
                        e.printStackTrace();
                    }
                %>
            </tbody>  
        </form>
    </table>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="main.js"></script>
</body>
</html>