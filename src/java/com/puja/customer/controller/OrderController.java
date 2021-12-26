/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.controller;

import com.puja.customer.dao.DB;
import com.puja.customer.dao.FeedbackDao;
import com.puja.customer.dao.ParcelCancelDao;
import com.puja.customer.dao.ParcelDao;
import com.puja.customer.dao.RecipientDao;
import com.puja.customer.dao.SettingDao;
import com.puja.customer.models.Feedback;
import com.puja.customer.models.Parcel;
import com.puja.customer.models.ParcelCancel;
import com.puja.customer.models.Reciepient;
import com.puja.customer.utils.Constants;
import com.puja.customer.utils.CustomerUtil;
import com.puja.customer.utils.Transport;
import com.puja.customer.utils.Delivery;
import com.puja.customer.utils.ParcelUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderController extends HttpServlet {

   
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        String path = request.getRequestURI().substring(request.getContextPath().length());
       
        if(path.contains("create")){
            createOrder(request, response);
        }else if(path.contains("show")){
            showOrder(request, response);
        }else if(path.contains("feedback")){
            feedbackOrder(request, response);
        }
        else{
            allOrder(request, response);
        }
    }
    
    private void feedbackOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.getRequestDispatcher(CustomerUtil.getJsp("feedback")).forward(request, response);
        
    }
    
    private void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        ParcelDao parcelDao = new ParcelDao(DB.getConnection());
        Parcel parcel = parcelDao.getParcel(id);
        request.setAttribute("parcel", parcel);
        request.getRequestDispatcher(CustomerUtil.getJsp("show_parcel")).forward(request, response);
        
    }
    
    private void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RecipientDao recipientDao = new RecipientDao(DB.getConnection());
        
        request.getRequestDispatcher(CustomerUtil.getJsp("place_order")).forward(request, response);
    }
    
    private void allOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ParcelDao parcelDao = new ParcelDao(DB.getConnection());
        request.setAttribute("parcels", parcelDao.getAllParcel());
        System.out.println("com.puja.customer.controller.OrderController.allOrder()"+parcelDao.getAllParcel());
        request.getRequestDispatcher(CustomerUtil.getJsp("orders")).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI().substring(request.getContextPath().length());
        if(path.contains("create")){
            String c_id = request.getParameter("c_id");
            String sender_name = request.getParameter("sender_name");
            String sender_mobile = request.getParameter("sender_mobile");
            String sender_email = request.getParameter("sender_email");
            String sender_address = request.getParameter("sender_address");
            String payment_mode = request.getParameter("payment_mode");
            String r_name = request.getParameter("r_name");
            String r_phone = request.getParameter("r_phone");
            String r_address = request.getParameter("r_address");
            String r_pin = request.getParameter("r_pin");
            String r_state = request.getParameter("r_state");
            String r_district = request.getParameter("r_district");
            String r_city = request.getParameter("r_city");
            String p_details = request.getParameter("p_details");
            String p_no_of_item = request.getParameter("p_no_of_item");
            String p_location = request.getParameter("p_location");
            String p_weight = request.getParameter("p_weight");
            String p_length = request.getParameter("p_length");
            String p_width = request.getParameter("p_width");
            String p_height = request.getParameter("p_height");
            String submit = request.getParameter("submit");
            ParcelDao parcelDao = new ParcelDao(DB.getConnection());
            ParcelUtil parcelUtil = CustomerUtil.parcelKeys(parcelDao.getLastParcel());
            RecipientDao recipientDao = new RecipientDao(DB.getConnection());
            Reciepient reciepient = recipientDao.getReciepient();
            String r_id = CustomerUtil.recepientId(reciepient);
            recipientDao.register(r_id, r_name, r_state, r_district, r_city, r_pin, r_address, r_phone);
            Delivery delivery = CustomerUtil.getParcelCost(Integer.parseInt(p_weight));
            double deliveryCost = delivery.getDelivery();
            int parcelCost = (int)delivery.getParcel();
            int totalCost = (int)(deliveryCost + parcelCost);
            int delivery_cost = (int)deliveryCost;
            parcelDao.insert(parcelUtil.getP_id(), parcelUtil.getP_consignment_no(), c_id, sender_address, r_id, CustomerUtil.getCurrentDate(), parcelCost, 0,totalCost , delivery_cost, payment_mode, parcelUtil.getP_receipt_no());
            parcelDao.insertParcelItem(parcelUtil.getP_id(), p_details, Integer.parseInt(p_no_of_item), "placed", p_location, Integer.parseInt(p_weight), Integer.parseInt(p_length), Integer.parseInt(p_width), Integer.parseInt(p_height));
            HttpSession regSession = request.getSession();
            if(payment_mode.equalsIgnoreCase("online")){
                response.sendRedirect(Constants.orderPayment+parcelUtil.getP_id());
            }
            else{
                regSession.setAttribute("success", "Parcel order successfully");
                response.sendRedirect(Constants.orderShow+parcelUtil.getP_id()); 
            }
        
            
//            String sender_name = request.getParameter("sender_name");
//            String sender_mobile = request.getParameter("sender_mobile");
//            String sender_email = request.getParameter("sender_email");
//            
//            String sender_address = request.getParameter("sender_address");
//            String payment_mode = request.getParameter("payment_mode");
//            String reciepient_name = request.getParameter("reciepient_name");
//            String reciepient_mobile = request.getParameter("reciepient_mobile");
//            
//            String reciepient_address = request.getParameter("reciepient_address");
//            String weight[] = request.getParameterValues("weight[]");
//            String length[] = request.getParameterValues("length[]");
//            String width[] = request.getParameterValues("width[]");
//            String height[] = request.getParameterValues("height[]");
//            double distance = Double.parseDouble(request.getParameter("distance").toString());
//            String customer_id = request.getParameter("customer_id");
//            if(weight.length>0){
//                ParcelDao parcelDao = new ParcelDao(DB.getConnection());
//                String parcel_id = CustomerUtil.getKey();
//                SettingDao settingdao = new SettingDao(DB.getConnection());
//                
//                HttpSession regSession = request.getSession();
//                double[] weights = new double[weight.length];
//                for (int i = 0; i<weight.length; i++) weights[i] = Double.valueOf(weight[i]);
//                Transport transport = CustomerUtil.getTransportCost(distance);
//                Delivery delivery = CustomerUtil.getParcelCost(weights);
//                double deliveryCost = delivery.getDelivery();
//                Double transportCost = transport.getCost();
//                Double parcelCost = delivery.getParcel();
//                String mode = transport.getMode();
//                if(parcelDao.insert(customer_id, sender_name,sender_mobile,sender_email,sender_address,reciepient_name, reciepient_mobile,reciepient_address,  CustomerUtil.getCurrentDateTime(), transportCost, parcelCost, deliveryCost, payment_mode, parcel_id,mode)){
//                    for(int i=0;i<weight.length;i++){
//                        double weight1 = Double.parseDouble(weight[i].toString());
//                        double length1 = Double.parseDouble(length[i].toString());
//                        double height1 = Double.parseDouble(height[i].toString());
//                        double width1 = Double.parseDouble(width[i].toString());
//                        System.out.println("com.puja.customer.controller.OrderController.doPost()"+weight1);
//        
//                        parcelDao.insertParcelItem(parcel_id,weight1,length1 ,height1 ,width1 );
//                    }
//                    
//                    if(payment_mode.equalsIgnoreCase("online")){
//                        response.sendRedirect(Constants.orderPayment+parcel_id);
//                    }
//                    else{
//                        regSession.setAttribute("success", "Parcel order successfully");
//                        response.sendRedirect(Constants.orderShow+parcel_id); 
//                    }
//                }else{
//                    regSession.setAttribute("error", "Something went wrong");
//                    response.sendRedirect(Constants.orderCreate); 
//                }
//            }
            
        }else if(path.contains("cancel")){
            String parcel_id = request.getParameter("parcel_id");
            String reason = request.getParameter("reason");
            String c_id = request.getParameter("c_id");
            String pc_isrefund = "No";
            ParcelCancelDao parcelCancelDao = new ParcelCancelDao(DB.getConnection());
            ParcelCancel parcelCancel = new ParcelCancel();
            parcelCancel.setC_id(c_id);
            parcelCancel.setP_id(parcel_id);
            parcelCancel.setPc_isrefund(pc_isrefund);
            parcelCancel.setPc_reason(reason);
            HttpSession regSession = request.getSession();
            String customer_id = (String)regSession.getAttribute("user_id");
            if(parcelCancelDao.insert(parcelCancel)){
                regSession.setAttribute("success", "Parcel cancelled successfully");
                response.sendRedirect(Constants.orders); 
            }else{
                    regSession.setAttribute("error", "Something went wrong");
                    response.sendRedirect(Constants.orderShow+parcel_id); 
            }
        }else if(path.contains("feedback")){
            String parcel_id = request.getParameter("parcel_id");
            String feedback_message = request.getParameter("feedback");
            String rating = request.getParameter("rating");
            String customer_id = request.getParameter("customer_id");
            Feedback feedback = new Feedback();
            feedback.setF_id(CustomerUtil.feedbackId());
            feedback.setF_rating(Integer.parseInt(rating));
            feedback.setC_id(customer_id);
            feedback.setF_feedback(feedback_message);
            FeedbackDao feedbackDao = new FeedbackDao(DB.getConnection());
            HttpSession regSession = request.getSession();
            if(feedbackDao.insert(feedback))
            {
                regSession.setAttribute("success", "Thank you for giving your important feedback!");
                response.sendRedirect(Constants.orders); 
            }else{
                regSession.setAttribute("error", "Something went wrong");
                response.sendRedirect(Constants.orderFeedback+parcel_id); 
            }
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
