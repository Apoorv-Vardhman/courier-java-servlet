/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.models;

public class ParcelCancel {
    private String p_id;
    private String c_id;
    private String pc_reason;
    private String pc_isrefund;

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getPc_reason() {
        return pc_reason;
    }

    public void setPc_reason(String pc_reason) {
        this.pc_reason = pc_reason;
    }

    public String getPc_isrefund() {
        return pc_isrefund;
    }

    public void setPc_isrefund(String pc_isrefund) {
        this.pc_isrefund = pc_isrefund;
    }
    
    
}
