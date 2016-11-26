package org.xiaojl.commons.utils;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期处理类 2006-12-01
 * 
 */

public class DateUtil {

	public DateUtil() {
	}

	public static String getNowDate() {
		Date dateTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strTime = format.format(dateTime);
		return strTime;
	}
	public static String getYear() {
		Calendar c = Calendar.getInstance();
		String strTime = c.get(Calendar.YEAR)+"";
		return strTime;
	}
	public static String getMonth() {
		Calendar c = Calendar.getInstance();
		
		int y = c.get(Calendar.MONTH)+1;
		if(y<10){
			return "0"+y;
		}else{
			return y+"";
		}
	}

	/**
	 * 当前时间
	 * 
	 * @return
	 */
	public static String getStringDateHMS() {
		return getNowDate();
	}
	
	public static String getStringDateHM() {
		Date dateTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String strTime = format.format(dateTime);
		return strTime;
	}

	public static String getStringDateH() {
		Date dateTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH");
		String strTime = format.format(dateTime);
		return strTime;
	}
	
	public static String getStringDate() {
		Date dateTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String strTime = format.format(dateTime);
		return strTime;
	}

	/**
	 * 是否是同一天的数据
	 * @param cal1
	 * @param cal2
	 * @return
	 */
	public static boolean isSameDay(Calendar cal1, Calendar cal2) {
		if (cal1 == null || cal2 == null)
			throw new IllegalArgumentException("The date must not be null");
		else
			return cal1.get(0) == cal2.get(0) && cal1.get(1) == cal2.get(1)
					&& cal1.get(6) == cal2.get(6);
	}

	public static boolean isSameDay(Date date1, Date date2) {
		if (date1 == null || date2 == null) {
			throw new IllegalArgumentException("The date must not be null");
		} else {
			Calendar cal1 = Calendar.getInstance();
			cal1.setTime(date1);
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(date2);
			return isSameDay(cal1, cal2);
		}
	}

	/**
	 * 格式化日期成字符串
	 * 
	 * @param dtime
	 * @param dateformat
	 * @return
	 */
	public static String formatDate(Date dtime, String dateformat) {
		SimpleDateFormat format = new SimpleDateFormat(dateformat);
		String strTime = format.format(dtime);
		return strTime;
	}

	/**
	 * 将字符串格式化成日期
	 * 
	 * @param str
	 * @param parsePatterns,
	 *            举例：parseDate("2001-1-1",new String[]{"yyyy-MM-dd","yyyy-MM-dd
	 *            HH:mm:ss"})
	 * @return
	 * @throws ParseException
	 */
	public static Date parseDate(String str, String parsePatterns[])
			throws ParseException {
		if (str == null || parsePatterns == null)
			throw new IllegalArgumentException(
					"Date and Patterns must not be null");
		SimpleDateFormat parser = null;
		ParsePosition pos = new ParsePosition(0);
		for (int i = 0; i < parsePatterns.length; i++) {
			if (i == 0)
				parser = new SimpleDateFormat(parsePatterns[0]);
			else
				parser.applyPattern(parsePatterns[i]);
			pos.setIndex(0);
			Date date = parser.parse(str, pos);
			if (date != null && pos.getIndex() == str.length())
				return date;
		}
		throw new ParseException("Unable to parse the date: " + str, -1);
	}

	
	/**
	 * 得到二个日期这之间的天数相隔
	 * @param rq1
	 * @param rq2
	 * @return
	 */
	public static long DaysBetween(Date bgdate,Date enddate){
		long beginTime = bgdate.getTime(); 
		long endTime = enddate.getTime(); 
		long days = (long)((endTime - beginTime) / (1000 * 60 * 60 *24) +0.5); 
		return days;
	}

	/**
	 * 得到二个日期这之间的小时相隔
	 * @param rq1
	 * @param rq2
	 * @return
	 */
	public static long HoursBetween(Date bgdate,Date enddate){
		long beginTime = bgdate.getTime(); 
		long endTime = enddate.getTime(); 
		long hours = (long)((endTime - beginTime) / (1000 * 60 * 60)); 
		return hours;
	}

	/**
	 * @function 日期按小时相加
	 * @author  geng 
	 */
	public static java.util.Date addDate(java.util.Date date, int hour) {
		   java.util.Calendar c = java.util.Calendar.getInstance();
		   c.setTimeInMillis(getMillis(date) + ((long) hour) * 3600 * 1000);
		   return c.getTime();
	}
	
	/**
	 * 返回毫秒
	 * @author geng
	 */
	public  static long getMillis(java.util.Date date) {
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}
	/**
	 * 在当天的时间加三天
	 * return 
	 * @author  
	 */
	public static  String getAddtime ()throws ParseException{
	  String nowtime = DateUtil.getStringDate();
	  Date date =new Date();
	  Date date1 =new Date();
	  date =DateUtil.parseDate(nowtime,new String []{"yyyy-MM-dd"});
	  date1 =DateUtil.addDate(date,120);
	  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	  String strTime = format.format(date1);
	  return(strTime);
		
	}
	
    public static String getAddtime(int dateStr)
    throws ParseException{
	    String nowtime = getStringDate();
	    Date date = new Date();
	    Date date1 = new Date();
	    date = parseDate(nowtime, new String[] {
	        "yyyy-MM-dd"
	    });
	    date1 = addDate(date, dateStr);
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    String strTime = format.format(date1);
	    return strTime;
	}
}

