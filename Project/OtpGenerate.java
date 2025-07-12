package Project;

import java.util.Random;

public class OtpGenerate {
	public static String otp() {
        Random random = new Random(); 

	 	return String.format("%06d",random.nextInt(1000000));

		
		}

}
