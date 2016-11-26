package org.xiaojl.commons.utils;

import java.net.InetAddress;


public class UUIDHexGenerator
{
  private static final int ip;
  private static short counter;
  private static final int jvm;
  private static  String sep="";
 

  protected static String format(int intval) {
    String formatted = Integer.toHexString(intval);
    StringBuffer buf = new StringBuffer("00000000");
    buf.replace(8 - formatted.length(), 8, formatted);
    return buf.toString();
  }

  protected static String format(short shortval) {
    String formatted = Integer.toHexString(shortval);
    StringBuffer buf = new StringBuffer("0000");
    buf.replace(4 - formatted.length(), 4, formatted);
    return buf.toString();
  }

  public static String generate() {
    return format(getIP()) + sep + format(getJVM()) + sep + format(getHiTime()) + sep + format(getLoTime()) + sep + format(getCount());
  }

  public static void main(String[] args)
    throws Exception
  {
     
      String id = UUIDHexGenerator.generate();
      System.out.println("gen1: " + id + ": " + id.length());
      String id2 = UUIDHexGenerator.generate();
      System.out.println("gen2: " + id2 + ": " + id2.length());
     
  }

  private static int getJVM()
  {
    return jvm;
  }

  private static short getCount()
  {
    synchronized (UUIDHexGenerator.class) {
      if (counter < 0) counter = 0;
      short tmp37_34 = counter; counter = (short)(tmp37_34 + 1); return tmp37_34;
    }
  }

  private static int getIP()
  {
    return ip;
  }

  private static short getHiTime()
  {
    return (short)(int)(System.currentTimeMillis() >>> 32);
  }

  private static int getLoTime() {
    return (int)System.currentTimeMillis();
  }

  static
  {
    int ipadd;
    try
    {
      ipadd = ByteUtils.toInt(InetAddress.getLocalHost().getAddress());
    }
    catch (Exception e) {
      ipadd = 0;
    }
    ip = ipadd;

    counter = 0;
    jvm = (int)(System.currentTimeMillis() >>> 8);
  }
}
