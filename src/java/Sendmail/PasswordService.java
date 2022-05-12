// 
//
//package Sendmail;
//
// 
//import javax.crypto.Cipher;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import javax.crypto.BadPaddingException;
//import javax.crypto.IllegalBlockSizeException;
//import java.io.UnsupportedEncodingException;
//import java.io.IOException;
//
//import sun.misc.BASE64Encoder;
//
//public final class PasswordService
//{
//  private static PasswordService instance;
//
//  private PasswordService()
//  {
//  }
//
//  public synchronized String encrypt(String plaintext)
//  {
//    MessageDigest md = null;
//    try
//    {
//      md = MessageDigest.getInstance("SHA"); //step 2
//    }
//    catch(NoSuchAlgorithmException e)
//    {
//
//    }
//    try
//    {
//      md.update(plaintext.getBytes("UTF-8")); //step 3
//    }
//    catch(UnsupportedEncodingException e)
//    {
//
//    }
//
//    byte raw[] = md.digest(); //step 4
//    String hash = (new BASE64Encoder()).encode(raw); //step 5
//    return hash; //step 6
//  }
//
//  public static synchronized PasswordService getInstance() //step 1
//  {
//    if(instance == null)
//    {
//       instance = new PasswordService();
//    }
//    return instance;
//  }
// public static String decrypt(String str) {
//    Cipher dcipher=null;
//        try {
//
//            // Decode base64 to get bytes
//            byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str);
//
//            // Decrypt
//            byte[] utf8 = dcipher.doFinal(dec);
//
//            // Decode using utf-8
//            return new String(utf8, "UTF8");
//
//        } catch (BadPaddingException e) {
//        } catch (IllegalBlockSizeException e) {
//        } catch (UnsupportedEncodingException e) {
//        } catch (IOException e) {
//        }
//        return null;
//    }
//    public static void main(String[] args) {
//       String as = PasswordService.getInstance().encrypt("hello").trim();
//        System.out.println(as);
//       String as1 =decrypt("qvTGHdzF6KLavt4PO0gs2a6pQ00=");
//      System.out.println(as1);
//    }
//   
//}
