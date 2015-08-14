package com.hrclub.model.encryption;

import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import org.bouncycastle.jce.provider.*;
import org.bouncycastle.util.encoders.*;
import sun.misc.*;
import java.util.*;

/**
 *
 * <p>Title: </p>
 * JAVA通用加密类
 * <p>Description: </p>
 *
 * 提供加密算法和编码转换功能，包括3DES加密解密算法、MD5加密算法、SHA1摘要算法、BASE64编码解码等。
 * <p>Copyright: Copyright (c) 2006</p>
 *
 * <p>Company: 福富软件</p>
 *
 * @author 王琤
 * @version 1.0
 */
public class Encrypter {
  //定义 加密算法,可用 DES,DESede,Blowfish
  private static final String Algorithm = "DESede";

  static {
    Security.addProvider(new com.sun.crypto.provider.SunJCE());
    Security.addProvider(new BouncyCastleProvider());
  }

  public Encrypter() {
  }
  
  public static void main (String[] args) throws Exception{
	  Encrypter en = new Encrypter();
	  System.out.println(en.MD5("350702198006260039"));
	  System.out.println(en.MD5("jamy"));
  }

  /**
   * MD5加密
   * @param str String 明文
   * @return String    密文
   */
  public String MD5(String str) {
    Md5encrypter md5 = new Md5encrypter();
    return md5.getMD5ofStr(str);
  }

  /**
   * 根据参数随机生成3DES KEY
   * @param strKey
   */
  public Key getKey(String strKey) {
    Key key = null;
    try {
      KeyGenerator _generator = KeyGenerator.getInstance(Algorithm);
      _generator.init(new SecureRandom(strKey.getBytes()));
      key = _generator.generateKey();
      _generator = null;

    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return key;
  }

  /**
   * 3DES加密函数
   * @param keybyte byte[]  加密密钥，长度为24字节
   * @param src byte[] 明文
   * @return byte[]    密文
   */
  public byte[] DESEncrypt(byte[] keybyte, byte[] src) {
    try {

      Cipher cEnc = Cipher.getInstance("DESede/CBC/PKCS7Padding", "BC");
      cEnc.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(keybyte, Algorithm),
                new IvParameterSpec(Hex.decode("0102030405060708")));
      return cEnc.doFinal(src);

    }
    catch (java.security.NoSuchAlgorithmException e1) {
      e1.printStackTrace();
    }
    catch (javax.crypto.NoSuchPaddingException e2) {
      e2.printStackTrace();
    }
    catch (java.lang.Exception e3) {
      e3.printStackTrace();
    }
    return null;

  }

  /**
   * 3DES加密函数
   * @param keystr String 加密密钥，长度为48位字符串（16进制数）
   * @param src byte[] 明文
   * @return byte[] 密文
   */
  public byte[] DESEncrypt(String keystr, byte[] src) {

    byte[] bytesKey = Hex.decode(keystr);
    return DESEncrypt(bytesKey, src);
  }

  /**
   * 生成SHA1摘要
   * @param strTobeDigest String 原文
   * @return String  摘要字符串
   * @throws Exception
   */
  public String generateDigest(String strTobeDigest) throws Exception {
    byte input[] = strTobeDigest.getBytes("UTF-8");
    byte output[] = null;
    MessageDigest DigestGenerator = MessageDigest.getInstance("SHA1");
    DigestGenerator.update(input);
    output = DigestGenerator.digest();
    return new String(BASE64Encode(output));
  }

  /**
   * 校验摘要信息
   * @param source String 原文
   * @param digest byte[]  摘要
   * @return boolean  摘要是否匹配
   * @throws Exception
   */
  public boolean checkDigest(String source, byte[] digest) throws
      Exception {
    java.security.MessageDigest algb = java.security.MessageDigest.
        getInstance("SHA-1");
    algb.update(source.getBytes("UTF-8"));
    if (algb.isEqual(digest, algb.digest())) {
      return true;
    }
    else {
      return false;
    }
  }

  /**
   * 3DES解密函数
   * @param keybyte byte[] 密钥，长度为24字节
   * @param src byte[]   密文
   * @return byte[]  明文
   */
  public byte[] DESDecrypt(byte[] keybyte, byte[] src) {
    try {
      SecretKeySpec spec = new SecretKeySpec(keybyte, Algorithm);
      Cipher cipher = Cipher.getInstance("DESede/CBC/PKCS7Padding", "BC");
      cipher.init(Cipher.DECRYPT_MODE, spec,
                  new IvParameterSpec(Hex.decode("0102030405060708")));
      byte[] decrypt = cipher.doFinal(src);
      return decrypt;

    }
    catch (java.security.NoSuchAlgorithmException e1) {
      e1.printStackTrace();
    }
    catch (javax.crypto.NoSuchPaddingException e2) {
      e2.printStackTrace();
    }
    catch (java.lang.Exception e3) {
      e3.printStackTrace();
    }
    return null;

  }

  /**
   * 3DES解密函数
   * @param keystr String 密钥，长度为48位字符串（16进制数）
   * @param src byte[]   密文
   * @return byte[]  明文
   */
  public byte[] DESDecrypt(String keystr, byte[] src) {
    byte[] bytesKey = Hex.decode(keystr);
    return DESDecrypt(bytesKey, src);
  }

  /**
   * BASE64编码
   * @param byteStr byte[] 字节码
   * @return String  BASE64字符串
   */
  public String BASE64Encode(byte[] byteStr) {
    BASE64Encoder base64en = new BASE64Encoder();
    return base64en.encode(byteStr);
  }

  /**
   * BASE64解码
   * @param str String 解码字符串
   * @return byte[]  字节码
   * @throws Exception
   */
  public byte[] BASE64Decode(String str) throws Exception {
    BASE64Decoder base64de = new BASE64Decoder();
    byte[] b = base64de.decodeBuffer(str);
    return b;
  }

  /**
   * 提取SHA1算法摘要
   * @param instr String 字符串
   * @return byte[] 摘要
   * @throws Exception
   */
  public byte[] SHA1(String instr) throws Exception {
    java.security.MessageDigest alga = java.security.MessageDigest.getInstance(
        "SHA-1");
    alga.update(instr.getBytes("UTF-8"));
    byte[] digesta = alga.digest();
    return digesta;
  }

  /**
   * 将字节码转换为字符串（16进制）
   * @param b byte[]
   * @return String
   */
  public static String byte2hex(byte[] b) { //二行制转字符串
    String hs = "";
    String stmp = "";
    for (int n = 0; n < b.length; n++) {
      stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
      if (stmp.length() == 1) {
        hs = hs + "0" + stmp;
      }
      else {
        hs = hs + stmp;
      }
      if (n < b.length - 1) {
        hs = hs; //+ ":";
      }
    }
    return hs.toUpperCase();
  }

}
