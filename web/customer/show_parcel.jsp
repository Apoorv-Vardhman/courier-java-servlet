<%-- 
    Document   : customerdashboard
    Created on : Sep 24, 2021, 3:30:04 PM
    Author     : Puja Sinha
    Don't Copy the Code Fool Developer 
--%>

<%@page import="com.puja.customer.dao.ParcelCancelDao"%>
<%@page import="com.puja.customer.dao.DB"%>

<%@page import="com.puja.customer.dao.ParcelDao"%>
<%@page import="com.puja.customer.models.ParcelItem"%>
<%@page import="com.puja.customer.models.Parcel"%>
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
                <% Parcel parcel = (Parcel)request.getAttribute("parcel");
                ParcelItem parcelItem = new ParcelDao(DB.getConnection()).getParcelItem(parcel.getP_id());
                %>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h2>Parcel Details</h2>
                            </div>
                            
                            <table class="table table-bordered">
                                
                                <tr>
                                    <th>Parcel ID</th>
                                    <th><%=parcel.getP_id()%></th>
                                </tr>
                                <tr>
                                    <th>Payment Mode</th>
                                    <th><%=parcel.getP_payment_mode()%></th>
                                </tr>
                                <tr>
                                    <th>Registered Date</th>
                                    <th><%=parcel.getP_registered_date()%></th>
                                </tr>
                                <tr>
                                    <th>Picked Date</th>
                                    <th><%
                                        if(parcel.getP_picked_date()==null){
                                            out.print("N/A");
                                        }else{
                                            out.print(parcel.getP_picked_date());
                                        }
                                        %></th>
                                    
                                </tr>
                                <tr>
                                    <th>Out Of Delivery Date</th>
                                    <th><%
                                        if(parcel.getP_outfordelivery()==null){
                                            out.print("N/A");
                                        }else{
                                            out.print(parcel.getP_outfordelivery());
                                        }
                                        %></th>
                                </tr>
                                <tr>
                                    <th>Reached Date</th>
                                    <th><%
                                        if(parcel.getP_reached_date()==null){
                                            out.print("N/A");
                                        }else{
                                            out.print(parcel.getP_reached_date());
                                        }
                                        %></th>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <th><%=parcelItem.getP_status()%></th>
                                </tr>
                                <tr>
                                    <th>Total Amount</th>
                                    <th>
                                        <%=parcel.getP_parcel_cost()%>
                                    </th>
                                </tr>
                            </table>
                                <%
                                    ParcelCancelDao parcelCancelDao = new ParcelCancelDao(DB.getConnection());
                                    ParcelDao parcelDao = new ParcelDao(DB.getConnection());
            if(!parcelCancelDao.isCancelled(parcel.getP_id())){ %>
                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#cancelOrder">
                                                    Cancel Order
                                                  </button>
                                          <%  }
                                          %>
                            <%
                                            if(parcelDao.isParcelReached(parcel.getP_id())){ %>
                                            <a href="<%=Constants.orderFeedback+parcel.getP_id() %>" class="btn btn-success">Order Feedback</a>
                                          <%  }
                                          %>
                                          
                            <!-- Modal -->
                            <div class="modal fade" id="cancelOrder" tabindex="-1" role="dialog" aria-labelledby="cancelOrder" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Cancel Order</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                      <form method="post" action="<%= Constants.orderCancel %>">
                                          <input name="parcel_id" value="<%= parcel.getP_id()%>" required="" hidden>
                                          <input name="c_id" value="<%=customer.getC_id() %>" hidden>
                                          <div class="form-group">
                                              <label>Reason</label>
                                              <input class="form-control" name="reason" type="text" required="" placeholder="Enter cancel reason">
                                          </div>
                                          <%
                                            if(!parcelCancelDao.isCancelled(parcel.getP_id())){ %>
                                                <div class="form-group justify-content-end d-flex">
                                                    <button type="submit" class="btn btn-danger">Cancel Order</button>
                                                </div>
                                          <%  }
                                          %>
                                          
                                      </form>
                                          
                                  </div>
<!--                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                  </div>-->
                                </div>
                              </div>
                            </div>
                                
                        </div>                                   
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
