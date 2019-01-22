package edu.spring.project.util;

import java.util.Random;

public class FIndUtil {
	public static String createConfirm() throws Exception {
		StringBuffer confirm = new StringBuffer();
		
		Random random = new Random();
		
		for (int i = 0; i < 10; i++) {
			int index = random.nextInt(3);
			
			switch(index) {
			case 0:
				confirm.append((char) ((int) (random.nextInt(26)) + 97));
				break;
			case 1:
				confirm.append((char) ((int) (random.nextInt(26)) + 65));
				break;
			case 2:
				confirm.append(random.nextInt(10));
				break;
			}
		}
		
		return confirm.toString();
	}
}
