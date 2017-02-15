/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.aes;

/**
 *
 * @author peria
 */

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class SchedulerAES 
{
    private static final String ALGORITHM = "AES";
    private static final String KEY = "Govindharaju1234";
    
    public static void main(String arg[]){
        try{
        System.out.println("Key Value==>"+KEY);
       // String en=SchedulerAES.encrypt("P@55word");
      //  System.out.println("Password Encripted==>"+en);
        String de=SchedulerAES.decrypt("Au1f/APDBm0jTlAZ9mpkLA==");
        System.out.println("Password Decrypted==>"+de);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static String encrypt(String value) throws Exception
    {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(SchedulerAES.ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte [] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8"));
        String encryptedValue64 = new BASE64Encoder().encode(encryptedByteValue);
        return encryptedValue64;
               
    }
    
    public static String decrypt(String value) throws Exception
    {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(SchedulerAES.ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte [] decryptedValue64 = new BASE64Decoder().decodeBuffer(value);
        byte [] decryptedByteValue = cipher.doFinal(decryptedValue64);
        String decryptedValue = new String(decryptedByteValue,"utf-8");
        return decryptedValue;
                
    }
    
    private static Key generateKey() throws Exception 
    {
        Key key = new SecretKeySpec(SchedulerAES.KEY.getBytes(),SchedulerAES.ALGORITHM);
        return key;
    }
}