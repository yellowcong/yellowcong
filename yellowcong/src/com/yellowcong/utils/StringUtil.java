package com.yellowcong.utils;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 这个是很久以前  13年左右 写的  最近用用改改
 * @author yellowcong
 * @date 2016年1月3日
 *
 */
public class StringUtil {
	/**
	 * 判断字符串是否是整数
	 * @param number
	 * @return
	 */
	public static boolean isInteger(String number) {
		boolean isNumber = false;
		if (StringUtil.isNotEmpty(number)) {
			isNumber = number.matches("^([1-9]\\d*)|(0)$");
		}
		return isNumber;
	}
	/**
	 * 判断字符串不为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		boolean isNotEmpty=false;
		if(str!=null && !str.trim().equals("") && !str.trim().equalsIgnoreCase("NULL")){
			isNotEmpty=true;
		}
		return isNotEmpty;
	}
	/**
	 * 判断字符串为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		return !isNotEmpty(str);
	}
	/**
	 * 将数组转成SQL认识的字符串     123,432,2312     id in('123','432','2312')
	 * @param ids
	 * @return
	 */
	public static String arrayToStr(String[] ids) {
		StringBuffer str=new StringBuffer();
		for(int i=0;i<ids.length;i++){
			str.append("'"+ids[i]+"',");
		}
		if(ids.length>0){
			str.deleteCharAt(str.length()-1);
		}
		return str.toString();
	}
	
	/**
	 * 将传递过来Str转化为 数字数组
	 * @param str
	 * @return
	 */
	public static int[] strToArray(String str){
		String [] idStrs = str.split(",");
		int [] ids = new int[idStrs.length];
		for(int i=0;i<idStrs.length;i++){
			ids[i] = Integer.parseInt(idStrs[i]);
		}
		return ids;
	}
	
	/**
	 * 给数据进行md5加密
	 * @param message
	 * @return
	 */
	public static String md5(String message)
	  {
	    try
	    {
	      MessageDigest md = MessageDigest.getInstance("MD5");
	      
	      md.update(message.getBytes());
	      return new BigInteger(1, md.digest()).toString(16);
	    }
	    catch (Exception e)
	    {
	      throw new RuntimeException("MD5转码失败");
	    }
	  }
	
	/**
	 * 通过老文件的名称自动生成新的文件
	 * @param oldName 
	 * @return
	 */
	public static String newName(String oldName){
		String [] datas = oldName.split("\\.");
		String type = datas[datas.length-1];
		String newName  = UUID.randomUUID().toString()+"."+type;
		return newName;
	}
	
