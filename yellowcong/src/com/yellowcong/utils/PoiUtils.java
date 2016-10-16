package com.yellowcong.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

/**
 * 报表工具包,用来操作报表中的数据
 * @author yellowcong
 * @date 2016年1月6日
 * 过期 依赖 poi-2.5.1.jar  这个是低版的， 读取doc 有问题
 *
 * 
 * poi-3.13.jar
 * poi-scratchpad-3.13.jar
 * 新版本 不需要设定编码 
 * beanutil
 * 
 * 重要的方法
 * 创建xls文件
 * 将HSSFWorkbook 转化为文件
 * copyHSSFToFile(HSSFWorkbook, File) 
 * 
 * 基于annotation
 * 类对象需要使用@HHFSAlias 注解 给字段设定别名
 * createHSSFByAnnotation(List<?>) 
 * 
 * 自己配置好映射关系，然后传 List<?>对象
 * createHSSF(LinkedHashMap<String, String>, List<?>)
 * 
 * 逆向生成 java对象
 * 类对象需要使用@HHFSAlias 注解 给字段设定别名
 * reverseHSSFByAnnotation(File, Class<?>)
 * 
 * 对于文档直接使用，使用String[]来配置我们的 映射关系，boolena 设定是否有表头
 * reverseHSSF(File, String[], Class<?>, boolean)
 * 
 * 对于有表头的可以使用这个，也可以使用上一个，上一个的效率高一点
 * reverseHSSF(File, Map<String, String>, Class<?>)
 */
