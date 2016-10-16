package com.yellowcong.utils;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigInteger;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.mapping.Array;

import com.sun.xml.internal.messaging.saaj.util.ByteInputStream;

/**
 * 文件的 分割 合并
 * 文件的 md5
 * 获取文件的 md5
 * @author yellowcong
 * @date 2016年4月17日
 *
 */
public class FileUtils {
	//文件夹信息
	private static List<String> dirNames= null;
	//文件信息
	private static List<String> fileNames = null;
	
	//文件大小单位 ，我们可以通过添加SizeStr 来添加单位
	private static String [] sizeStr = {"B","KB","MB","GB","PB"}; 
	private static int count =0;
	private static long fileSize = 0;

	private FileUtils(){}
	
	/**
	 * 获取类路径下文件的路径
	 * @param fileName
	 * @return
	 */
	public static String getClassPathFilePath(String fileName){
		String path = FileUtils.class.getClassLoader().getResource(fileName).getPath().toString();
		if(path.contains("%20")){
			path = path.replace("%20", " ");
		}
		return path;
	}
	
	/**
	 * 获取文件对象
	 * @param fileName
	 * @return
	 */
	public static File getClassPathFile(String fileName){
		return new File(FileUtils.getClassPathFilePath(fileName));
	}
	
	/*在类路径创建我们的 文件夹*/
	/**
	 * 创建类路径下面的文件夹
	 * @param directory
	 */
	public static String mkClassPathDir(String directory){
		String path = FileUtils.class.getClassLoader().getResource("").getPath();
		path += directory;
		File file = new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		return path;
	}
	
	/**
	 * 获取类文件的输入流
	 * @param fileName
	 * @return
	 */
	public static InputStream getClassPathFileInputStream(String fileName){
		return FileUtils.class.getResourceAsStream(fileName);
	}
	
	
	/**
	 * 将File 文件转化为 字符串
	 * @param filePath
	 * @return
	 */
	public static String copyFileToString(String filePath){
		return FileUtils.getFileContent(filePath);
	}
	
