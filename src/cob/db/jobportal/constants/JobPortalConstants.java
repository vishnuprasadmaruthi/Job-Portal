package cob.db.jobportal.constants;

public class JobPortalConstants {
	
public static final String  passwordForForgotPassword="jewtscfbjhgdu1@!3dgdgfsdgh";
public static final String encryptionDecryptionKey = "ezeon8547";
public static StringBuilder sb=null;
public static String adminMail = "jobportal4ss@gmail.com";

public static String getPasswordHelper(){
	return passwordForForgotPassword;
}

public static String getAdminMailAddress(){
	
	return adminMail;
}
	
public static String getForgotPasswordMessage()
{
	
	 sb = new StringBuilder();
	
	sb.append("YOUR NEW PASSWORD IS AS FOLLOWS:");
	sb.append("|");
	return sb.toString();
	
	
}



public static String getencryptionDecryptionKey()
{
	
	sb = new StringBuilder();
	sb.append(encryptionDecryptionKey);
	return sb.toString();
	
	
}


public static String getNewRegisteredUserCustomMessage(){
	
	sb = new StringBuilder();
	sb.append("\n");
	sb.append("\n");
	sb.append("\n");
	sb.append("Welcome ConnectedIn User!");
	sb.append("\n");
	sb.append("\n");
	sb.append("\n");
	sb.append("ThankYou for Registering with us.");
	sb.append("\n");
	sb.append("Please Keep the Credentials Safe and Secure.");
	sb.append("\n");
	sb.append("Donot Share the credentials with anyone");
	sb.append("\n");
	sb.append("For queries,Call +91-81057-24657");
	sb.append("\n");
	sb.append("Kind Regards,");
	sb.append("\n");
	sb.append("ConnectedIn Team");
	sb.append("\n");
	sb.append("\n");
	return sb.toString();	
	
	
}

}
