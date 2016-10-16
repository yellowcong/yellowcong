package com.yellowcong.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 建立一些和时间相关的函数
 * @author yellowcong
 * @date 2016年1月4日
 *
 */
public class DateUtils {
	
	private DateUtils(){
		
	}
	
	/**
	 * 将日期类型的数据  编程  yyyy-MM-dd HH:mm:ss的数据
	 * @param date
	 * @return 格式化的时间字符串
	 */
	public static String toLocaleString(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}
	
	/**
	 * 获取现在的时间
	 * @return 现在时间
	 */
	public static String timeNow(){
		return toLocaleString(new Date());
	}
	
	
	/**
	 * 将毫秒转化消耗时间
	 * 获取我们的消耗时间
	 * 当我们花费的时间比较短的情况下这个方法算不出来
	 * @param start 结束时间 System.currentTimeMillis()
	 * @param end 开始时间
	 * @return
	 */
	public static String countTime(long start,long end){
		
		StringBuffer buff = new StringBuffer();
		long date = (end - start)/1000;
		//计算天数
		long day = date/(24*60*60);
		buff.append(day+"天");
		
		long hh = date%(24*60*60)/(60*60);
		buff.append(hh+"时");
		long mm = date%(24*60*60)%(60*60)/60;
		buff.append(mm+"分");
		long ss = date%(24*60*60)%(60*60)%60;
		buff.append(ss+"秒");
		String str  = buff.toString();
		if(day == 0){
			str = str.replace("0天", "");
			if(hh ==  0){
				str = str.replace("0时", "");
				if(mm == 0){
					str = str.replace("0分", "");
				}
			}
		}
		return str;
	}
}