	/**
	 * 获取一个文本文件里面的内容
	 * @param filePath
	 * @return
	 */
	public static String getFileContent(String filePath){
		FileReader in  = null;
		BufferedReader reader = null;
		try {
			in  = new FileReader(new File(filePath));
			reader = new BufferedReader(in);
			String line = null;
			StringBuffer str = new StringBuffer();
			while((line = reader.readLine())!= null){
				str.append(line);
				str.append("\r\n");
			}
			return str.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(in != null){
					in.close();
				}
				if(reader != null ){
					reader.close();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	/**
	 * 获取 web目录下的路径，便于上传
	 * @param str
	 * @param request
	 * @return
	 */
	public static String getWebFilePath(String str,HttpServletRequest request){
		//这个直接获取的方法已经过期了
//		return request.getRealPath(str);
		return request.getSession().getServletContext().getRealPath(str);
	}
	
	/**
	 * 通过 路径来创建文件
	 * @param path
	 */
	public static void createDirectory(String path){
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
	}
	
	/**
	 * 通过文件夹  获取文件夹 当前目录 和下面目录所有的文件 
	 * @param path
	 * @param isNowPath 目录级别  当前目录 数据 
	 * @return
	 */
	//获取所有文件
	public static List<String> getChildFiles(String path,boolean isNowPath){
		if(!new File(path).exists()){
			throw new RuntimeException(path+"，文件夹不存在");
		}
		if(!new File(path).isDirectory()){
			throw new RuntimeException(path+"，不是文件夹");
		}
		fileNames = new ArrayList<String>();
		listAllFile(path,isNowPath);
		return fileNames;
	}
	
	/**
	 * 通过文件夹  获取文件夹 当前目录 和下面目录所有的文件 
	 * @param path
	 * @return
	 */
	public static List<String> getChildFiles(String path){
		return getChildFiles(path, false);
	}
	
	
	
	/**
	 * 通过文件夹 获取
	 * 所有的文件夹
	 * @param path 目录名称
	 * @param isNowPath 是否是当前目录
	 * @return
	 */
	public static List<String> getChildDirs(String path,boolean isNowPath){
		if(!new File(path).exists()){
			throw new RuntimeException(path+"，文件夹不存在");
		}
		if(!new File(path).isDirectory()){
			throw new RuntimeException(path+"，不是文件夹");
		}
		dirNames = new ArrayList<String>();
		listAllDir(path,isNowPath);
		return dirNames;
	}
	/**
	 * 通过文件夹 获取 我们的子 
	 * 所有的文件夹  
	 * @param path 目录名称
	 * @return
	 */
	public static List<String> getChildDirs(String path){
		return getChildDirs(path, false);
	}
	/**
	 * 获取某个文件夹下面的文件
	 * 其中文件夹包含了第一个文件夹就是自己 重复调用
	 * 
	 * @param path 文件夹路径名称
	 */
	private static void listAllFile(String path,boolean isNowPath){
		File file = new File(path);
		if(file.isDirectory()){
				for(File f:file.listFiles()){
					if(isNowPath){
						if(f.isFile()){
							fileNames.add(f.getPath());
						}
					}else{
						listAllFile(f.getPath(),isNowPath);

					}
				}
		}else{
			fileNames.add(path);
		}
	}
	/**
	 * 获取某个文件夹下面的文件
	 * 其中文件夹包含了第一个文件夹就是自己 重复调用
	 * 
	 * @param path 文件夹路径名称
	 * @param isNowPath 是否是当前目录 ，包含子目录
	 */
	private static void listAllDir(String path,boolean isNowPath){
		File file = new File(path);
		if(file.isDirectory()){
			dirNames.add(path);
			for(File f:file.listFiles()){
				if(isNowPath){
					dirNames.add(f.getPath());
				}else{
					listAllDir(f.getPath(),isNowPath);
				}
				
			}
		}
	}
	
	/**
	 * 获取所有的文件，包括 文件夹的信息
	 * @param path
	 * @return
	 */
	public static List<String> listAllFiles(String path){
		 List<String> strs = FileUtils.getChildDirs(path);
		 strs.addAll(FileUtils.getChildFiles(path));
		 FileUtils.getChildFiles(path);
		 return strs;
	}
	/**
	 * 文件分类获取
	 * @param isNowPath 是否 只是当前目录
	 * 
	 * String  文件类型  txt doc 等等
	 * List<String> 存的路径
	 * 
	 * jpg xxx.xx
	 * 	   xx.xx
	 * 
	 * 
	 * @return
	 */
	public static Map<String,List<String>> getFilesTypeMap(String path,boolean isNowPath){
		if(!new File(path).exists()){
			throw new RuntimeException(path+"，文件夹不存在");
		}
		List<String> str = FileUtils.getChildFiles(path,isNowPath);
		Map<String,List<String>> map = new HashMap<String, List<String>>();
		for(String val:str){
			String type = StringUtil.getFileTypeByPath(val);
			if(map.get(type) == null){
				List<String> names = new ArrayList<String>();
				names.add(val);
				map.put(type, names);
			}else{
				List<String> names =map.get(type);
				names.add(val);
				map.put(type, names);
			}
		}
		return map;
	}
	/**
	 * 获取所有目录级别下面的数据
	 * @param path
	 * @return
	 */
	public static Map<String,List<String>> getFilesTypeMap(String path){
		return getFilesTypeMap(path, false);
	}
	
	/**
	 * 获取目录下文件下面 某个类型的数据
	 * @param path
	 * @param type 文件类型
	 * @param isNowPath 是否是 当前目录 ， 不是所有 目录
	 * @return
	 */
	public static List<String> getFilesByType(String path,boolean isNowPath,String [] types){
		List<String> list = null;
		if(types != null && types.length >0){
			Map<String,List<String>> map = getFilesTypeMap(path,isNowPath);
			list = new ArrayList<String>();
			for(String type:types ){
				if(map.get(type)!= null){
					list.addAll(map.get(type));
				}
			}
		}else{
			//如果没有说明 就是所有数据都要
			 listAllFile(path, false);
			 list = fileNames;
		}
		return list;
	}
	
	/**
	 * 获取目录下文件下面 某个类型的数据
	 * @param path
	 * @param type 文件类型
	 * @return
	 */
	public static List<String> getFilesByType(String path,String [] types){
		return getFilesByType(path, false, types);
	}
	
	/**
	 * 将InputStream  转化为输出数据
	 * @param in 输入流
	 * @param file 输出的文件对象
	 */
	public static void copyInputStreamToFile(InputStream in ,File file){
		OutputStream out= null;
		try {
			out = new FileOutputStream(file);
			byte[] buff = new byte[1024];
			int len = 0;
			while ((len = in.read(buff)) > 0) {
				out.write(buff, 0, len);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(in != null){
					in.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}finally{
				try {
					if(out != null){
						out.close();
					}
				} catch (Exception e3) {
					// TODO: handle exception
				}
			}
		}
		
	}
	

	/**
	 * 将字符数据转化为我们的文件
	 * @param data 字节数组
	 * @param file 输出文件
	 */
	public static void copyByte2File(byte [] data,File file){
		if ((data == null) || (data.length <= 0))
			return;
		
		OutputStream out = null;
		InputStream in = null;
		try {
			out = new FileOutputStream(file);
			in = new ByteInputStream(data,data.length );
			byte [] buff = new byte[1024];
			int len =  0;
			while((len = in.read(buff))>0){
				out.write(buff, 0, len);
			}
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(in != null){
					in.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}finally{
				try {
					if(out != null){
						out.close();
					}
				} catch (Exception e3) {
					// TODO: handle exception
				}
			}
		}
	}
	
	/**
	 * 将InputStream 转化为字节码文件
	 * @return 
	 */
	public static byte[] copyFileToByteArray(File file){
		InputStream  in = null;
		try {
			in = new FileInputStream(file);
			//获取字节码的数量，将字节码装
			int len = in.available();
			byte [] result = new byte[len];
			in.read(result);
			return result;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(in != null){
					in.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
		
	}
	/**
	 * 将InputStream 转化为字节码文件
	 * @return 
	 */
	public static byte[] copyInputStreamToByteArray(InputStream in){
		try {
			//获取字节码的数量，将字节码装
			int len = in.available();
			byte [] result = new byte[len];
			in.read(result);
			return result;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(in != null){
					in.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
		
	}
	/**
	 * xx "B","KB","MB","GB","PB"
	 * 
	 * 计算文件大小
	 * @param size
	 */
	private static void getFileSize(long size){
		long result  = size/1024;
		if(result >=1 && count <(sizeStr.length-2)){
			fileSize = size/1024;
			count = count +1;
			getFileSize(fileSize);
		}else{
			fileSize = size;
		}
	}
	
	/**
	 * 
	 * xx "B","KB","MB","GB","PB"
	 * 
	 * 计算文件大小
	 * 我们用的时候，对于 静态的数据，需要清空 或者重新初始化，解决多次使用，导致数据堆积问题
	 * @param fileSize
	 * @return
	 */
	public static String getFileSizeStr(long filesize){
		if(filesize <0){
			throw new RuntimeException("文件大小有问题");
		}
		//多次使用的时候，这个 就会用问题了，一定要清空
		count = 0;
		fileSize= 0;
		getFileSize(filesize);
		return fileSize+sizeStr[count];
	}
	
	/**
	 * 文件分割
	 * String pathname = "E:\\迅雷下载\\疯狂动物城.Zootopia.2016.HDCAM.XVID.AC3.中文字幕[rarbt]\\疯狂动物城.Zootopia.2016.HDCAM.XVID.AC3.中文字幕[rarbt].mp4";
	 * 给定文件进行分割，默认分割的大小是500MB
	 * @return 切割的文件名称
	 * @throws Exception
	 */
	public static String[] partitionFile(String pathname){
		return partitionFile(1024*1024*500,pathname) ;
	}
	
	/**
	 * 文件分割
	 * @param partSize
	 * @param pathname
	 * @return 
	 * @throws Exception
	 */
	public static String[] partitionFile(int partSize,String pathname){
		DataInputStream in  = null;
		String [] names = null;
		try {
			//DataOutputStream
			//通过DataOutputStream 这个对象完成文件的分割
			//缓存
			byte [] buff = null;
			File file = new File(pathname);
			//long size = file.length();
			//1024*1024 就是 1MB
			//System.out.println(size/1024/1024);
			names = getPartitionFileNames(pathname, partSize);
			
			in = new DataInputStream( new FileInputStream(file));
			DataOutputStream out = null;
			for(String name:names){
				buff = new byte[1024];
				System.out.println(name);
				out = new DataOutputStream(new FileOutputStream(new File(name)));
				long size = partSize;
				while(size >0){
					//当没有读取完的情况
					if(in.read(buff) != -1){
						out.write(buff, 0, buff.length);
					}
					size = size-buff.length;
				}
				
				out.close();
			}
		} catch (Exception e) {
			throw new RuntimeException("分割失败");
		}finally{
			try {
				if(in!= null ){
					in.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return names;
	}
	
	/**
	 * 新建md5文件
	 * @param pathname 需要新建md5的文件名称
	 * 
	 * 创建的文件在那个目录中，然后文件的名称，添加了一个_md5
	 */
	public static void newMD5(String pathname){
		String newFileName = StringUtil.getFileSimpleName(pathname)+"_yellowcong_md5."+StringUtil.getFileType(pathname);
		System.err.println("修改前MD5值\t"+FileUtils.getMd5(pathname));
		FileUtils.newMD5(pathname, newFileName);
		System.err.println("修改后MD5值\t"+FileUtils.getMd5(newFileName));
	}
	
	/**
	 * 获取文件的MD5
	 * @param filename 文件的名称，全路径的
	 * @return
	 */
	public static  String getMd5(String filename) {  
        String value = null;  
        FileInputStream in = null;  
        File file = new File(filename);
	    try {  
	    	in = new FileInputStream(file);
	        MappedByteBuffer byteBuffer = in.getChannel().map(FileChannel.MapMode.READ_ONLY, 0, file.length());  
	        MessageDigest md5 = MessageDigest.getInstance("MD5");  
	        md5.update(byteBuffer);  
	        BigInteger bi = new BigInteger(1, md5.digest());  
	        value = bi.toString(16);  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    } finally {  
	            if(null != in) {  
	                try {  
	                in.close();  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
	    return value;  
    }  
	/**
	 * 给文件生成新的md5验证码
	 * @param pathname 文件的全路径
	 * @param newFileName  新文件的全路径
	 */
	public static void newMD5(String pathname,String newFileName){
		//String pathname = "E:\\迅雷下载\\疯狂动物城.Zootopia.2016.HDCAM.XVID.AC3.中文字幕[rarbt]\\疯狂动物城.Zootopia.2016.HDCAM.XVID.AC3.中文字幕[rarbt].mp4";
		String [] names = FileUtils.partitionFile(pathname);
		String newFile = pathname+".txt";
		FileUtils.copyStringToFile(UUID.randomUUID().toString(), newFile);
		
		//解决 md5 修改
		String [] newNames = new String[names.length+1];
		System.out.println(newNames.length);
		for(int i=0;i<names.length;i++){
			newNames[i] = names[i];
		}
		
		newNames[names.length] = newFile;
		//文件合并
		FileUtils.uniteFile(newNames, newFileName);
		//删除所有文件
		FileUtils.deletes(newNames);
	}
	/**
	 * 删除多个文件
	 * @param fileNames
	 */
	public static void deletes(String [] fileNames){
		//删除文件
		for(String path:fileNames){
			new File(path).delete();
		}
	}
	/**
	 * 合并文件
	 * @param files 多个子文件
	 * @param newFile 新的文件
	 * @throws Exception 异常
	 */
	public static void uniteFile(String[] files, String newFile) {
		DataOutputStream out = null;
		try {
			out = new DataOutputStream(new FileOutputStream(new File(newFile)));
			for(String name:files){
				FileInputStream in = new FileInputStream(new File(name));
				byte [] buff = new byte[1024];
				while((in.read(buff)) != -1){
					out.write(buff,0,buff.length);
				}
				in.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
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
	
	/**
	 * 根据给定的每个文件的大小来获取文件的数目
	 * @param pathname 文件名称
	 * @param partSize 每个部分的大小
	 * @return
	 */
	public static String [] getPartitionFileNames(String pathname,long partSize){
		File file = new File(pathname);
		long size = file.length();
		double num = (size/(double)partSize);
		//向上取整数
		num = Math.ceil(num);
		String [] names = new String [(int)num] ;
		for(int i=0;i<num;i++){
			names[i] = StringUtil.getFileSimpleName(pathname)+"_"+i+"."+StringUtil.getFileTypeByPath(pathname);
		}
		return names;
	}
	
	/**
	 * 将String类型的数据直接转化为文本数据
	 * @param str
	 * @param filename
	 */
	public static void copyStringToFile(String str,String filename){
		FileWriter out = null;
		try {
			//将Str 转化为文件
			 out= new FileWriter(new File(filename));
			char []  chars = str.toCharArray();
			out.write(chars,0,chars.length);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				if(out != null){
					out.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
	/**
	 * 将InputStream 的数据转化为String类型的数据
	 * @param in 输入数据
	 * @param encoding  编码方式gb2312,utf-8 
	 * @return String
	 */
	public static String copyInput2String(InputStream in,String encoding){
		String str = null;
		try {
			//写数据
			String line = null;
			BufferedReader reader = new BufferedReader(new InputStreamReader(in,encoding));
			    
			StringBuffer sb = new StringBuffer();
			while((line = reader.readLine())!= null){
				 sb.append(line);
			}
			str = sb.toString();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				if(in != null){
					in.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return str;
	}
	
	/**
	 * 将InputStream 的数据转化为String类型的数据,设定默认的编码编码方式为UTF-8
	 * @param in 输入数据
	 * @return String
	 */
	public static String copyInput2String(InputStream in){
		return FileUtils.copyInput2String(in,"UTF-8");
	}
}
