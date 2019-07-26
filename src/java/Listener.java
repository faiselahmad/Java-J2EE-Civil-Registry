

import javax.servlet.*;  
import java.sql.*; 

public class Listener implements ServletContextListener
{  
	public void contextInitialized(ServletContextEvent event) 
	{  
		try
		{ 
                      Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/civilregistry","root","incapp");
                     
    ServletContext ctx=event.getServletContext();  
    ctx.setAttribute("dbCon", con); 
    Statement st=con.createStatement();
    ctx.setAttribute("stmt", st); 
    
    PreparedStatement checkEmailId=con.prepareStatement("select * from citizen where  email=?");   
 PreparedStatement insertUser=con.prepareStatement
 ("insert into citizen (name,fname,mname,gender,maritalstatus,email,phone,address,city,state,pincode,dob,photo,pass)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
 PreparedStatement checkUser=con.prepareStatement("select * from citizen where  email=? and pass=?");
 PreparedStatement getStatuswiseCitizenInfo=con.prepareStatement("select * from citizen where cid=? ");
 PreparedStatement getPic=con.prepareStatement("select photo from citizen where cid=?");
 PreparedStatement updateProfile=con.prepareStatement("update citizen set name=?,fname=?,mname=?,gender=? where cid=? ");
 
 PreparedStatement updatePI=con.prepareStatement("update citizen set dob=?,email=?,phone=?,maritalstatus=? where cid=? ");
 ctx.setAttribute("updatePI", updatePI);
 
 PreparedStatement updateAddress=con.prepareStatement("update citizen set address=?,city=?,state=?,pincode=? where cid=?");
 ctx.setAttribute("updateAddress", updateAddress);
 
 PreparedStatement updatePass=con.prepareStatement("update citizen set pass=? where cid=?  ");
 ctx.setAttribute("updatePass", updatePass);
 
 PreparedStatement ForgotPass=con.prepareStatement("update citizen set pass=? where email=?  ");
 ctx.setAttribute("ForgotPass", ForgotPass);
            
 PreparedStatement updatePic=con.prepareStatement("update citizen set photo=? where cid=? ");
 
 PreparedStatement checkDept=con.prepareStatement("select * from Staff where  eemail=? and edept=? and epass=?");
   ctx.setAttribute("checkDept", checkDept);
   
 
 
 PreparedStatement checkAadharUserCid=con.prepareStatement("select * from aadharcard where cid=?");
 PreparedStatement checkBirthCertificateNo=con.prepareStatement("select * from aadharcard where birthcertificateno=?");
 PreparedStatement insertAadharCardUser=con.prepareStatement
("insert into aadharcard(cid,aadharno,aadharstatus,idproof,idprooffilename,idproofno,10thmarksheet,10thmarksheetfilename,"
  + "10thmarksheetno,birthcertificate,birthcertificatefilename,birthcertificateno)values(?,?,?,?,?,?,?,?,?,?,?,?)");
 
  PreparedStatement updateAadharCardUser=con.prepareStatement
("update aadharcard set aadharstatus=?,idproof=?,idprooffilename=?,idproofno=?,10thmarksheet=?,10thmarksheetfilename=?,"
  + "10thmarksheetno=?,birthcertificate=?,birthcertificatefilename=?,birthcertificateno=? where cid=?");
 
 PreparedStatement getAadharCardStatus=con.prepareStatement("select * from aadharcard where aadharstatus=?");
 ctx.setAttribute("getAadharCardStatus", getAadharCardStatus);
 
 PreparedStatement getDocumentForAadharCard=con.prepareStatement("select * from aadharcard where cid=? ");
   ctx.setAttribute("getDocumentForAadharCard", getDocumentForAadharCard);
   
 PreparedStatement updateAadharStatus=con.prepareStatement("update aadharcard set aadharstatus=? where cid=? ");
 PreparedStatement getMaxAadharno=con.prepareStatement("select max(aadharno) from aadharcard"); 
 PreparedStatement updateAadharno=con.prepareStatement("update aadharcard set aadharno=?,aadharstatus=? where cid=? ");
 PreparedStatement getCitizenRecords=con.prepareStatement("select * from citizen ");

 //......................................................................................// 
  
 
 PreparedStatement checkVoterUserCid=con.prepareStatement("select * from votercard where cid=?");
 PreparedStatement changepass=con.prepareStatement("update citizen set pass=? where cid=? and pass=?");
 PreparedStatement getVoterCardStatus=con.prepareStatement("select * from votercard where voteridstatus=?");
 PreparedStatement getDocumentForVoterCard=con.prepareStatement("select * from votercard where cid=? ");
 PreparedStatement updateVotercardStatus=con.prepareStatement("update votercard set voteridstatus=? where cid=? ");

 PreparedStatement getMaxVoteridno=con.prepareStatement("select max(voteridno) from votercard"); 
 PreparedStatement updateVotercardno=con.prepareStatement("update votercard set voteridno=?,voteridstatus=? where cid=? ");
 PreparedStatement checkadhar=con.prepareStatement("select * from votercard where idproofno=?");
 PreparedStatement insertVoterIdCardUser=con.prepareStatement
("insert into votercard(cid,voteridno,voteridstatus,idproof,idprooffilename,idproofno,10thmarksheet,10thmarksheetfilename,"
  + "10thmarksheetno,birthcertificate,birthcertificatefilename,birthcertificateno)values(?,?,?,?,?,?,?,?,?,?,?,?)"); 
  PreparedStatement updateVoterCardUser=con.prepareStatement
("update votercard set voteridstatus=?,idproof=?,idprooffilename=?,idproofno=?,10thmarksheet=?,10thmarksheetfilename=?,"
  + "10thmarksheetno=?,birthcertificate=?,birthcertificatefilename=?,birthcertificateno=? where cid=?");
 
  
  
  //.....................for pancard..........................................................//
  PreparedStatement checkadharnoforpancard=con.prepareStatement("select * from pancard where idproofno=?");
  PreparedStatement checkPancardUserCid=con.prepareStatement("select * from pancard where cid=?");
  PreparedStatement updatePancardUser=con.prepareStatement
("update pancard set pancardstatus=?,idproof=?,idprooffilename=?,idproofno=?,10thmarksheet=?,10thmarksheetfilename=?,"
  + "10thmarksheetno=?,birthcertificate=?,birthcertificatefilename=?,birthcertificateno=? where cid=?");
 
   PreparedStatement insertPancardUser=con.prepareStatement
("insert into pancard(cid,pancardidno,pancardstatus,idproof,idprooffilename,idproofno,10thmarksheet,10thmarksheetfilename,"
  + "10thmarksheetno,birthcertificate,birthcertificatefilename,birthcertificateno)values(?,?,?,?,?,?,?,?,?,?,?,?)"); 
  
   PreparedStatement getPancardStatus=con.prepareStatement("select * from pancard where pancardstatus=?");
   PreparedStatement getDocumentForPancard=con.prepareStatement("select * from pancard where cid=? ");
   PreparedStatement updatePancardStatus=con.prepareStatement("update Pancard set pancardstatus=? where cid=? ");
   PreparedStatement updatePancardno=con.prepareStatement("update pancard set pancardidno=?,pancardstatus=? where cid=? ");
   PreparedStatement getMaxPancardidno=con.prepareStatement("select max(pancardidno) from pancard"); 
   
   
   //.....................finish..........................................................//
   
   
  //.....................for Passport..........................................................//
  PreparedStatement checkadharnoforPassport=con.prepareStatement("select * from passport where idproofno=?");
  PreparedStatement checkPassportUserCid=con.prepareStatement("select * from passport where cid=?");
  PreparedStatement updatePassportUser=con.prepareStatement
("update passport set passportstatus=?,idproof=?,idprooffilename=?,idproofno=?,10thmarksheet=?,10thmarksheetfilename=?,"
  + "10thmarksheetno=?,birthcertificate=?,birthcertificatefilename=?,birthcertificateno=? where cid=?");
 
   PreparedStatement insertPassportUser=con.prepareStatement
("insert into passport(cid,passportidno,passportstatus,idproof,idprooffilename,idproofno,10thmarksheet,10thmarksheetfilename,"
  + "10thmarksheetno,birthcertificate,birthcertificatefilename,birthcertificateno)values(?,?,?,?,?,?,?,?,?,?,?,?)"); 
  
   PreparedStatement getPassportStatus=con.prepareStatement("select * from passport where passportstatus=?");
   PreparedStatement getDocumentForPassport=con.prepareStatement("select * from passport where cid=? ");
   PreparedStatement updatePassportStatus=con.prepareStatement("update passport set passportstatus=? where cid=? ");
   PreparedStatement updatePassportno=con.prepareStatement("update passport set passportidno=?,passportstatus=? where cid=? ");
   PreparedStatement getMaxPassportidno=con.prepareStatement("select max(passportidno) from passport"); 
   
   
   //.....................finish..........................................................//
   
   
   
    //.....................for DrivingLicence..........................................................//
  PreparedStatement checkAdharnoForDL=con.prepareStatement("select * from drivinglicence where idproofno=?");
  PreparedStatement checkDLUserCid=con.prepareStatement("select * from drivinglicence where cid=?");
  PreparedStatement updateDLUser=con.prepareStatement
("update drivinglicence set drivinglicencestatus=?,idproof=?,idprooffilename=?,idproofno=?,10thmarksheet=?,10thmarksheetfilename=?,"
  + "10thmarksheetno=?,birthcertificate=?,birthcertificatefilename=?,birthcertificateno=? where cid=?");
 
   PreparedStatement insertDLUser=con.prepareStatement
("insert into drivinglicence(cid,drivinglicenceidno,drivinglicencestatus,idproof,idprooffilename,idproofno,10thmarksheet,10thmarksheetfilename,"
  + "10thmarksheetno,birthcertificate,birthcertificatefilename,birthcertificateno)values(?,?,?,?,?,?,?,?,?,?,?,?)"); 
  
   PreparedStatement getDLStatus=con.prepareStatement("select * from drivinglicence where drivinglicencestatus=?");
   PreparedStatement getDocumentForDL=con.prepareStatement("select * from drivinglicence where cid=? ");
   PreparedStatement updateDLStatus=con.prepareStatement("update drivinglicence set drivinglicencestatus=? where cid=? ");
   PreparedStatement updateDLIdno=con.prepareStatement("update drivinglicence set drivinglicenceidno=?,drivinglicencestatus=? where cid=? ");
   PreparedStatement getMaxDLIdno=con.prepareStatement("select max(drivinglicenceidno) from drivinglicence"); 
   
   
   //.....................finish..........................................................//
   
   
   
   
   
 PreparedStatement deleteStaff=con.prepareStatement("delete from staff where sid=? ");
 PreparedStatement deleteCitizen=con.prepareStatement("delete from citizen where cid=? "); 
 
 PreparedStatement getSPic=con.prepareStatement("select ephoto from staff where eid=?");
 ctx.setAttribute("getSPic", getSPic);
 
 PreparedStatement updateSPic=con.prepareStatement("update staff set ephoto=? where eid=? ");
  ctx.setAttribute("updateSPic", updateSPic);
  
  PreparedStatement updateSPass=con.prepareStatement("update staff set epass=? where eid=?  ");
 ctx.setAttribute("updateSPass", updateSPass);
 
   //-----------------------------official-------------------------------------------------------------------------------//
   
 PreparedStatement checkAdmin=con.prepareStatement("select * from admin where  adminid=? and adminpassword=?");
   ctx.setAttribute("checkAdmin", checkAdmin);
 
 
   PreparedStatement Adminfo=con.prepareStatement("select * from admin where adminid=?");
   ctx.setAttribute("Adminfo", Adminfo);
   
   PreparedStatement adminUpdate=con.prepareStatement("update admin set adminname=?,aphone=?,agen=?,aemail=? where adminid=? ");
       ctx.setAttribute("adminUpdate", adminUpdate);

          PreparedStatement adminUpdatePass=con.prepareStatement("update admin set adminpassword=? where adminid=? ");
       ctx.setAttribute("adminUpdatePass", adminUpdatePass);
       
   PreparedStatement AdminGetPic=con.prepareStatement("select aphoto from admin where adminid=?");
   ctx.setAttribute("AdminGetPic", AdminGetPic);
   
    PreparedStatement adminUpdatePic=con.prepareStatement("update admin set aphoto=? where adminid=? ");
       ctx.setAttribute("adminUpdatePic", adminUpdatePic);
       
 PreparedStatement aadhar=con.prepareStatement
    ("select * from aadharcard inner join citizen on aadharcard.cid=citizen.cid where aadharstatus=?");
 ctx.setAttribute("aadhar", aadhar);
 
PreparedStatement voter=con.prepareStatement
    ("select * from votercard inner join citizen on votercard.cid=citizen.cid where voteridstatus=?");
 ctx.setAttribute("voter", voter);

PreparedStatement passport=con.prepareStatement
    ("select * from passport inner join citizen on passport.cid=citizen.cid where passportstatus=?");
 ctx.setAttribute("passport", passport);

PreparedStatement pancard=con.prepareStatement
    ("select * from pancard inner join citizen on pancard.cid=citizen.cid where pancardstatus=?");
 ctx.setAttribute("pancard", pancard);
 
 PreparedStatement dl=con.prepareStatement
    ("select * from drivinglicence inner join citizen on drivinglicence.cid=citizen.cid where drivinglicencestatus=?");
 ctx.setAttribute("dl", dl);
  
 PreparedStatement insertEmp=con.prepareStatement
 ("insert into staff (ename,eemail,ephone,edob,egender,edept,eaddress,ecity,estate,epincode,epass)values(?,?,?,?,?,?,?,?,?,?,?)");
 ctx.setAttribute("insertEmp", insertEmp);

 PreparedStatement getEmpRecords=con.prepareStatement("select * from Staff ");
   ctx.setAttribute("getEmpRecords", getEmpRecords);
   
    PreparedStatement getEmpPic=con.prepareStatement("select ephoto from staff where eid=?");
   ctx.setAttribute("getEmpPic", getEmpPic);
   
   PreparedStatement getEmpRecord=con.prepareStatement("select * from Staff where eid=? ");
   ctx.setAttribute("getEmpRecord", getEmpRecord);
   
 PreparedStatement updateEmp=con.prepareStatement
 ("update staff set ename=?,eemail=?,ephone=?,edob=?,egender=?,edept=?,eaddress=?,ecity=?,estate=?,epincode=?,epass=? where eid=?");
 ctx.setAttribute("updateEmp", updateEmp);//,
 
 
 PreparedStatement deleteEmp=con.prepareStatement("delete from staff where eid=? ");
 ctx.setAttribute("deleteEmp", deleteEmp);
 
  PreparedStatement insertGeneratedUser=con.prepareStatement("insert into generated(cid,name,fname,cardname,cardno,dob,issuedate,"
  + "address,city,state,pincode,validtill,gender,photo)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
 ctx.setAttribute("insertGeneratedUser", insertGeneratedUser);
 
  PreparedStatement getGenUser=con.prepareStatement("select * from generated where cid=? and cardname=?");
   ctx.setAttribute("getGenUser", getGenUser);
   
    PreparedStatement getGenPic=con.prepareStatement("select photo from generated where cid=? and cardname=?");
   ctx.setAttribute("getGenPic", getGenPic);
      
   PreparedStatement updateCardInfo=con.prepareStatement
 ("update generated set name=?,fname=?,dob=?,address=?,city=?,state=?,pincode=?,gender=?,photo=? where cid=? and cardname=?");
       ctx.setAttribute("updateCardInfo", updateCardInfo);
       
PreparedStatement updateAGen=con.prepareStatement("update aadharcard set aadharstatus=? where cid=? ");   
   ctx.setAttribute("updateAGen", updateAGen);
   
PreparedStatement updateVGen=con.prepareStatement("update votercard set voteridstatus=? where cid=? ");   
   ctx.setAttribute("updateVGen", updateVGen);

PreparedStatement updatePGen=con.prepareStatement("update pancard set pancardstatus=? where cid=? ");   
   ctx.setAttribute("updatePGen", updatePGen);

PreparedStatement updatePassGen=con.prepareStatement("update passport set passportstatus=? where cid=? ");   
   ctx.setAttribute("updatePassGen", updatePassGen);

PreparedStatement updateDLGen=con.prepareStatement("update drivinglicence set drivinglicencestatus=? where cid=? ");   
   ctx.setAttribute("updateDLGen", updateDLGen);  
   
PreparedStatement getGenUserDetails=con.prepareStatement("select * from generated where cid=?");
   ctx.setAttribute("getGenUserDetails", getGenUserDetails);
   
   
   
   ctx.setAttribute("checkEmailId", checkEmailId);
   ctx.setAttribute("insertUser", insertUser);
   ctx.setAttribute("checkUser", checkUser);
   ctx.setAttribute("getPic", getPic);
   ctx.setAttribute("updateProfile", updateProfile);
   ctx.setAttribute("updatePic", updatePic);
   ctx.setAttribute("deleteStaff", deleteStaff); 
   ctx.setAttribute("deleteCitizen", deleteCitizen); 
   ctx.setAttribute("changepass", changepass);
   ctx.setAttribute("getCitizenRecords", getCitizenRecords);

   //..............................................................................//
   
   ctx.setAttribute("checkAadharUserCid", checkAadharUserCid);
   ctx.setAttribute("checkBirthCertificateNo",checkBirthCertificateNo );
   ctx.setAttribute("insertAadharCardUser", insertAadharCardUser);
   ctx.setAttribute("updateAadharCardUser", updateAadharCardUser);
   ctx.setAttribute("updateAadharStatus", updateAadharStatus);
   ctx.setAttribute("getMaxAadharno", getMaxAadharno);
   ctx.setAttribute("updateAadharno", updateAadharno);
   ctx.setAttribute("checkadhar", checkadhar);
   
  //...............................pancard.......................................................//
   
   ctx.setAttribute("checkadharnoforpancard", checkadharnoforpancard);
   ctx.setAttribute("checkPancardUserCid", checkPancardUserCid);
   ctx.setAttribute("updatePancardUser", updatePancardUser);
   ctx.setAttribute("insertPancardUser", insertPancardUser);
   ctx.setAttribute("getPancardStatus", getPancardStatus);
   ctx.setAttribute("getDocumentForPancard", getDocumentForPancard);
   ctx.setAttribute("updatePancardStatus", updatePancardStatus);
   ctx.setAttribute("updatePancardno", updatePancardno);
   ctx.setAttribute("getMaxPancardidno", getMaxPancardidno);
   
   
   //................................................finish....................................
   
    //...............................Passport.......................................................//
   
   ctx.setAttribute("checkadharnoforPassport", checkadharnoforPassport);
   ctx.setAttribute("checkPassportUserCid", checkPassportUserCid);
   ctx.setAttribute("updatePassportUser", updatePassportUser);
   ctx.setAttribute("insertPassportUser", insertPassportUser);
   ctx.setAttribute("getPassportStatus", getPassportStatus);
   ctx.setAttribute("getDocumentForPassport", getDocumentForPassport);
   ctx.setAttribute("updatePassportStatus", updatePassportStatus);
   ctx.setAttribute("updatePassportno", updatePassportno);
   ctx.setAttribute("getMaxPassportidno", getMaxPassportidno);
   
   
   //................................................finish....................................
   
   
   
     //...............................DrivingLicence.......................................................//
   
   ctx.setAttribute("checkAdharnoForDL", checkAdharnoForDL);
   ctx.setAttribute("checkDLUserCid", checkDLUserCid);
   ctx.setAttribute("updateDLUser", updateDLUser);
   ctx.setAttribute("insertDLUser", insertDLUser);
   ctx.setAttribute("getDLStatus", getDLStatus);
   ctx.setAttribute("getDocumentForDL", getDocumentForDL);
   ctx.setAttribute("updateDLStatus", updateDLStatus);
   ctx.setAttribute("updateDLIdno", updateDLIdno);
   ctx.setAttribute("getMaxDLIdno", getMaxDLIdno);
   
   
   //................................................finish....................................
   
   
   
   
   
   
   
   
   
   ctx.setAttribute("getVoterCardStatus", getVoterCardStatus);
    ctx.setAttribute("getDocumentForVoterCard", getDocumentForVoterCard);
    ctx.setAttribute("updateVotercardStatus", updateVotercardStatus);
    ctx.setAttribute("getStatuswiseCitizenInfo", getStatuswiseCitizenInfo);
    ctx.setAttribute("getMaxVoteridno", getMaxVoteridno);
    ctx.setAttribute("updateVotercardno", updateVotercardno);
    ctx.setAttribute("insertVoterIdCardUser", insertVoterIdCardUser);
    ctx.setAttribute("updateVoterCardUser", updateVoterCardUser);
    ctx.setAttribute("checkVoterUserCid", checkVoterUserCid);
    
     }
                 
            
		catch(Exception e)
		{
			e.printStackTrace();
		}  
	}   
	public void contextDestroyed(ServletContextEvent e) {}  
}  