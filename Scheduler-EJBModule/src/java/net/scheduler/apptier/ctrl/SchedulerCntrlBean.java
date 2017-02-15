/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.scheduler.apptier.ctrl;

import com.scheduler.forms.CustomerForm;
import com.scheduler.forms.ProfileForm;
import com.scheduler.forms.ServiceForm;
import com.scheduler.forms.StaffForm;
import com.scheduler.mail.Mail;
import java.rmi.RemoteException;
import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.ejb.SessionContext;
import com.scheduler.utils.JDBCServiceLocatorFactory;
import com.scheduler.vo.CalendarVO;
import com.scheduler.vo.LoginVO;
import com.scheduler.vo.RegistrationVO;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import com.schedular.commonutils.RandomPasswordGenerator;
import com.scheduler.aes.SchedulerAES;
import com.scheduler.mail.emailWithHTMLTemplate;
import com.scheduler.vo.EventDetailVo;
import com.scheduler.vo.EventVo;
import java.util.Hashtable;

@Stateless(name = "SchedulerCntrlBean")
@Remote(SchedulerCntrlBeanRemote.class)
public class SchedulerCntrlBean implements SchedulerCntrlBeanRemote {

    @Resource
    private SessionContext context;
    protected static final String strUserPwdQRY = "select name from SEHEDULER_LOGIN_PROFILE name=?";
//user_id, user_name, email, password, active, last_login