public class PoiUtils {
	private PoiUtils(){}
	
	
	/**
	 * 将HSSFWorkbook 对象转化为 文件
	 * @param wb  HSSFWorkbook 对象 
	 * @param file 文件
	 */
	public static void copyHSSFToFile(HSSFWorkbook wb,File file){
		FileOutputStream  out = null;
		try {
			out = new FileOutputStream(file);
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			
			try {
				if(wb != null){
					wb.write(out);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					if(out != null){
						out.close();
					}
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
	}
	
	public static void copyHSSFToBrowser(){
		//FIXME 将HHSF写到我们的浏览器
		
	}
	/**
	 * 获取一个不带有输入流的HSSFWorkbook 对象
	 * @return
	 */
	public static HSSFWorkbook getHSSFWorkbook(){
		return getHSSFWorkbook(null);
	}
	/**
	 * 获取我们的一个HSSFWorkbook
	 * @return
	 */
	public static HSSFWorkbook getHSSFWorkbook(File file){
		HSSFWorkbook workbook= null;
		try {
				if(file != null){
					workbook  = new HSSFWorkbook(new FileInputStream(file));
				}else{
					workbook = new HSSFWorkbook();
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return workbook;
	}
	//判断数据
	/**
	 * 通过 结合注解，来生成我们的poi文档操作
	 * 通过注解调用的时候,我们的类中必须要有注解写出，如果没有就创建不了
	 * 需要结合@HFFSAlias 这个类
	 * @param data 我们的数据集合
	 * @return
	 */
	public static HSSFWorkbook createHSSFByAnnotation(List<?> data) {
		LinkedHashMap<String, String> title = null;
		//获取到我们的title数据
		if(data != null && data.size() >0){
			title = new LinkedHashMap<String, String>();
			/*Field [] fields = data.get(0).getClass().getDeclaredFields();
			for(Field field:fields){
				HFFSAlias alias = field.getAnnotation(HFFSAlias.class);
				if(alias != null){
					title.put(field.getName(), alias.value());
				}
			}*/
			title = PoiUtils.getAnnotationAlias(data.get(0).getClass());
			//然后调用已经存在的方法来生成表
			return PoiUtils.createHSSF(title, data);
		}
		return null;
	}
	/**
	 * 逆向生成，我们需要的数据，将xls中的数据转化为字符串数据
	 * @param clazz 映射的类对象
	 * @param file xls文件对象
	 * @return
	 */
	public static List<?> reverseHSSFByAnnotation(File file,Class<?> clazz ){
		//获取field中的信息
		return PoiUtils.reverseHSSF(file, PoiUtils.getAnnotationAlias(clazz), clazz);		
	}
	
	/**
	 * 通过clazz 来获取到里面的title数据
	 * @param clazz
	 * @return
	 */
	public static LinkedHashMap<String,String> getAnnotationAlias(Class<?> clazz){
		Field []  fields = clazz.getDeclaredFields();
		LinkedHashMap<String,String> title = new LinkedHashMap<String, String>();
		for(Field field:fields){
			HFFSAlias alias = field.getAnnotation(HFFSAlias.class);
			if(alias != null){
				title.put(field.getName(), alias.value());
			}
		}
		return title;
	}
	/**
	 * 没有行标题的数据,需要通过这种方法来确定数据
	 * 这个方法使用起来 比通过Map 更加的简便
	 * @param file  逆向工程的xls文件爱你
	 * @param title  这个 需要设定 映射关系,而且顺序不能错
	 * @param clazz   映射的类对象
	 * @param hasHead  是否包含表头，有表头的数据就 需要从1 开始
	 * @return
	 */
	public static List<?> reverseHSSF(File file,String[] title,Class<?> clazz ,boolean hasHead){
		try {
			//创建work
			HSSFWorkbook work = PoiUtils.getHSSFWorkbook(file);
			//获取第一页
			HSSFSheet sheet = work.getSheetAt(0);
			//row是从0开始的,获取列和行的数目
			HSSFRow row =  sheet.getRow(0);
			List list =null;
			List<String> dateFields = null;
			int rownum = sheet.getLastRowNum();
			int cellnum = row.getLastCellNum();
//			System.out.println(rownum);
			String [] ids = title;
			
			if(rownum >0 && cellnum >0){
				list = new ArrayList();
				dateFields = PoiUtils.getDataTimeFiled(clazz);
				//遍历别的数据，第一行数据 是需要的
				int start = 0;
				if(hasHead){
					start = 1;
				}
				for(int i=start;i<rownum;i++){
					row = sheet.getRow(i);
					//实例化对象
					Object obj = clazz.newInstance();
					//设定属性
					for(int j=0;j<cellnum;j++){
						HSSFCell cell = row.getCell((short)j);
						String result ="";
						//当时数字类型的数据，不可以转化
						if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
							result = cell.getNumericCellValue()+"";
						}else{
							result =cell.getStringCellValue();
						}
						
						//日期类型的数据不好注入，需要判断，和设定数据的类型
						if(dateFields.contains(ids[j])){
							BeanUtils.setProperty(obj, ids[j], new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(result));
						}else{
							BeanUtils.setProperty(obj, ids[j], result);
						}
					}
					list.add(obj);
				}
			}
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 通过配置的方法来生成逆向工程
	 * 给定文件，将对象转化为类
	 * 设定中，sheeet 就一页
	 * @param file  xls文件名称
	 * @param title 标题,表头关系
	 * @param clazz 类对象
	 * @return
	 */
	public static List<?> reverseHSSF(File file,Map<String,String> title,Class<?> clazz ){
		try {
			//创建work
			HSSFWorkbook work = PoiUtils.getHSSFWorkbook(file);
			//获取第一页
			HSSFSheet sheet = work.getSheetAt(0);
			//row是从0开始的,获取列和行的数目
			HSSFRow row =  sheet.getRow(0);
			List list =null;
			List<String> dateFields = null;
			int rownum = sheet.getLastRowNum();
			int cellnum = row.getLastCellNum();
//			System.out.println(rownum);
			String [] ids = new String[cellnum];
			
			if(rownum >0 && cellnum >0){
				title = PoiUtils.reverseMap(title);
				list = new ArrayList();
				dateFields = PoiUtils.getDataTimeFiled(clazz);
				//这个可以 提取为 获取第一行数据的信息
				//获取地一行，标题行  获取标题对应信息
				for(int j=0;j<cellnum;j++){
					HSSFCell cell = row.getCell((short)j);
					String result = "";
					//当时数字类型的数据，不可以转化
					if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
//					ids[j]= title.containsValue(value);
						result = cell.getNumericCellValue()+"";
					}else{
						result = cell.getStringCellValue();
					}
					//获取的数据进行注入操作
					
					//需要反转map集合
					if(title != null && result != null){
						if(!title.containsKey(result)){
							throw new RuntimeException("内容不匹配");
						}
						ids[j] = title.get(result);
					}
				}
				
				//遍历别的数据
				for(int i=1;i<rownum;i++){
					row = sheet.getRow(i);
					//实例化对象
					Object obj = clazz.newInstance();
					//设定属性
					for(int j=0;j<cellnum;j++){
						HSSFCell cell = row.getCell((short)j);
						String result ="";
						//当时数字类型的数据，不可以转化
						if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
							result = cell.getNumericCellValue()+"";
						}else{
							result =cell.getStringCellValue();
						}
						
						//日期类型的数据不好注入，需要判断，和设定数据的类型
						if(dateFields.contains(ids[j])){
							BeanUtils.setProperty(obj, ids[j], new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(result));
						}else{
							BeanUtils.setProperty(obj, ids[j], result);
						}
					}
					list.add(obj);
				}
			}
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过给定类，来获取到日期类型的字段
	 * 解决日期类型 注入不进去的问题
	 * @param clazz
	 * @return
	 */
	public static List<String> getDataTimeFiled(Class<?> clazz){
		Field [] fields = clazz.getDeclaredFields();
		List<String> fieldNames = new ArrayList<String>();
		for(Field  field :fields){
			if(field.getType().getSimpleName().equals("Date")){
				fieldNames.add(field.getName());		
			}
		}
		return  fieldNames;
	}
	/**
	 * 创建我们的HSSFwork 通过配置别名属性
	 * @param tiles 文档的title         Map<属性名称, 别名>
	 * @param date List<?> 是一个集合的数据
	 * @return 
	 */
	public static HSSFWorkbook createHSSF(LinkedHashMap<String, String> title,List<?> data) {
		try {
			//一个汉字的宽度是 500
			//英文260 
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			
			//获取字符的长度
//		sheet.setColumnGroupCollapsed(columnNumber, collapsed);
//			sheet.setColumnWidth(column, width);
			//写title中的数据
			if(title!= null && title.size() >0){
				//创建样式
				HSSFCellStyle style = PoiUtils.getHeadStyle(workbook);
				int index = 0;
				HSSFRow row = sheet.createRow(0);
				//获取宽度
				Map<String, Short> columns = PoiUtils.getColumnWidth(title, data);
				//获取数据
				for(Map.Entry<String, String> entry:title.entrySet()){
					String val = entry.getValue();
					HSSFCell cell = row.createCell((short)index);
					//设置单元格的类型
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					//设置编码格式
//					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					//设定样式 
					cell.setCellStyle(style);
					cell.setCellValue(val);
					sheet.setColumnWidth((short)index, columns.get(entry.getKey()));
					index++;
				}
				
				//创建样式
				style = PoiUtils.getBodyStyle(workbook);
				//设定数据
				if(data != null && data.size() >0){
					//获取我们的 data中的数据
					//内容从第二行开始
					int rownum =1;
					for(Object obj:data){
						row = sheet.createRow(rownum);
						//列从第一行开始
						int colnum = 0;
						for(Map.Entry<String, String> entry:title.entrySet()){
							String key = entry.getKey();
							//获取装的对象数据
							String val = BeanUtils.getProperty(obj, key);
							if(val == null || "".equals(val.trim())){
								val = "-";
							}
							HSSFCell cell  = row.createCell((short)colnum);
							//设置单元格的类型
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							//设置编码格式
							//对于高级版本的不需要这个参数
//							cell.setEncoding(HSSFCell.ENCODING_UTF_16);
							//设定样式 
							cell.setCellStyle(style);
							cell.setCellValue(val);
							//增加列
							colnum ++;
						}
						rownum ++;
					}
				}
			}
			
			return workbook;
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 计算每个数据列的最适合的宽度
	 * 通过数据来获取到我们的数据的宽度
	 * @param title 数据标题
	 * @param data 数据几何
	 * @return 
	 */
	public static Map<String, Short> getColumnWidth(Map<String, String> title,List<?> data){
		try {
			//存储我们的每个属性的宽度
			//Map<属性明，宽度>
			Map<String,Short> map = new HashMap<String, Short>();
			
			if(title!= null && title.size() >0){
				//计算我们的第一行的宽度
				for(Map.Entry<String, String> entry:title.entrySet()){
					int max = PoiUtils.countColumnLength(entry.getValue());
					
					//计算下面的所有 同一字段的长度
					for(Object obj:data){
						String val = BeanUtils.getProperty(obj, entry.getKey());
						int temp = PoiUtils.countColumnLength(val);
						max = max >temp?max:temp;
					}
					//设定字段的值
					map.put(entry.getKey(), (short)max);
				}
			}
			return map;
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	 * 根据字符的数量，来计算列的宽度
	 * 不同的数据他的数据长度是不一样的，所以我们需要计算总体的长度
	 * @param str 字符串
	 * @return int 计算出列宽
	 * 
	 */
	private static int countColumnLength(String str){
		int len =0;
		if(str != null && !"".equals(str.trim())){
			//一个汉字的宽度是 500
			//英文260
			char [] chars = str.toCharArray();
			//z
			int chines = 0;
			int other =0;
			for(char val:chars){
				if(PoiUtils.isChineseChar(val)){
					chines ++;
				}else{
					other++;
				}
			}
			//获取到了数据然后计算长度
			len = chines*500+other*260+1000;
		}
		return len;
	}
	/**
	 * 创建样式
	 * @return 
	 */
	public static HSSFCellStyle getHeadStyle(HSSFWorkbook workbook){
		HSSFCellStyle  style = workbook.createCellStyle();
		//居中显示
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFont(PoiUtils.getSongRed10(workbook));
		return style;
	}
	
	/**
	 * 创建样式
	 * @return 
	 */
	public static HSSFCellStyle getBodyStyle(HSSFWorkbook workbook){
		HSSFCellStyle  style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFont(PoiUtils.getSong10(workbook));
		return style;
	}
	
	
	
	/**
	 * 创建字体
	 * @param fontFamly 字体 
	 * @param size 大小 字号 14  13
	 * @param color  HSSFColor.BLACK.index 这个HSSFColor中 的数据
	 * @param isBold 是否加粗 操作
	 * @return 
	 */
	//字号 是14号 -->对应的short 280宽度 是 14好字体
	public static HSSFFont creatFont(HSSFWorkbook workbook,String fontFamly,Integer size,Short color,boolean isBold){
		HSSFFont font = workbook.createFont();
		//字号 是14号 -->对应的short 宽度 是 14好字体
		font.setFontHeight((short)((size== null  || size ==0 )?280:size*20));
		font.setBoldweight(isBold?HSSFFont.BOLDWEIGHT_BOLD:HSSFFont.BOLDWEIGHT_NORMAL);
		//将字体颜色变红色
//		short colors = HSSFColor.RED.index;
		font.setColor(color== null?HSSFColor.BLACK.index:color);
		return font;
	}
	

	/**
	 * 判断我们的数据 中，是否有中文字符
	 * @param str
	 * @return
	 */
	public static boolean isChineseChar(char str){
		boolean flag = false;
		Pattern pattern = Pattern.compile("[\u4e00-\u9fa5]");
		if(pattern.matcher(str+"").find()){
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 得到宋体10 号 黑色
	 * 默认字体的大小就是10 号 
	 * @return
	 */
	public static HSSFFont getSong10(HSSFWorkbook workbook){
		return creatFont(workbook,"宋体", 10, null,false);
	}
	
	/**
	 * 得到宋体10 号  红色加粗
	 * @return
	 */
	public static HSSFFont getSongRed10(HSSFWorkbook workbook){
		return creatFont(workbook,"宋体", 10, HSSFColor.RED.index,true);
	}

	/**
	 * 将Map
	 * @param map
	 * @return
	 */
	public static Map<String,String> reverseMap(Map<String,String> map){
		Map<String,String> newMap = null;
		//将便利的结果重新装填一下
		if(map != null  && map.size() >0){
			newMap = new LinkedHashMap<String, String>();
			for(Map.Entry<String, String> entry:map.entrySet()){
				newMap.put(entry.getValue(), entry.getKey());
			}
		}
		return newMap;
	}
}

