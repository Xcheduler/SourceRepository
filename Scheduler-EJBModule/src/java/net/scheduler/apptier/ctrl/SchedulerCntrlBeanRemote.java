/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.scheduler.apptier.ctrl;

import com.scheduler.forms.CustomerForm;
import com.scheduler.forms.ProfileForm;
import com.scheduler.forms.ServiceForm;
import com.scheduler.forms.StaffForm;
import com.scheduler.vo.CalendarVO;
import com.scheduler.vo.EventVo;
import com.scheduler.vo.LoginVO;
import com.scheduler.vo.RegistrationVO;
import java.rmi.RemoteException;
import javax.ejb.Remote;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

@Remote
public interface SchedulerCntrlBeanRemote {

    public List<LoginVO> getUserDetails(String loginname, String password) throws RemoteException;

    public String insertUserDetails(RegistrationVO registrationvo) throws RemoteException;

    public boolean insertCustomer(CustomerForm form) throws RemoteException;

    public ArrayList getCustomerList(String userID) throws RemoteException;

    public boolean getCustomerInfo(int custId) throws RemoteException;

    public boolean updateCustomerInfo(int custId, CustomerForm customerForm) throws RemoteException;

    public boolean deleteCustomer(int custId) throws RemoteException;

    public boolean insertStaff1(StaffForm form) throws RemoteException;

    public Hashtable getStaffList(String userID) throws RemoteException;

    public Hashtable getStaffInfo(int custId) throws RemoteException;

    public boolean updateStaffInfo(int staffId, StaffForm staffForm) throws RemoteException;

    public boolean deleteStaff(int staffId) throws RemoteException;

    public boolean updateServiceInfo(int serviceId, ServiceForm serviceForm) throws RemoteException;

    public boolean deleteService(int serviceId) throws RemoteException;

    public boolean addEvent(CalendarVO calForm) throws RemoteException;

    public boolean updateEvent(Long userID, CalendarVO calForm) throws RemoteException;

    public boolean deleteEvent(Long eventID) throws RemoteException;

    public boolean updateProfile(List<ProfileForm> pList) throws RemoteException;

    public List<ProfileForm> getProfileList(String userID) throws RemoteException;

    public ArrayList getServiceList(String userID) throws RemoteException;

    public boolean insertService(ServiceForm form) throws RemoteException;

    public String forgotPassword(String email) throws RemoteException;

    public String resetPassword(String email, String password) throws RemoteException;

    public boolean checkEmailExist(String email) throws RemoteException;

    public ArrayList selectEvent(String userUniqId) throws RemoteException;

}
