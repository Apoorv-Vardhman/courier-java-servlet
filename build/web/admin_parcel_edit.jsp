<%-- 
    Document   : admin_parcel_edit
    Created on : 1 Nov, 2021, 7:57:37 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="commonutility.CommonUtility"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <!--<meta name='viewport' content='width=device-width, initial-scale=1'>-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CMS</title>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'>
        <link href='' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>body {
                background: rgb(99, 39, 120)
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }</style>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <%
            String pa_id = request.getParameter("pa_id");

            String pcid = "";
            String prid = "";
            String pco = "";
            String pcname = "";
            String pcstate = "";
            String pcdistrict = "";
            String pccity = "";
            String pcaddress = "";
            String pcpin = "";
            String pcemail = "";
            String pcmobile = "";
            String pcgender = "";
            String prname = "";
            String prstate = "";
            String prdistrict = "";
            String prcity = "";
            String prpin = "";
            String praddress = "";
            String prmobile = "";
            String psender = "";
            String pregistereddate = "";
            String papproveddate = "";
            String ppickeddate = "";
            String pinstockdate = "";
            String poutfordelivery = "";
            String pdatetoreach = "";
            String preacheddate = "";
            String ptransport = "";
            int pparcelcost=0;
            int ptransportcost=0;
            int pdelivery=0;
            int pcost=0;
            String ppayment = "";
            String preceipt = "";
            String ppdetails = "";
            int ppno = 0;
            String ppstatus = "";
            String pplocation = "";
            int ppweight=0;
            int pplength=0;
            int ppwidth=0;
            int ppheight=0;
                        
            HttpSession ses = request.getSession();
            String uid = ses.getAttribute("u").toString();
            try {
                Connection con = CommonUtility.getCon();
                PreparedStatement ps = con.prepareStatement("select parcel.p_id,parcel.c_id,parcel.r_id,parcel.p_consignment_no,customer.c_name,customer.c_state,customer.c_district,customer.c_city,customer.c_address,customer.c_pin,customer.c_email,customer.c_mob,customer.c_gender,recipient.r_name,recipient.r_state,recipient.r_district,recipient.r_city,recipient.r_pin,recipient.r_address,recipient.r_phone,parcel.p_sender_address,parcel.p_registered_date,parcel.p_approved_date,parcel.p_picked_date,parcel.p_instock_date,parcel.p_outfordelivery,parcel.p_date_to_reach,parcel.p_reached_date,parcel.p_transport_medium,parcel.p_parcel_cost,parcel.p_transport_cost,parcel.p_delivery_charges,parcel.p_cost,parcel.p_payment_mode,parcel.p_receipt_no,parcel_details.p_details,parcel_details.p_no_of_item,parcel_details.p_status,parcel_details.p_location,parcel_details.p_weight,parcel_details.p_length,parcel_details.p_width,parcel_details.p_height from parcel,customer,recipient,parcel_details where parcel.p_id='"+pa_id+"' and parcel.p_id=parcel_details.p_id and parcel.c_id=customer.c_id and parcel.r_id=recipient.r_id");
                //ps.setString(1, uid.toString());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    pcid = rs.getString("parcel.c_id");
                    prid = rs.getString("parcel.r_id");
                    pco = rs.getString("parcel.p_consignment_no");
                    pcname = rs.getString("customer.c_name");
                    pcstate = rs.getString("customer.c_state");
                    pcdistrict = rs.getString("customer.c_district");
                    pccity = rs.getString("customer.c_city");
                    pcaddress = rs.getString("customer.c_address");
                    pcpin = rs.getString("customer.c_pin");
                    pcemail = rs.getString("customer.c_email");
                    pcmobile = rs.getString("customer.c_mob");
                    pcgender = rs.getString("customer.c_gender");
                    prname = rs.getString("recipient.r_name");
                    prstate = rs.getString("recipient.r_state");
                    prdistrict = rs.getString("recipient.r_district");
                    prcity = rs.getString("recipient.r_city");
                    prpin = rs.getString("recipient.r_pin");
                    praddress = rs.getString("recipient.r_address");
                    prmobile = rs.getString("recipient.r_phone");
                    psender = rs.getString("parcel.p_sender_address");
                    pregistereddate = rs.getString("parcel.p_registered_date");
                    papproveddate = rs.getString("parcel.p_approved_date");
                    ppickeddate = rs.getString("parcel.p_picked_date");
                    pinstockdate = rs.getString("parcel.p_instock_date");                    
                    
                    poutfordelivery = rs.getString("parcel.p_outfordelivery");
                    pdatetoreach = rs.getString("parcel.p_date_to_reach");
                    preacheddate = rs.getString("parcel.p_reached_date");
                    ptransport = rs.getString("parcel.p_transport_medium");
                    pparcelcost = rs.getInt("parcel.p_parcel_cost");
                    ptransportcost = rs.getInt("parcel.p_transport_cost");
                    pdelivery = rs.getInt("parcel.p_delivery_charges");
                    pcost = rs.getInt("parcel.p_cost");
                    ppayment = rs.getString("parcel.p_payment_mode");
                    preceipt = rs.getString("parcel.p_receipt_no");

                    ppdetails = rs.getString("parcel_details.p_details");
                    ppno = rs.getInt("parcel_details.p_no_of_item");
                    ppstatus = rs.getString("parcel_details.p_status");
                    pplocation = rs.getString("parcel_details.p_location");
                    ppweight = rs.getInt("parcel_details.p_weight");
                    pplength = rs.getInt("parcel_details.p_length");
                    ppwidth = rs.getInt("parcel_details.p_width");
                    ppheight = rs.getInt("parcel_details.p_height");
                }
                System.out.println(pcid);
                ps.close();
                rs.close();
                con.close();
            } catch (Exception e) {

            }
        %>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span>(Logged In Admin)</span></div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Courier Status</h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-4"><label class="labels">PID</label><input type="text" name="pid" id="pid" class="form-control" placeholder="PID" value="<%=pa_id%>"></div>
                            <div class="col-md-4"><label class="labels">CID</label><input type="text" name="cid" id="cid" class="form-control" placeholder="CID" value="<%=pcid%>"></div>
                            <div class="col-md-4"><label class="labels">RID</label><input type="text" name="rid" id="rid" class="form-control" value="<%=prid%>" placeholder="RID"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12"><label class="labels">Consignment No.</label><input type="text" name="cno" id="cno" class="form-control" placeholder="Consignment No." value="<%=pco%>"></div>                            
                        </div>
                        <br><br><div class="d-flex justify-content-between align-items-center experience"><span><b>CUSTOMER</b></span></div><hr>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Name</label><input type="text" name="aname" id="aname" class="form-control" placeholder="Name" value="<%=pcname%>"></div>
                            <div class="col-md-6"><label class="labels">State</label><input type="text" name="astate" id="astate" class="form-control" placeholder="State" value="<%=pcstate%>"></div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">District</label><input type="text" name="adistrict" id="adistrict" class="form-control" placeholder="District" value="<%=pcdistrict%>"></div>
                            <div class="col-md-6"><label class="labels">City</label><input type="text" name="acity" id="acity" class="form-control" placeholder="City" value="<%=pccity%>"></div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Address</label><input type="text" name="aaddress" id="aaddress" class="form-control" placeholder="Address" value="<%=pcaddress%>"></div>
                            <div class="col-md-6"><label class="labels">Pin Code</label><input type="text" name="apin" id="apin" class="form-control" placeholder="Pin Code" value="<%=pcpin%>"></div>                            
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Email ID</label><input type="text" name="aemail" id="aemail" class="form-control" placeholder="Email ID" value="<%=pcemail%>"></div>
                            <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" name="amobile" id="aemail" class="form-control" placeholder="Mobile No." value="<%=pcmobile%>"></div>
                            <div class="col-md-12"><label class="labels">Gender</label><input type="text" name="agender" id="agender" class="form-control" placeholder="Gender" value="<%=pcgender%>"></div>                            
                        </div>
                        <br><br><div class="d-flex justify-content-between align-items-center experience"><span><b>RECIPIENT</b></span></div><hr>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Name</label><input type="text" name="rname" id="rname" class="form-control" placeholder="Name" value="<%=prname%>"></div>
                            <div class="col-md-6"><label class="labels">State</label><input type="text" name="rstate" id="rstate" class="form-control" placeholder="State" value="<%=prstate%>"></div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">District</label><input type="text" name="rdistrict" id="rdistrict" class="form-control" placeholder="District" value="<%=prdistrict%>"></div>
                            <div class="col-md-6"><label class="labels">City</label><input type="text" name="rcity" id="rcity" class="form-control" placeholder="City" value="<%=prcity%>"></div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Pin Code</label><input type="text" name="rpin" id="rpin" class="form-control" placeholder="Pin Code" value="<%=prpin%>"></div>
                            <div class="col-md-6"><label class="labels">Address</label><input type="text" name="raddress" id="raddress" class="form-control" placeholder="Address" value="<%=praddress%>"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" name="amobile" id="aemail" class="form-control" placeholder="Mobile No." value="<%=prmobile%>"></div>                            
                        </div>
                        <div class="row mt-3">
                        <div class="col-md-6 text-center"><a href="admin_parcel_edit.jsp?pa_id=<%=pa_id%>" class="btn btn-primary profile-button">Update</a></div>
                        <div class="col-md-6 text-center"><a href="admin_parcel_view.jsp" class="btn btn-primary profile-button">Cancel</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience"><span><b>PARCEL INFO</b></span></div><br>
                        <div class="col-md-12">
                            <label class="labels">Sender Address</label>
                            <input type="text" name="psender" id="psender" class="form-control" placeholder="Sender Address" value="<%=psender%>">
                        </div>
                        <div class="row mt-2">                        
                            <div class="col-md-12">
                                <label class="labels">Registered Date</label>
                                <input type="date" name="p_registered_date" id="p_registered_date" class="form-control" placeholder="Registered Date" value="<%=pregistereddate %>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Approved Date</label>
                                <input type="date" name="p_approved_date" id="p_approved_date" class="form-control" placeholder="Approved Date" value="<%=papproveddate %>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Picked Date</label>
                                <input type="date" name="p_picked_date" id="p_picked_date" class="form-control" placeholder="Picked Date" value="<%=ppickeddate %>">
                            </div>
                        </div>
                        <div class="row mt-2">                        
                            <div class="col-md-12">
                                <label class="labels">InStock Date</label>
                                <input type="date" name="p_instock_date" id="p_instock_date" class="form-control" placeholder="InStock Date" value="<%=pinstockdate %>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Out For Delivery</label>
                                <input type="date" name="p_outfordelivery_date" id="p_outfordelivery_date" class="form-control" placeholder="Out For Delivery Date" value="<%=poutfordelivery %>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Date To Reach</label>
                                <input type="date" name="p_date_to_reach" id="p_date_to_reach" class="form-control" placeholder="Date To Reach" value="<%=pdatetoreach %>">
                            </div>
                        </div>
                        <div class="row mt-2">                        
                            <div class="col-md-12">
                                <label class="labels">Reached Date</label>
                                <input type="date" name="p_reached_date" id="p_reached_date" class="form-control" placeholder="Reached Date" value="<%=preacheddate %>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Transport Medium</label>
                                <input type="text" name="p_transport" id="p_transport" class="form-control" placeholder="Medium" value="<%=ptransport %>">
                            </div>                            
                        </div>
                        <div class="row mt-2">                        
                            <div class="col-md-6">
                                <label class="labels">Parcel's Cost</label>                                
                                <input type="text" name="p_cost" id="p_cost" class="form-control" placeholder="Parcel's Cost" value="<%=Integer.toString(pparcelcost)%>">
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Transport Cost</label>
                                <input type="text" name="p_transport_cost" id="p_transport_cost" class="form-control" placeholder="Transport COst" value="<%=Integer.toString(ptransportcost)%>">
                            </div>
                            <!--<div class="col-md-4">
                                <label class="labels">Delivery Charges</label>
                                <input type="text" name="p_delivery" id="p_delivery" class="form-control" placeholder="Delivery Charges" value="<%=Integer.toString(pdelivery)%>">
                            </div>-->
                        </div>
                        <div class="row mt-2">                        
                            <div class="col-md-12">
                                <label class="labels">Total Parcel Cost</label>
                                <input type="text" name="p_parcel_cost" id="p_parcel_cost" class="form-control" placeholder="Total Cost" value="<%=Integer.toString(pcost)%>">
                            </div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label class="labels">Payment Mode</label>
                                <input type="text" name="p_payment" id="p_payment" class="form-control" placeholder="Payment Mode" value="<%=ppayment%>">
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Receipt No.</label>
                                <input type="text" name="p_receipt" id="p_receipt" class="form-control" placeholder="Receipt No." value="<%=preceipt%>">
                            </div>
                        </div><br><br>
                        <div class="d-flex justify-content-between align-items-center experience"><span><b>PARCEL DETAILS</b></span></div><hr>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <label class="labels">Parcel Details</label>                                
                                <textarea class="form-control" name="p_details" id="p_details" rows="3" data-rule="required" data-msg="" placeholder="Message"><%=ppdetails %></textarea>
                            </div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label class="labels">Items In parcel</label>
                                <input type="text" name="p_no" id="p_no" class="form-control" placeholder="No. of Item" value="<%=Integer.toString(ppno)%>">
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Status</label>
                                <input type="text" name="p_status" id="p_status" class="form-control" placeholder="Status" value="<%=ppstatus %>">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <label class="labels">Location</label>
                                <input type="text" name="p_location" id="p_location" class="form-control" placeholder="Location" value="<%=pplocation %>">
                            </div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label class="labels">Weight(g)</label>
                                <input type="text" name="p_weight" id="p_weight" class="form-control" placeholder="Weight" value="<%=Integer.toString(ppweight)%>">
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Length(cm)</label>
                                <input type="text" name="p_length" id="p_length" class="form-control" placeholder="Length" value="<%=Integer.toString(pplength)%>">
                            </div>                            
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label class="labels">Width(cm)</label>
                                <input type="text" name="p_width" id="p_width" class="form-control" placeholder="Width" value="<%=Integer.toString(ppwidth)%>">
                            </div>
                            <div class="col-md-6">
                                <label class="labels">Height(cm)</label>
                                <input type="text" name="p_height" id="p_height" class="form-control" placeholder="Height" value="<%=Integer.toString(ppheight)%>">
                            </div>
                        </div><br>
                        <a href="admin_parcel_view_contents.jsp?pa_id=<%=pa_id%>">View Parcel Contents</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script type='text/javascript'></script>
</body>
</html>