    @Override
    public List<LoginVO> getUserDetails(String username, String password) throws RemoteException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<LoginVO> loginList = new ArrayList<LoginVO>();
        LoginVO loginVO = new LoginVO();
        String query = "select email,password,user_name,user_id1,is_trial_price,pricing_alert_on,DATEDIFF(expiry_date,Sysdate()) as days,show_alert,showed_alert_date,expiry_date from SEHEDULER_LOGIN_PROFILE where email=?";
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            //ps.setString(2, password);
            System.out.println("username " + username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String passEncript = com.scheduler.aes.SchedulerAES.decrypt(rs.getString("password"));
                System.out.println("===Real Pass==>" + passEncript);
                System.out.println("===User Pass==>" + password);
                if (passEncript.equals(password)) {
                    loginVO.setEmail(rs.getString("email"));
                    loginVO.setUserName(rs.getString("user_name"));
                    loginVO.setUserID(rs.getString("user_id1"));
                    loginVO.setExpiryDate(rs.getString("expiry_date"));
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = new Date();
                    String newDate = sdf.format(date);
                    System.out.println("===========>>" + loginVO.getEmail());
                    System.out.println("===========>>" + loginVO.getUserName());
                    System.out.println("===========>>" + loginVO.getUserID());
                    System.out.println("====price=======>>" + rs.getString("is_trial_price"));
                    System.out.println("====date=======>>" + rs.getString("pricing_alert_on"));
                    System.out.println("====current date=======>>" + newDate);
                    System.out.println("====showed alertdate =======>>" + rs.getString("showed_alert_date"));
                    /*if(rs.getString("is_trial_price").equalsIgnoreCase("Y") && rs.getString("show_alert").equalsIgnoreCase("N") && !newDate.equalsIgnoreCase(rs.getString("showed_alert_date"))){
                     System.out.println("====process 1 =======>>");
                     loginVO.setIsPricing("Y");
                     String queryUpdate = "Update SEHEDULER_LOGIN_PROFILE set show_alert='Y',showed_alert_date=sysdate() where email='"+loginVO.getEmail()+"'";
                     ps = con.prepareStatement(queryUpdate);                        
                     int chk=ps.executeUpdate();
                     if(chk>0){
                     System.out.println("===  daily once Y==");
                     }
                     }*/
                    if (rs.getString("is_trial_price").equalsIgnoreCase("Y") && rs.getString("show_alert").equalsIgnoreCase("N") && Integer.parseInt(rs.getString("days")) <= 10 && !newDate.equalsIgnoreCase(rs.getString("showed_alert_date"))) {
                        System.out.println("====process 2 =======>>");
                        loginVO.setIsPricing("Y");
                        String queryUpdate = "Update SEHEDULER_LOGIN_PROFILE set show_alert='Y',showed_alert_date=sysdate() where email='" + loginVO.getEmail() + "'";
                        ps = con.prepareStatement(queryUpdate);
                        int chk = ps.executeUpdate();
                        if (chk > 0) {
                            System.out.println("=== <10 Alert Updated Y==");
                        }
                    } else if (rs.getString("is_trial_price").equalsIgnoreCase("Y") && rs.getString("show_alert").equalsIgnoreCase("N") && newDate.equalsIgnoreCase(rs.getString("pricing_alert_on")) && !newDate.equalsIgnoreCase(rs.getString("showed_alert_date"))) {
                        System.out.println("====process 2 =======>>");
                        loginVO.setIsPricing("Y");
                        String queryUpdate = "Update SEHEDULER_LOGIN_PROFILE set pricing_alert_on=DATE_ADD(sysdate(),INTERVAL 7 DAY),show_alert='Y',showed_alert_date=sysdate() where email='" + loginVO.getEmail() + "'";
                        ps = con.prepareStatement(queryUpdate);

                        int chk = ps.executeUpdate();
                        if (chk > 0) {
                            System.out.println("===Date Added 7 days==");
                        }

                    } else {
                        loginVO.setIsPricing("N");
                    }

                    /*else{
                     loginVO.setIsPricing("N");
                     String queryUpdate = "Update SEHEDULER_LOGIN_PROFILE set show_alert='Y' where email='"+loginVO.getEmail()+"'";
                     ps = con.prepareStatement(queryUpdate);                        
                     int chk=ps.executeUpdate();
                     if(chk>0){
                     System.out.println("=== <10 Alert Updated Y==");
                     }
                     }*/
                    //
                    //loginVO.setIsPricing(rs.getString("user_name"));
                    //String userEncript=com.scheduler.aes.SchedulerAES.encrypt(rs.getString("user_id1"));
                    loginList.add(loginVO);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return loginList;
    }

    public String insertUserDetails(RegistrationVO registrationvo) {
        Connection con = null;
        PreparedStatement ps = null;

        ResultSet rs = null;
        String name = "";
        String email = "";
        String password = "";
        String companyName = "";
        int rows = 0;
        int rows1 = 0;
        // System.out.println("====>>password" + email);
        String user_id = "";

        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();

            String pass = registrationvo.getPassword();
            System.out.println("Original Pass====>>>" + pass);
            String passEncript = com.scheduler.aes.SchedulerAES.encrypt(pass);
            System.out.println("Original Pass====>>>" + passEncript);
            String userIdGen = "select user_id from useridgen";
            ps = con.prepareStatement(userIdGen);
            rs = ps.executeQuery();
            String autoGen = "";
            String newautoGen = "";
            if (rs.next()) {
                autoGen = rs.getString("user_id");
                System.out.println("===Auto==" + autoGen);
                SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy");
                Date date = new Date();
                newautoGen = autoGen + sdf.format(date);
            }

            ps = con.prepareStatement("insert into SEHEDULER_LOGIN_PROFILE(user_id,user_name,email,password,user_id1,company_name,active,last_login,is_trial_price,pricing_alert_on,expiry_date,show_alert,showed_alert_date) values(default,?,?,?,?,?,'Y',sysdate(),'Y',DATE_ADD(sysdate(),INTERVAL 7 DAY),DATE_ADD(sysdate(),INTERVAL 30 DAY),'Y',sysdate())");
            ps.setString(1, registrationvo.getUserName());
            ps.setString(2, registrationvo.getEmail());
            ps.setString(3, passEncript);
            ps.setString(4, newautoGen);
            ps.setString(5, registrationvo.getCompanyName());
            rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("==Profile Created==>");
                String insertProfileCompany = "Insert into SEHEDULER_PROFILE_COMPANY (PROFILE_COMPANY_REFID,USER_ID1,COMPANY_NAME,EMAIL) values (default,?,?,?)";
                ps = con.prepareStatement(insertProfileCompany);
                //user_id = rs.getString("user_id1");
                //String userEncript=com.scheduler.aes.SchedulerAES.encrypt(user_id);
                //ps.setString(1, userEncript);
                ps.setString(1, newautoGen);
                ps.setString(2, registrationvo.getCompanyName());
                ps.setString(3, registrationvo.getEmail());
                rows1 = ps.executeUpdate();
                if (rows1 > 0) {
                    System.out.println("==>Profile Company Saved==");
                    user_id = newautoGen;
                    int autoId = Integer.parseInt(autoGen) + 1;
                    String upadteAutogen = "update useridgen set user_id='" + String.valueOf(autoId) + "'";
                    ps = con.prepareStatement(upadteAutogen);
                    int rows2 = ps.executeUpdate();
                    if (rows2 > 0) {
                        System.out.print("====Auto Gen Updated===");
                        Mail mail = new Mail();
                        List<String> mailList = new ArrayList<String>();
                        mailList.add(registrationvo.getEmail());
                        String subject = "GREETINGS FROM XCHEDULER";
                        String body = "Hello " + registrationvo.getUserName() + ",\n\nCongratulations!!! \n\nYour account has been created successfully and is ready to use"
                                + "\n\nPlease log-in https:localhost:8070/scheduler/ \n\nUsername : " + registrationvo.getEmail() + " \n\nPassword : " + registrationvo.getPassword();
                        mail.sendMail(mailList, subject, body);
                    }
                }
            }

            System.out.println("====>>USER ID=>" + user_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return user_id;
    }

    public boolean insertCustomer(CustomerForm customerForm) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = "";
        String email = "";
        String password = "";
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("insert into SEHEDULER_CUSTOMERS(CUSTOMER_ID,USER_ID1,CUSTOMER_NAME,CUSTOMER_EMAIL,CUSTOMER_MOBILE) values(default,?,?,?,?)");
            ps.setString(1, customerForm.getUserID());
            ps.setString(2, customerForm.getCustomerName());
            ps.setString(3, customerForm.getcustomerEmail());
            ps.setString(4, customerForm.getcustomerMobile());
            rows = ps.executeUpdate();
            if (rows > 0) {
                flag = true;
            }
            // return flag;
            System.out.println("====>>flag " + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public ArrayList getCustomerList(String userID) {
        ArrayList customerList = new ArrayList();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int customerID;
        try {
            System.out.print("====uUser ID--->>" + userID);
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("select CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_EMAIL,CUSTOMER_MOBILE from SEHEDULER_CUSTOMERS where USER_ID1=?");
            ps.setString(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                customerID = rs.getInt("CUSTOMER_ID");
                Properties props = new Properties();
                props.put("CUSTOMER_ID", customerID);
                props.put("CUSTOMER_NAME", rs.getString("CUSTOMER_NAME"));
                props.put("CUSTOMER_EMAIL", rs.getString("CUSTOMER_EMAIL"));
                props.put("CUSTOMER_MOBILE", rs.getString("CUSTOMER_MOBILE"));
                customerList.add(props);
            }

            // return flag;
            System.out.println("====>>flag" + customerList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return customerList;
    }

    public boolean getCustomerInfo(int custId) {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("select CUSTOMER_ID,CUSTOMER_EMAIL,CUSTOMER_NAME,CUSTOMER_MOBILE from SEHEDULER_CUSTOMERS where CUSTOMER_ID=?");
            ps.setInt(1, custId);
            rs = ps.executeQuery();
            if (rs.next()) {
                CustomerForm cusForm = new CustomerForm();
                cusForm.setCustomerEmail(rs.getString("CUSTOMER_EMAIL"));
                cusForm.setCustomerName(rs.getString("CUSTOMER_NAME"));
                cusForm.setCustomerMobile(rs.getString("CUSTOMER_MOBILE"));
                cusForm.setCustomerID(rs.getInt("CUSTOMER_ID"));
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }

    public boolean updateCustomerInfo(int custId, CustomerForm customerForm) {
        System.out.println("Hi How Uuuuuuu");
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        //ResultSet rs = null;
        //String name="";
        //String email="";
        //String password = "";
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("update SEHEDULER_CUSTOMERS set CUSTOMER_NAME=?,CUSTOMER_EMAIL=?,CUSTOMER_MOBILE=? where CUSTOMER_ID=" + custId);
            // ps.setInt(1, customerForm.getUserID());
            ps.setString(1, customerForm.getCustomerName());
            ps.setString(2, customerForm.getcustomerEmail());
            ps.setString(3, customerForm.getcustomerMobile());
            flag = ps.execute();
            //if(rows>0)
            //  flag=true;
            // return flag;
            System.out.println("====>>flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public boolean deleteCustomer(int custId) {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("delete from SEHEDULER_CUSTOMERS where CUSTOMER_ID=" + custId);
            status = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }

    public boolean insertStaff1(StaffForm staffForm) {
        System.out.println("i m in insertstafffff");
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = "";
        String email = "";
        String password = "";
        System.out.println("Nmaee" + staffForm.getStaffName());
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("insert into SEHEDULER_STAFFS(USER_ID1,STAFF_ID,STAFF_NAME,STAFF_EMAIL,STAFF_MOBILE,STAFF_ROLE) values(?,default,?,?,?,?)");
            ps.setString(1, staffForm.getUserID());
            ps.setString(2, staffForm.getStaffName());
            ps.setString(3, staffForm.getStaffEmail());
            ps.setString(4, staffForm.getStaffMobile());
            ps.setString(5, staffForm.getStaffRole());
            rows = ps.executeUpdate();
            if (rows > 0) {
                flag = true;
                Mail mail = new Mail();
                List<String> mailList = new ArrayList<String>();
                mailList.add(staffForm.getStaffEmail());
                String subject = "GREETINGS FROM XCHEDULER FOR STAFF";
                String body = "Hello " + staffForm.getStaffName() + ",\n\nCongratulations!!! \n\nYou have created as a Staff member"
                        + "\n\nPlease log-in https:localhost:8070/scheduler/ \n\nUsername : " + staffForm.getStaffEmail() + " \n\nPassword : ";
              //  mail.sendMail(mailList, subject, body);

                //Insert the staff service list into mapping table
                ps = con.prepareStatement("select STAFF_ID from SEHEDULER_STAFFS where USER_ID1=? order by STAFF_ID desc LIMIT 1");
                //ps = con.prepareStatement("insert into SEHEDULER_STAFF_SERVICE_MAPPER(USER_ID1,STAFF_ID,SERVICE_ID) values(?,?,?)");
                ps.setString(1, staffForm.getUserID());
                rs = ps.executeQuery();
                if (rs.next()) {

                    Long staffId = rs.getLong("STAFF_ID");
                    if (staffId != null) {
                        List serviceList = staffForm.getStaffServiceIDList();
                        System.out.println("serviceList==>" + serviceList);
                        for (int i = 0; i < serviceList.size(); i++) {
                            ps = con.prepareStatement("insert into SEHEDULER_STAFF_SERVICE_MAPPER(USER_ID1,STAFF_ID,SERVICE_ID) values(?,?,?)");
                            ps.setString(1, staffForm.getUserID());
                            ps.setLong(2, staffId);
                            ps.setLong(3, Long.parseLong(serviceList.get(i).toString()));
                            int staffServiceAdd = ps.executeUpdate();
                            System.out.println(">>>>>>>dsdsdsssdsd>>>>>>" + staffServiceAdd);
                        }
                    }

                }

            }
            // return flag;
            System.out.println("====>>flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public Hashtable getStaffList(String userID) throws RemoteException {
        System.out.println("=============>>>>getStaffList=========" + userID);
        ArrayList staffList = new ArrayList();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int staffID;
        Hashtable staffHash = new Hashtable();
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("select STAFF_ID,STAFF_NAME,STAFF_EMAIL,STAFF_MOBILE,STAFF_ROLE from SEHEDULER_STAFFS where USER_ID1=?");
            ps.setString(1, userID);

            rs = ps.executeQuery();

            while (rs.next()) {
                staffID = rs.getInt("STAFF_ID");
                System.out.println("STSFFFFSS==?" + staffID);
                Properties props = new Properties();
                props.put("STAFF_ID", staffID);
                System.out.println("========STAFF ID===>>" + staffID);
                props.put("STAFF_NAME", rs.getString("STAFF_NAME"));
                props.put("STAFF_EMAIL", rs.getString("STAFF_EMAIL"));
                props.put("STAFF_MOBILE", rs.getString("STAFF_MOBILE"));
                if (rs.getString("STAFF_ROLE") != null) {
                    props.put("STAFF_ROLE", rs.getString("STAFF_ROLE"));
                } else {
                    props.put("STAFF_ROLE", "");
                }
                staffList.add(props);
            }
            staffHash.put("staffList", staffList);
            //

            ps = con.prepareStatement("select distinct ser_id,service_name from SEHEDULER_SERVICE where user_id1=?");
            ps.setString(1, userID);

            rs = ps.executeQuery();
            Hashtable<Long, String> staffServiceHash = new Hashtable<Long, String>();
            while (rs.next()) {
                staffServiceHash.put(rs.getLong("ser_id"), rs.getString("service_name"));
            }
            staffHash.put("staffServiceHash", staffServiceHash);
            System.out.println("====>>staff in service " + staffHash);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return staffHash;
    }

    public Hashtable getStaffInfo(int staffId) {
        Hashtable hashStaffService = new Hashtable();

        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSet rsStaff = null;

        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("select STAFF_ID,STAFF_NAME,STAFF_EMAIL,STAFF_MOBILE,STAFF_ROLE from SEHEDULER_STAFFS where STAFF_ID=?");
            ps.setInt(1, staffId);
            rs = ps.executeQuery();
            if (rs.next()) {
                StaffForm staffForm = new StaffForm();
                staffForm.setStaffEmail(rs.getString("STAFF_EMAIL"));
                staffForm.setStaffName(rs.getString("STAFF_NAME"));
                staffForm.setStaffMobile(rs.getString("STAFF_MOBILE"));
                staffForm.setStaffID(rs.getInt("STAFF_ID"));
                staffForm.setStaffRole(rs.getString("STAFF_ROLE"));
                status = true;
                hashStaffService.put("Status", status);
                ps = con.prepareStatement("select distinct SERVICE_ID from SEHEDULER_STAFF_SERVICE_MAPPER inner join SEHEDULER_STAFFS on SEHEDULER_STAFF_SERVICE_MAPPER.STAFF_ID=SEHEDULER_STAFFS.STAFF_ID where SEHEDULER_STAFFS.STAFF_ID and SEHEDULER_STAFFS.USER_ID1='502727012017'");
                ps.setInt(1, staffId);
                rsStaff = ps.executeQuery();
                List<Long> serviceIDList = new ArrayList<Long>();
                while (rsStaff.next()) {
                    serviceIDList.add(rsStaff.getLong("SERVICE_ID"));
                }
                hashStaffService.put("StaffService", serviceIDList);
                System.out.println("===hashStaffService >>>>" + hashStaffService);
                //

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (rsStaff != null) {
                        rsStaff.close();
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return hashStaffService;
    }

    public boolean updateStaffInfo(int staffId, StaffForm staffForm) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        //ResultSet rs = null;
        //String name="";
        //String email="";
        //String password = "";
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("update SEHEDULER_STAFFS set STAFF_NAME=?,STAFF_EMAIL=?,STAFF_MOBILE=?,STAFF_ROLE=? where STAFF_ID=" + staffId);
            // ps.setInt(1, customerForm.getUserID());
            ps.setString(1, staffForm.getStaffName());
            ps.setString(2, staffForm.getStaffEmail());
            ps.setString(3, staffForm.getStaffMobile());
            ps.setString(4, staffForm.getStaffRole());
            flag = ps.execute();
            //if(rows>0)
            //  flag=true;
            // return flag;
            System.out.println("====>>flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public boolean deleteStaff(int staffId) {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("delete from SEHEDULER_STAFFS where STAFF_ID=" + staffId);
            status = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }

    //
    public boolean updateServiceInfo(int serviceId, ServiceForm servicForm) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        //ResultSet rs = null;
        //String name="";
        //String email="";
        //String password = "";

        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("update SEHEDULER_SERVICE set SERVICE_NAME=?,SERVICE_DESC=?,SERVICE_COST=?,SERVICE_HOUR=?,SERVICE_BUFFER=? where SER_ID=" + serviceId);
            // ps.setInt(1, customerForm.getUserID());
            ps.setString(1, servicForm.getServiceName());
            ps.setString(2, servicForm.getServiceDesc());
            ps.setDouble(3, servicForm.getServiceCost());
            ps.setInt(4, servicForm.getServiceHour());
            ps.setInt(5, servicForm.getServiceBuffer());
            rows = ps.executeUpdate();
            if (rows > 0) {
                flag = true;
            }
            // return flag;
            System.out.println("====>>serivice Update flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public boolean deleteService(int serviceId) {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        int rows = 0;
        try {
            System.out.println("Delete Service ID==>>" + serviceId);
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("delete from SEHEDULER_SERVICE where SER_ID=" + serviceId);
            rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }
            System.out.println("Delete Status==>>" + status);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }

    @Override
    public boolean addEvent(CalendarVO calForm) throws RemoteException {
        System.out.println("i m in adddEvenntttttt");
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        System.out.println(">>>>>>>>>>>>>>>cccccc>>>>>>>>" + calForm.getEventName());
        System.out.println(">>>>>>>>>>>>>>>cccccc>>>>>>>>" + calForm.getEventTime());
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("insert into SCHEDULER_CALENDAR(USER_ID,EVENT_ID,EVENT_NAME,EVENT_DESC,EVENT_TYPE,event_startDate,event_endDate,USER_ID1,CREATEDTIME,UPDATEDTIME) values(?,?,?,?,?,?,?,?,sysdate(),sysdate())");
            ps.setLong(1, calForm.getUserID());
            ps.setLong(2, calForm.getUserID());
            ps.setString(3, calForm.getEventName());
            ps.setString(4, calForm.getEventDesc());
            ps.setInt(5, calForm.getType());
            ps.setString(6, calForm.getEvent_startDate());
            ps.setString(7, calForm.getEvent_endDate());
             ps.setString(8, calForm.getUserUniqId());
            rows = ps.executeUpdate();
            if (rows > 0) {
                flag = true;
            }
            // return flag;
            System.out.println("====>>flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    @Override
    public ArrayList selectEvent(String userUniqId) throws RemoteException {
        System.out.println("i m in adddEvenntttttt");
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = null;
        ArrayList arr = new ArrayList();
        EventVo ev=new EventVo();
        int rows = 0;
        try {
            EventDetailVo calForm=null;
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            query = "select EVENT_NAME,event_startDate,event_endDate from SCHEDULER_CALENDAR where USER_ID1=?";
            ps = con.prepareStatement(query);
            ps.setString(1,userUniqId);
            rs = ps.executeQuery();
            while (rs.next()) {
                calForm=new EventDetailVo();
                calForm.setTitle(rs.getString("EVENT_NAME"));
                calForm.setStart(rs.getString("event_startDate"));
                calForm.setEnd(rs.getString("event_endDate"));
                arr.add(calForm);
            }
            ev.setEvents(arr);
            System.out.println("====>>arr" + arr.size());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return arr;
    }

    @Override
    public boolean deleteEvent(Long eventID) throws RemoteException {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("delete from SEHEDULER_CALENDAR where EVENT_ID=" + eventID);
            status = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }
//      public boolean checkdetails(String staffId)
//    {
//        System.out.println("Inside Method details-------------->>>>"+staffId);
//    return true;
//    }

    @Override
    public boolean updateEvent(Long userID, CalendarVO calForm) throws RemoteException {
        System.out.println("Hi How Uuuuuuu");
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        //ResultSet rs = null;
        //String name="";
        //String email="";
        //String password = "";
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("update SCHEDULER_CALENDAR set EVENT_NAME=?,EVENT_DESC=?,EVENT_TYPE=? ,EVENT_TIME=?,UPDATEDTIME=? where EVENT_ID=" + userID);
            // ps.setInt(1, customerForm.getUserID());
            ps.setString(1, calForm.getEventName());
            ps.setString(2, calForm.getEventDesc());
            ps.setInt(3, calForm.getType());
            ps.setLong(4, calForm.getEventTime());
            ps.setLong(5, System.currentTimeMillis());
            flag = ps.execute();
            //if(rows>0)
            //  flag=true;
            // return flag;
            System.out.println("====>>flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    @Override
    public boolean updateProfile(List<ProfileForm> pList) throws RemoteException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean flag = false;
        String updateProfile = "update SEHEDULER_PROFILE_COMPANY set "
                + " BOOKING_URL=?,COMPANY_NAME=?,COMPANY_LOGO=?"
                + ",EMAIL=?,PHONE=?,WEBSITE=?,CURRENCY=?,ADDRESS=?"
                + ",CITY=?,STATE=?,ZIP=?,ABOUT_YOU=?,FACEBOOK=?,TWITTER=? "
                + " where USER_ID1=? ";

        try {
            if (pList != null) {
                ProfileForm pForm = pList.get(0);
                if (pForm != null) {
                    con = JDBCServiceLocatorFactory.getSchedulerConnection();
                    ps = con.prepareStatement(updateProfile);
                    ps.setString(1, pForm.getBookingURL());
                    ps.setString(2, pForm.getCompanyName());
                    ps.setString(3, pForm.getCompanyLogo());
                    ps.setString(4, pForm.getEmail());
                    ps.setString(5, pForm.getPhone());
                    ps.setString(6, pForm.getWebsite());
                    ps.setString(7, pForm.getCurrency());
                    ps.setString(8, pForm.getAddress());
                    ps.setString(9, pForm.getCity());
                    ps.setString(10, pForm.getState());
                    ps.setString(11, pForm.getZip());
                    ps.setString(12, pForm.getAboutYou());
                    ps.setString(13, pForm.getFacebook());
                    ps.setString(14, pForm.getTwitter());
                    ps.setString(15, pForm.getUserId());
                    int rows = ps.executeUpdate();
                    if (rows > 0) {
                        flag = true;
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public List<ProfileForm> getProfileList(String userID) {
        System.out.println("Inside getprofile =====bean===>");
        ArrayList<ProfileForm> profileList = new ArrayList<ProfileForm>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        //  int customerID;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
//            ps = con.prepareStatement("select CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_EMAIL,CUSTOMER_MOBILE from seheduler_login_profile where USER_ID=?");
            ps = con.prepareStatement("select COMPANY_NAME,EMAIL,BOOKING_URL,PHONE,WEBSITE,CURRENCY,ADDRESS,"
                    + "CITY,STATE,ZIP,ABOUT_YOU,FACEBOOK,TWITTER from SEHEDULER_PROFILE_COMPANY where USER_ID1=?");

            ps.setString(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                //customerID = rs.getInt("CUSTOMER_ID");
                ProfileForm pForm = new ProfileForm();
                //props.se
                // props.put("CUSTOMER_ID", customerID);

                pForm.setCompanyName(rs.getString("COMPANY_NAME"));
                pForm.setEmail(rs.getString("EMAIL"));
                pForm.setBookingURL(rs.getString("BOOKING_URL"));
                pForm.setPhone(rs.getString("PHONE"));
                pForm.setWebsite(rs.getString("WEBSITE"));
                pForm.setCurrency(rs.getString("CURRENCY"));
                pForm.setAddress(rs.getString("ADDRESS"));
                pForm.setCity(rs.getString("CITY"));
                pForm.setState(rs.getString("STATE"));
                pForm.setZip(rs.getString("ZIP"));
                pForm.setAboutYou(rs.getString("ABOUT_YOU"));
                pForm.setFacebook(rs.getString("FACEBOOK"));
                pForm.setTwitter(rs.getString("TWITTER"));
                //  props.put("companyEmail", rs.getString("CITY"));

                profileList.add(pForm);
            }

            // return flag;
            System.out.println("====>>flag" + profileList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return profileList;
    }
//

    @Override
    public ArrayList getServiceList(String userID) {
        ArrayList serviceList = new ArrayList();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long customerID;
        try {
            System.out.print("====Server Service uUser ID--->>" + userID);
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("select SER_ID,SERVICE_NAME,SERVICE_DESC,SERVICE_COST,SERVICE_HOUR,SERVICE_BUFFER from SEHEDULER_SERVICE where USER_ID1=?");
            ps.setString(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                customerID = rs.getInt("SER_ID");
                Properties props = new Properties();
                props.put("SER_ID", customerID);
                props.put("SERVICE_NAME", rs.getString("SERVICE_NAME"));
                props.put("SERVICE_DESC", rs.getString("SERVICE_DESC"));
                props.put("SERVICE_COST", rs.getDouble("SERVICE_COST"));
                props.put("SERVICE_HOUR", rs.getInt("SERVICE_HOUR"));
                props.put("SERVICE_BUFFER", rs.getInt("SERVICE_BUFFER"));
                serviceList.add(props);
            }

            // return flag;
            System.out.println("====>>Service :list" + serviceList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return serviceList;
    }

    //
    @Override
    public boolean insertService(ServiceForm serviceForm) {
        System.out.println("==>>>insert Service<<<===");
        boolean flag = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        System.out.println("Service Name" + serviceForm.getServiceName());
        int rows = 0;
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("insert into SEHEDULER_SERVICE(SER_ID,USER_ID1,SERVICE_NAME,SERVICE_DESC,SERVICE_COST,SERVICE_HOUR,SERVICE_BUFFER) values(default,?,?,?,?,?,?)");
            ps.setString(1, serviceForm.getUserID());
            ps.setString(2, serviceForm.getServiceName());
            ps.setString(3, serviceForm.getServiceDesc());
            ps.setDouble(4, serviceForm.getServiceCost());
            ps.setInt(5, serviceForm.getServiceHour());
            ps.setInt(6, serviceForm.getServiceBuffer());
            rows = ps.executeUpdate();
            if (rows > 0) {
                flag = true;
            }
            // return flag;
            System.out.println("====>>flag" + flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public String forgotPassword(String email) throws RemoteException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String retval = "";
        System.out.println("email ---->in bean" + email);
        //List<LoginVO> loginList = new ArrayList<LoginVO>();
        //LoginVO loginVO = new LoginVO();
        String query = "select user_name from SEHEDULER_LOGIN_PROFILE where email=?";
        try {
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();
            int chk = 0;
            if (rs.next()) {
                chk = 1;
                /* String temppassword;
                 temppassword=new String(RandomPasswordGenerator.generatePswd());
                 if(temppassword.isEmpty()){
                
                 temppassword ="sehedul@123";
                 }
                 System.out.println("===Random Pass==> " + temppassword);
                 String encrytpass=SchedulerAES.encrypt(temppassword);
                 System.out.println("Encrpted password "+encrytpass);
                 ps = con.prepareStatement("update SEHEDULER_LOGIN_PROFILE set password=? where email=?");
                 ps.setString(1,encrytpass);
                 ps.setString(2,email);
                 int cnt=ps.executeUpdate();
                 System.out.println("DB count====> "+cnt);
                 if(cnt>0)
                 {
                    
                 System.out.print("====Auto Gen Updated===");
                 emailWithHTMLTemplate mail = new emailWithHTMLTemplate();
                 List<String> mailList = new ArrayList<String>();
                 mailList.add(email);
                 String subject = "Password Reset";
                 String user="User";
                 String body = "Hello " + user + ",\n\nCongratulations!!! \n\nYour account has been reset successfully and is ready to use"
                 + "\n\nPlease click this link http://localhost:8070/scheduler/ForgetPwd?reset="+temppassword;
                 mail.sendMailInJava(mailList, subject, body);
                        
                 */
            }
            if (chk > 0) {
                emailWithHTMLTemplate mail = new emailWithHTMLTemplate();
                List<String> mailList = new ArrayList<String>();
                mailList.add(email);
                String subject = "Password Reset";
                String user = "User";
                String body = "";
                mail.sendMailInJava(mailList, subject, body);
            } else {
                System.out.println("DB not updated====> ");
                retval = "invalid user";
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return retval;
    }

    @Override
    public boolean checkEmailExist(String email) throws RemoteException {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            System.out.println("Email---in backend----" + email);
            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement("select USER_ID from SEHEDULER_LOGIN_PROFILE where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }

    public String resetPassword(String email, String password) throws RemoteException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String retval = "";
        System.out.println("reset email ---->in " + email);
        //List<LoginVO> loginList = new ArrayList<LoginVO>();
        //LoginVO loginVO = new LoginVO();
        String query = "select user_name from SEHEDULER_LOGIN_PROFILE where email=?";
        try {

            con = JDBCServiceLocatorFactory.getSchedulerConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();

            if (rs.next()) {

                String encrytpass = SchedulerAES.encrypt(password);
                System.out.println("Encrpted password " + encrytpass);
                ps = con.prepareStatement("update SEHEDULER_LOGIN_PROFILE set password=? where email=?");
                ps.setString(1, encrytpass);
                ps.setString(2, email);
                int cnt = ps.executeUpdate();
                System.out.println("DB count====> " + cnt);
                if (cnt > 0) {
                    System.out.print("====Auto Reset Pwd Updated===");
                    retval = "success";
                } else {
                    System.out.println("DB not updated====> ");
                }
            } else {
                System.out.println("User not in Database");
                retval = "invalid user";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return retval;
    }

}
