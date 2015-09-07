/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package maildto;

/**
 *
 * @author MISHRA
 */
public class Maildto 
{
    private int id;
    private String to;
    private String from;
    private String subject;
    private String msg;
    private String maildate;

    public int getId() {
        return id;
    }

    public String getTo() {
        return to;
    }

    public String getFrom() {
        return from;
    }

    public String getSubject() {
        return subject;
    }

    public String getMsg() {
        return msg;
    }

    public String getMaildate() {
        return maildate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setMaildate(String maildate) {
        this.maildate = maildate;
    }
    
}
