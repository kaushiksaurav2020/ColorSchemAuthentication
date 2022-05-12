package Sendmail;

public class AES {

    public static void main(String arg[]) {
        AES a = new AES();
        // System.out.println("AES : " + (a.encrypt("abcdhello")));
        System.out.println("EBCDIC : " + a.decrypt("]^_`dahhk"));
    }

    public static String encrypt(String str) {
        byte b[] = new byte[str.length()];
        byte result[] = new byte[str.length()];
//	 byte mod[] = new byte[str.length()];
        b = str.getBytes();
        for (int i = 0; i < str.length(); i++) {
            result[i] = (byte) ((byte) b[i] - (byte) 4);
//mod[i]=(byte) ((byte) b[i] % (byte) 4);

            // System.out.println(b[i]+"-"+result[i]);
        }

        return (new String(result));
    }

    public static String decrypt(String str) {
        byte b[] = new byte[str.length()];
        byte result[] = new byte[str.length()];

        b = str.getBytes();
        for (int i = 0; i < str.length(); i++) {
            result[i] = (byte) ((byte) b[i] + (byte) 4);
            //  System.out.println(b[i]+"-"+result[i]);
        }

        return (new String(result));

    }

}
