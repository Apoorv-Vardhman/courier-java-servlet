<%-- 
    Document   : admin_profile_update
    Created on : 10 Oct, 2021, 8:49:35 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="commonutility.CommonUtility"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <title>CMS</title>
        <link rel="stylesheet" type="text/css" href="./profile_para/style_profile.css">

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--<meta http-equiv="X-UA-Compatible" content="ie=edge" />-->        

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
              crossorigin="anonymous">
    </head>
    <body>
        <%
            String uname = "";
            String ustate = "";
            String udistrict = "";
            String ucity = "";
            String uaddress = "";
            String upin = "";
            String uemail = "";
            String umob = "";
            String ugender = "";
            HttpSession ses = request.getSession();
            String uid = ses.getAttribute("u").toString();
            try {
                Connection con = CommonUtility.getCon();                
                PreparedStatement ps = con.prepareStatement("select * from admin where a_id=?");
                ps.setString(1, uid.toString());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    uname = rs.getString("a_name");
                    ustate = rs.getString("a_state");
                    udistrict = rs.getString("a_district");
                    ucity = rs.getString("a_city");
                    uaddress = rs.getString("a_address");
                    upin = rs.getString("a_pin");
                    uemail = rs.getString("a_email");
                    umob = rs.getString("a_mob");
                    ugender = rs.getString("a_gender");
                }
                ps.close();
                rs.close();                
                con.close();
            } catch (Exception e) {

            }
        %>
        <%
            Boolean flag = false;
            String SuccessMessage = "";
            String name = request.getParameter("aname");
            String state = request.getParameter("astate");
            String district = request.getParameter("adistrict");
            String city = request.getParameter("acity");
            String address = request.getParameter("aaddress");
            String pin = request.getParameter("apin");
            String mob = request.getParameter("amob");
            String gender = request.getParameter("agender");
            if (name != null && state != null && district != null && city != null && address != null && pin != null && mob != null && gender != null) {
                try {                    
                    if (request.getParameter("btnupdate") != null) {
                        Connection con = CommonUtility.getCon();                        
                        PreparedStatement ps = con.prepareStatement("update admin set a_name=?,a_state=?,a_district=?,a_city=?,a_address=?,a_pin=?,a_mob=?,a_gender=? where a_id=?");
                        ps.setString(1, name);
                        ps.setString(2, state);
                        ps.setString(3, district);
                        ps.setString(4, city);
                        ps.setString(5, address);
                        ps.setString(6, pin);
                        ps.setString(7, mob);
                        ps.setString(8, gender);
                        ps.setString(9, uid);
                        ps.executeUpdate();
                        ps.close();                        
                        con.close();
                        response.sendRedirect("admin_profile.jsp");
                    }

                } catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            }

        %>
        <header>
            <a href="#" class="logo">E-Courier</a>
            <ul>                
                <li><a href="admin_profile.jsp" class="active" style="margin-left: 970px;">Go Back</a></li>
            </ul>
        </header>
        <section>
            <img src="./images/stars.png" id="stars">
            <img src="./images/moon.png" id="moon">
            <img src="./images/mountains_behind.png" id="mountains_behind">
            <h2 id="text"><%=uname%></h2>
            <a href="#" id="btn" style="margin-left:450px;">Update Your Profile</a>            
            <img src="./images/mountains_front.png" id="mountains_front">
        </section>
        <div class="sec" id="sec">
            <!--<h2>Parallax Scrolling Effects</h2>
            <p>This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.Tt.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.<br><br>This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.<br><br></p>-->
            <form action="admin_profile_update.jsp" method="post" onsubmit="return checkpass();">                
                <div style="background-color:#61CACC; align:center;overflow:hidden;"><br>                    
                    <a href="admin_profile_pass.jsp" style="cursor: pointer;margin-left: 900px;color:black;background-color: pink;border-radius: 20px;" name="btnch">Update Your Password<i class="fas fa-user-shield mr-3 text-primary fa-fw"></i></a>
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                        
                        <label for="aname" class="col-sm-2 col-form-label">Name<span style="color:red;">*</span></label>                
                        <div class="col-sm-4">
                            <input type="text" name="aname" class="form-control" id="aname" value="<%=uname%>" maxlength="25" placeholder="Enter Name" required>
                        </div>
                        <label for="astate" class="col-sm-2 col-form-label">State<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <select name="astate" class="form-control">
                                <%
                                    if (ustate.equals("Bihar")) {
                                %>
                                <option value="Bihar" selected="selected">Bihar</option>
                                <%
                                } else {
                                %>
                                <option value="Bihar">Bihar</option>
                                <%
                                    }
                                    if (ustate.equals("Uttar Pradesh")) {
                                %>
                                <option value="Uttar Pradesh" selected="selected">Uttar Pradesh</option>
                                <%
                                } else {
                                %>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                <%
                                    }
                                    if (ustate.equals("Jharkhand")) {
                                %>        
                                <option value="Jharkhand" selected="selected">Jharkhand</option>
                                <%
                                } else {
                                %>
                                <option value="Jharkhand">Jharkhand</option>
                                <%
                                    }
                                    if (ustate.equals("Madhya Pradesh")) {
                                %>        
                                <option value="Madhya Pradesh" selected="selected">Madhya Pradesh</option>
                                <%
                                } else {
                                %>
                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                <%
                                    }
                                %>                        
                            </select>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                        <label for="adistrict" class="col-sm-2 col-form-label">District<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <select name="adistrict" class="form-control">
                                <%
                                    if (udistrict.equals("Bihar")) {
                                %>
                                <option value="Bihar" selected="selected">Bihar</option>
                                <%
                                } else {
                                %>
                                <option value="Bihar">Bihar</option>
                                <%
                                    }
                                    if (udistrict.equals("Uttar Pradesh")) {
                                %>
                                <option value="Uttar Pradesh" selected="selected">Uttar Pradesh</option>
                                <%
                                } else {
                                %>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                <%
                                    }
                                    if (udistrict.equals("Jharkhand")) {
                                %>        
                                <option value="Jharkhand" selected="selected">Jharkhand</option>
                                <%
                                } else {
                                %>
                                <option value="Jharkhand">Jharkhand</option>
                                <%
                                    }
                                    if (udistrict.equals("Madhya Pradesh")) {
                                %>        
                                <option value="Madhya Pradesh" selected="selected">Madhya Pradesh</option>
                                <%
                                } else {
                                %>
                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                <%
                                    }
                                %>                        
                            </select>
                        </div>
                        <label for="acity" class="col-sm-2 col-form-label">City<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <select name="acity" class="form-control">
                                <%
                                    if (ucity.equals("Bihar")) {
                                %>
                                <option value="Bihar" selected="selected">Bihar</option>
                                <%
                                } else {
                                %>
                                <option value="Bihar">Bihar</option>
                                <%
                                    }
                                    if (ucity.equals("Uttar Pradesh")) {
                                %>
                                <option value="Uttar Pradesh" selected="selected">Uttar Pradesh</option>
                                <%
                                } else {
                                %>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                <%
                                    }
                                    if (ucity.equals("Jharkhand")) {
                                %>        
                                <option value="Jharkhand" selected="selected">Jharkhand</option>
                                <%
                                } else {
                                %>
                                <option value="Jharkhand">Jharkhand</option>
                                <%
                                    }
                                    if (ucity.equals("Madhya Pradesh")) {
                                %>        
                                <option value="Madhya Pradesh" selected="selected">Madhya Pradesh</option>
                                <%
                                } else {
                                %>
                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                <%
                                    }
                                %>                        
                            </select>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                        <label for="aaddress" class="col-sm-2 col-form-label">Address<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="text" name="aaddress" class="form-control" id="aaddress" value="<%=uaddress%>" maxlength="100" placeholder="Enter Address" required>
                        </div>
                        <label for="apin" class="col-sm-2 col-form-label">Pin Code<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="text" name="apin" class="form-control" id="apin" value="<%=upin%>" maxlength="6" placeholder="Enter Pin Code" required>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                        <label for="aemail" class="col-sm-2 col-form-label">Email<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="text" name="aemail" class="form-control" id="aemail" value="<%=uemail%>" maxlength="50" placeholder="Enter Email" readonly="true">
                        </div>
                        <label for="amobile" class="col-sm-2 col-form-label">Mobile<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="text" name="amob" class="form-control" id="amob" value="<%=umob%>" maxlength="10" placeholder="Enter Mobile" required>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                        <label for="inputid1" class="col-sm-2 col-form-label">Gender<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <select name="agender" class="form-control">
                                <%
                                    if (ugender.equals("female")) {
                                %>
                                <option value="female" selected="selected">Female</option>
                                <%
                                } else {
                                %>
                                <option value="female">Female</option>
                                <%
                                    }
                                    if (ugender.equals("male")) {
                                %>
                                <option value="male" selected="selected">Male</option>
                                <%
                                } else {
                                %>
                                <option value="male">Male</option>
                                <%
                                    }
                                    if (ustate.equals("other")) {
                                %>        
                                <option value="other" selected="selected">Other</option>
                                <%
                                } else {
                                %>
                                <option value="other">Other</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <label for="arole" class="col-sm-2 col-form-label">Role<span style="color:red;">*</span></label>
                        <div class="col-sm-4">                        
                            <input type="text" name="arole" class="form-control" id="arole" value="Admin" maxlength="10" placeholder="Enter Role" readonly="true">
                        </div>
                    </div>                    
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-2 text-center">
                            <button type="submit" class="btn btn-danger" name="btnupdate">Update Profile</button>
                        </div><br>
                        <div class="col-sm-2 text-center">
                            <a href="admin_profile.jsp" class="btn btn-primary" name="btncancel">Cancel</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>        
    </body>
    <script>
        let stars = document.getElementById('stars');
        let moon = document.getElementById('moon');
        let mountains_behind = document.getElementById('mountains_behind');
        let text = document.getElementById('text');
        let btn = document.getElementById('btn');
        let mountains_front = document.getElementById('mountains_front');
        let header = document.querySelector('header');

        window.addEventListener('scroll', function () {
            let value = window.scrollY;
            stars.style.left = value + 0.25 + 'px';
            moon.style.top = value + 1.05 + 'px';
            mountains_behind.style.top = value + 0.5 + 'px';
            mountains_front.style.top = value + 0 + 'px';
            text.style.marginRight = value + 4 + 'px';
            text.style.marginTop = value + 1.5 + 'px';
            btn.style.marginTop = value + 1.5 + 'px';
            header.style.top = value + 0.5 + 'px';
        })

        function checkpass() {

        }
    </script>
</html>