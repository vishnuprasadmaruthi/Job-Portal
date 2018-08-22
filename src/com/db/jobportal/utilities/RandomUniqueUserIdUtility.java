package com.db.jobportal.utilities;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class RandomUniqueUserIdUtility {
	
	public static Integer getRandomUid(){
		Random r =new Random();
		int i = r.nextInt(12548);
		ArrayList<Integer> list = new ArrayList<Integer>();
		  for (int i1=i; i1<18729; i1++) {
		        list.add(new Integer(i));
		    }
		  Collections.shuffle(list);
		  
		  int j = r.nextInt(10);
		  return list.get(j);
		
		
		
		
		
	}

}