	/**
	 * 获取文件的类型 
	 * @param oldName 
	 * @return
	 */
	public static String getFileType(String fileName){
		String [] datas = fileName.split("\\.");
		String type = "没有文件名";
		if(datas.length >1){
			type = datas[datas.length-1];
		}
		return type;
	}
	/**
	 * 获取文件的类型  yellowcong.txt  不获取我们文件的扩展名称
	 * .xx 这种类型的我们设定文件名为空
	 * @param fileName
	 * @return
	 */
	public static String getFileSimpleName(String fileName){
		String [] datas = fileName.split("\\.");
		String simpleName = "";
		StringBuffer buff = null;
		if(datas.length >1){
			buff = new StringBuffer();
			//遍历数据 ,解决  有 xx.xx .xx的文件 
			for(int i=0;i<datas.length-1;i++){
				buff.append(datas[i]+".");
			}
			simpleName = buff.substring(0,buff.length()-1).toString();
		}
		
		return simpleName.length()==0?fileName:simpleName;
	}
	/**2016年1月3号
	 * 通过给定文件夹的访问的路径 然后获取我们的文件名称
	 * E:\学习\服务器学习\Nginx\nginx-1.4.7\nginx
	 * 这个情况下我们获取到的文件扩展名称是.7\nginx  我们需要去掉path
	 * 获取文件名称
	 * @param filePathName
	 * @return
	 */
	public static String getFileTypeByPath(String pathname){
		try {
			File file = new File(pathname);
			return getFileType(file.getName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("有问题"+pathname);
		}
		return null;
	}
	
	/**
	 * 清除html中的所有的标签
	 * @param htmlStr
	 * @return
	 */
	public static String removeHtmlTags(String htmlStr){
		String textStr = "";
		String scriptReg = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
		String styleReg = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
		String htmltReg = "<[^>]+>";
		/**
		 * 定义html页面中的匹配起
		 */
		Pattern script = Pattern.compile(scriptReg,Pattern.CASE_INSENSITIVE);
		textStr = script.matcher(htmlStr).replaceAll("");
		Pattern style =Pattern.compile(styleReg,Pattern.CASE_INSENSITIVE);
		textStr = style.matcher(textStr).replaceAll("");
		Pattern html =Pattern.compile(htmltReg,Pattern.CASE_INSENSITIVE);;
		textStr = html.matcher(textStr).replaceAll("");
		return textStr;
	}
	
	/**
	 * 移除字符串中的 回车、换行、空格、制表符
	 * @param htmlStr html 的字符串
	 * @return
	 */
	public static String removeBlank(String htmlStr){
		String textStr = "";
		String blankReg = "\\s*|\t\r\n";
		textStr = Pattern.compile(blankReg, Pattern.CASE_INSENSITIVE).matcher(htmlStr).replaceAll("");
		return textStr;
	}
	
	/**
	 * 判断我们的数据 中，是否有中文字符
	 * @param str
	 * @return
	 */
	public static boolean isChineseChar(String str){
		boolean flag = false;
		Pattern pattern = Pattern.compile("[\u4e00-\u9fa5]");
		if(pattern.matcher(str).find()){
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 解决目录空格的问题
	 * @param filePath
	 * @return
	 */
	public static String newPath(String filePath){
		if(filePath.contains("%20")){
			filePath = filePath.replace("%20", " ");
		}
		return filePath;
	}
	/**
	 * 给定最大值和 生成的数组个数 就会返回一个数组对象
	 * @param size  生成的数组大小
	 * @param max  最大值
	 * @return
	 */
	public static int[] randomInt(int size,int max){
		int[] intRet = new int[size];
        int intRd = 0; //存放随机数
        int count = 0; //记录生成的随机数个数
        int flag = 0; //是否已经生成过标志
        Random random = new Random();
        while(count<size){
             //产生随机数
             intRd = random.nextInt(max);
             //判断是否相等
             for(int i=0;i<count;i++){
	                 if(intRet[i]==intRd){
	                     flag = 1;
	                     break;
	                 }else{
	                     flag = 0;
	                 }
	             }
	             if(flag==0){
	                 intRet[count] = intRd;
	                 count++;
	             }
	    }
        return intRet;
	}
	
	/**
	 * 判断是否是email
	 */
	public static boolean isEmail(String email){
		String ATOM = "[^\\x00-\\x1F^\\(^\\)^\\<^\\>^\\@^\\,^\\;^\\:^\\\\^\\\"^\\.^\\[^\\]^\\s]";
		String DOMAIN = "(" + ATOM + "+(\\." + ATOM + "+)*";
		String IP_DOMAIN = "\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\]";
		
		Pattern pattern =  Pattern.compile("^" + ATOM + "+(\\." + ATOM + "+)*@"
				+ DOMAIN + "|" + IP_DOMAIN + ")$", 2);
		
		return pattern.matcher(email).matches();		
	}
	
	/**
	 * 判断是否是手机号
	 * @param phone 
	 * @return
	 */
	public static boolean isPhone(String phone){
		String regex = "1[3,5,8][0-9]{9}+";
		Pattern pattern  = Pattern.compile(regex);
		return pattern.matcher(phone).matches();
	}
	

	/**
	 * 判断传递过来的字符串是否是ip
	 * @param str 传递过来的字符串
	 * @return
	 */
	public static boolean isIp(String str){
		boolean flag = false;
		if(str.matches("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}")){
			flag = true;
		}
		//"".equalsIgnoreCase(anotherString)
		return flag;
	}
	

	/**
	 * 去掉带有Emoji的文字 ，否则数据库会报错, 就是 一串 表情的符号，需要设定数据库支持才可以用
	 * @param str
	 * @return
	 */
	public static String removeNonBmpUnicode(String str) {    
		   if (str == null) {    
		       return null;    
		   }    
		   str = str.replaceAll("[^\\u0000-\\uFFFF]", "");    
		  return str;    
	} 
	
	

	/**
	 * 移除 xml文件中的bom 数据问题,对于 有bom,导致文档的解析有问题
	 * utf-8 编码
	 * @param content
	 * @return
	 */
    public static String removeBom(String content){
    	String result = null;
    	try {
			byte [] dates = content.getBytes("UTF-8");
			result = new String(dates,3,dates.length-3,"UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return result;
    }
	/**
	 * 获取电脑的CPU 的个数来定义线程的数量
	 */
	public static int getCpuCount(){
		int cpuCount = Runtime.getRuntime().availableProcessors();
		return cpuCount;
	}
	
	
	/**
	 * 获取http提交的图片， 其中这个方法的出现，需要保证我们的路径中，设定的path 的文件名称 没有  /
	 * @param str
	 * @return
	 */
	public static String getHttpImageName(String str){
		String [] data = str.split("/");
		str = data[data.length -1];
		return str;
	}
	/**
	 * 获取HTml中的图片数据
	 * @param htmlStr
	 * @return
	 */
	public static List<String> getHtmlImages(String htmlStr){
		List<String> list = new ArrayList<String>();
		String reg = "<\\s*img(.+?)src=[\"'](.+?)[\"']\\s*/?\\s*>";
		Pattern pattern = Pattern.compile(reg);
		Matcher matcher = pattern.matcher(htmlStr);
		while(matcher.find()){
			//获取图片地址 url
			list.add(matcher.group(2).split("\"")[0]);
		}
		return list;
	}
	/**
	 * 获取一张图片
	 */
	public static String getHtmlImage(String htmlStr){
		List<String> list= getHtmlImages(htmlStr);
		String result = "";
		if(list != null && list.size() ==  1){
			result = list.get(0);
		}
		return result;
		
	}
	
}
