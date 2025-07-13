package Project;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryption {
	public static String generatedENC_Password(String password) {
		// TODO Auto-generated method stub
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("occurs occured in PasswordEncryption");
		}
		digest.reset();
		byte []hash = digest.digest(password.getBytes());
		BigInteger bigint = new BigInteger(1,hash);
		return bigint.toString(16);
	}
}
