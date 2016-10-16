package com.yellowcong.utils;

import java.awt.Desktop;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;

/**
 * 文件解压工具 最开始这个类是为了做一个jar包的解压，然后获取里面的字节码，然后获取字节码 class--> java这个对象，然后 获取
 * java里面的东西 但是由于反编译的不好弄，所以没办法解决了
 * 
 * @author yellowcong
 * @date 2016年1月6日
 *
 */
public class ZipUtils {

	private ZipUtils() {
	}

	/**
	 * 这个方法可以用来扩展到   解压多个文件   解压一个文件夹等问题
	 * 默认解压 会解压到本地，目录下的文件名的文件夹
	 * @param file 某个压缩文件
	 */
	public static void unZip(File file) {
		ZipUtils.unZip(file, null);
	}
	
	
	/**
	 * 解压文件
	 * @param file 解压的文件
	 * @param unZipPath 解压的路径
	 */
	public static void unZip(File file,File unZipPath) {
		if(!file.exists()){
			throw new RuntimeException(file.getName()+"不存在");
		}
		if(file.isDirectory()){
			throw new RuntimeException(file.getName()+"是目录，不是文件");
		}
		if(unZipPath != null && !unZipPath.exists()){
			unZipPath.mkdirs();
		}
		try {
			
			// 当前目录下 文件夹
			String unzipPath = "";
			//这个unziPath 就是我们的天的文件夹路径 ，然后这个压缩，没有必要 去命名 来修改 unzipPath 这个对象
			if(unZipPath == null){
				unzipPath = StringUtil.getFileSimpleName(file.getPath());
			}else{
				unzipPath = unZipPath.getPath()+File.separator+StringUtil.getFileSimpleName(file.getName());
			}
			//获取文件
			ZipFile zipFile = new ZipFile(file);
			@SuppressWarnings("unchecked")
			Enumeration<ZipEntry> enums = (Enumeration<ZipEntry>) zipFile
					.entries();
			while (enums.hasMoreElements()) {
				ZipEntry entry = enums.nextElement();
				if (!entry.isDirectory()) {
					// 获取压缩 文件对象
					File zFile = new File(entry.getName());
					String parentPath = unzipPath;
					//当文件目录在根目录的情况
					if(zFile.getParent() !=null){
						parentPath = unzipPath+File.separator+zFile.getParent();
					}
					// 获取父类文件名称
					File parentDir = new File(parentPath);
					// 获取输出的文件名称
					File outFile = new File(parentDir, zFile.getName());
					if (!parentDir.exists()) {
						parentDir.mkdirs();
					}
					
					// 获取数据流
					InputStream in = zipFile.getInputStream(entry);
					//通过common io中的FileUtils 就可以完成我们的文件解压操作
					FileUtils.copyInputStreamToFile(in, outFile);
					//写数据
					/*OutputStream out = new FileOutputStream(outFile);
					byte[] buff = new byte[1024];
					int len = 0;
					while ((len = in.read(buff)) > 0) {
						out.write(buff, 0, len);
					}
					in.close();
					out.close();*/
				}
			}
			System.out.println("---------------------解压成功------------------------");
			System.out.println(new Date().toLocaleString()+"\t解压目录"+unzipPath);
			openFileDialog(new File(unzipPath));
		} catch (ZipException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 压缩文件默认存储在上级目录
	 * 如果点击的是  yellow.jpg --->yellow.zip
	 * 如果点击的是文件夹  yellowcong -->yellowcong.zip
	 * @param file 可以是 文件  也可以是文件夹
	 */
	public static void zip(File file){
		ZipUtils.zip(file, null);
	}
	
	public static void zip(File file,File newPath,String newName){
		if(!file.exists()){
			throw new RuntimeException(file.getPath()+",文件夹不存在");
		}
		//当新路径不存在的时候，就创建
		if(newPath != null && !newPath.exists()){
			newPath.mkdirs();
		}
		ZipOutputStream  out = null;
		try {
			//父类目录
			String baseDir = file.getParent();
			//压缩文件对象
			File zipFile = null;
			String zipName =  StringUtil.getFileSimpleName(file.getName())+".zip";
			if(newName != null){
				zipName = newName+".zip";
			}
			if(newPath == null){
				zipFile = new File(file.getParent()+File.separator+zipName);
			}else{
				zipFile = new File(newPath.getPath()+File.separator+zipName);
			}
			out = new ZipOutputStream(new FileOutputStream(zipFile));
			//当压缩的对象是文件夹的情况，
			if(file.isDirectory()){
				//获取文件夹的 文件夹个数
				List<String> dirNames = com.yellowcong.utils.FileUtils.getChildDirs(file.getPath());
				//获取文件个数
				List<String> fileNames = com.yellowcong.utils.FileUtils.getChildFiles(file.getPath());
				
				//添加文件信息
				if(dirNames != null && dirNames.size() >0){
					for(String str:dirNames){
						String dirName = str.substring(baseDir.length()+1)+File.separator;
						out.putNextEntry(new ZipEntry(dirName));
					}
				}
				
				//文件对象添加
				if(fileNames != null && fileNames.size() >0){
					for(String str:fileNames){
						String fileName = str.substring(baseDir.length()+1);
						out.putNextEntry(new ZipEntry(fileName));
						ZipUtils.writerZipFile(out, str);
					}
				}
			}else{
				//当时一个文件的时候，直接写出去
				String fileName = file.getName();
				out.putNextEntry(new ZipEntry(fileName));
				ZipUtils.writerZipFile(out, file.getPath());
			}
			if(newPath != null){
				//打开文件夹
				ZipUtils.openFileDialog(newPath);
			}else{
				//打开文件夹
				ZipUtils.openFileDialog(file.getParentFile());
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	/**
	 * 压缩文件 ,使用默认文件名称
	 * @param file 压缩文件 或者文件夹
	 * @param newPath  新的压缩地址
	 */
	public static void zip(File file,File newPath){
		ZipUtils.zip(file, newPath, null);
	}
	
	/**
	 * 写文件到zip中 
	 * @param out  这个是ZipOutputStream对象
	 * @param path  文件在zip包中的目录
	 */
	private static void writerZipFile(ZipOutputStream out,String path){
		InputStream in = null;
		try {
			byte [] buff = new byte[1024];
			int len =0;
			in = new FileInputStream(path);
			while((len =  in.read(buff))>0){
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
			}
		}
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
	 * 打开文件管理器 
	 * @param file
	 */
	public static void openFileDialog(File file){
		if(!file.exists()){
			throw new RuntimeException(new Date().toLocaleString()+"  文件路径不存在" );
		}
		if(!file.isDirectory()){
			throw new RuntimeException(new Date().toLocaleString()+"  只能打开文件夹，不可以打开文件" );
		}
		try {
			String osname = System.getProperty("os.name").toLowerCase();
			String [] cmd = new String [2];
			if(osname.startsWith("windows")){
				cmd[0] ="explorer";
			}else{
				//unix的情况
				cmd[0] ="netscape";
			}
			cmd[1] = file.getPath();
			//通过cmd的直接 打开，这个 是window的， 没有 想到我们的linux
//			String [] cmd = new String[]{"cmd","/c","start"," ",file.getPath()};
			Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 给定一个 http://xx路径  供浏览器打开
	 * @param url
	 */
	public static void openBrowser(String url){
		try {
			Desktop.getDesktop().browse(new URI(url));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
