<%-- 
    Document   : customerdashboard
    Created on : Sep 24, 2021, 3:30:04 PM
    Author     : Puja Sinha
    Don't Copy the Code Fool Developer 
--%>

<%@page import="java.util.List"%>
<%@page import="com.puja.customer.models.Reciepient"%>
<%@page import="com.puja.customer.utils.CustomerUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Courier Customer Place Order Create</title>

        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/bootstrap.css")%>" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" >
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/Style.css")%>" />
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/mobile-style.css")%>">

    </head>
    <body class="body-gradient">
        
        <%@include file="header.jsp" %>
        <%@include file="sidebar.jsp" %> 
         

        <div class="page-content p-5" id="content">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
                <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
            </button>
            <div class="container">
                <%@include file="message.jsp" %>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <form class="" method="post" action="">
                            <input class="form-control" value="<%= customer.getC_id() %>" required hidden name="c_id">
                            <fieldset>
                                
                                <div class="card">
                                    <div class="card-header">
                                        <legend>Sender Detail</legend>
                                    </div>
                                    <div class="card-body">
                                        <div class="row ">
                                            <div class="form-group col-md-6">
                                                <label class="form-label">Sender Name</label>
                                                <input class="form-control" readonly="" value="<%= customer.getC_name()%>" name="sender_name" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="form-label">Sender Mobile</label>
                                                <input class="form-control" readonly="" value="<%= customer.getC_mob()%>" type="text" minlength="10" pattern="[789][0-9]{9}" maxlength="10" name="sender_mobile" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="form-label">Sender Email</label>
                                                <input class="form-control" readonly="" value="<%= customer.getC_email()%>" name="sender_email" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="form-label">Sender Address</label>
                                                <input class="form-control" readonly="" value="<%= customer.getC_address()%>" name="sender_address" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </fieldset>
                            
                                        <fieldset>
                                            
                                            <div class="card">
                                                <div class="card-header">
                                                    <legend>Recipient Detail</legend>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient Name</label>
                                                        <input class="form-control" value="" name="r_name" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient Mobile</label>
                                                        <input class="form-control" value="" type="text" minlength="10" pattern="[789][0-9]{9}" maxlength="10" name="r_phone" required>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient Address</label>
                                                        <input class="form-control" value="" name="r_address" required>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient pin</label>
                                                        <input class="form-control" value="" name="r_pin" maxlength="6" minlength="6" pattern="[0-9]{6}" required>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient State</label>
                                                        <input class="form-control" value="" name="r_state" required>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient District</label>
                                                        <input class="form-control" value="" name="r_district" required>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Recipient City</label>
                                                        <input class="form-control" value="" name="r_city" required>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            
                                            <div class="card">
                                                <div class="card-header">
                                                    <legend>Parcel Detail</legend>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Payment Mode</label>
                                                            <select class="form-control" name="payment_mode" required>
                                                                <option value="cod">COD</option>
                                                                <option value="online">Online</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Parcel Detail</label>
                                                            <input class="form-control" value="" name="p_details" required>
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">No of items</label>
                                                            <input class="form-control" type="number" value="" name="p_no_of_item" required>
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Location</label>
                                                            <input class="form-control"  value="" name="p_location" required>
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Weight</label>
                                                            <input class="form-control" type="number"  value="" name="p_weight" required>
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Length</label>
                                                            <input class="form-control" type="number" value="" name="p_length" required>
                                                        </div>


                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Width</label>
                                                            <input class="form-control" type="number"  value="" name="p_width" required>
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label class="form-label">Height</label>
                                                            <input class="form-control" type="number"  value="" name="p_height" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                            <div class="row">
                                
                                
                                
                                
                                    <div class="d-flex justify-content-center w-100">
                                        <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                                    </div>
                            </div>    
                            
                        </form>
                                    
                    </div>
                </div>
            </div>
        </div>
<script src="<%=CustomerUtil.assets("js/jquery.js")%>"></script>
<script src="<%=CustomerUtil.assets("js/popper.js")%>">
</script>
<script src="<%=CustomerUtil.assets("js/bootstrap.js")%>">
</script>
<script src="<%=CustomerUtil.assets("js/main.js")%>"></script>
<script>
    
</script>
</body>
</html>
