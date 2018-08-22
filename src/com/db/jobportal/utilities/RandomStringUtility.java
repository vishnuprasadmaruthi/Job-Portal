package com.db.jobportal.utilities;

import java.util.Random;

import cob.db.jobportal.constants.JobPortalConstants;

public class RandomStringUtility {
	
	public static int randomNumbermin=3;
	public static int randomNumbermax=6;
	public static String generateRandomPassword(String username){
		JobPortalConstants jpc = new JobPortalConstants();
		
		String pass1 =jpc.getPasswordHelper().substring(0,getRandomNumber());
		
		pass1 =pass1.concat(username.substring(0,getRandomNumber()));
		
		return pass1;
	}

	private static int getRandomNumber() {
		Random random = new Random();
		return random.nextInt(randomNumbermax - randomNumbermin + 1) + randomNumbermin;
	}
	

}
