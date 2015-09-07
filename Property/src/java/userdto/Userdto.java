/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package userdto;

import java.util.ArrayList;

/**
 *
 * @author MISHRA
 */
public class Userdto 
{
    private int id;
    private String name;
    private String gender;
    private String mail;
    private String pwd;
    private String contact;
    private String state;
    private String city;
    private int status;
    private String pic;
    private String authcode;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getMail() {
        return mail;
    }

    public String getPwd() {
        return pwd;
    }

    public String getContact() {
        return contact;
    }

    public String getState() {
        return state;
    }

    public String getCity() {
        return city;
    }

    public int getStatus() {
        return status;
    }

    public String getPic() {
        return pic;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getAuthcode() {
        return authcode;
    }

    public void setAuthcode(String authcode) {
        this.authcode = authcode;
    }

}
