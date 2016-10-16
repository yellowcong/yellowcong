package com.yellowcong.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.model.PicturesTable;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.w3c.dom.Document;

import com.sun.xml.internal.messaging.saaj.util.ByteInputStream;
import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

/**
 * doc文档操作
 * 依赖
 * poi-3.13.jar
 * poi-scratchpad-3.13.jar
 * commonbean.jar
 * 
 * @author yellowcong
 * @date 2016年1月8日
 * 
 * 重要方法
 * copyDocToHtml 将文档转化为html
 * 这个将doc转化为html的文档，没有分页的功能和图片裁减功能，所以导致的显示结果并非很理想
 * 
 * copyHtmlToDoc 将html转化为文档
 * 
 * 这个copyHtmlToDoc的方法还没有写完，比较的麻烦，所以需要慢慢的弄好
 *
 */
public class DocUtils {
	//用于存储我们的文件的前缀名称，有内部类，所以需要加入static才可以访问
	static String prefixName = "";
	private DocUtils(){}
	
	
	/**
	 * 将我们的doc转化为html文档
	 * 这个直接输入我们的doc地址，然后就在那个地址下面生成对应的文件，简单方便
	 * @param file  doc文件
	 */
	public static void copyDocToHtml(File file){
		String name = StringUtil.getFileSimpleName(file.getPath())+".html";
		DocUtils.copyDocToHtml(file, new File(name));
	}
	
	/**
	 * 将doc转化为html 
	 * @param file 我们的 doc文档
	 * @param tagart 生成的文档
	 */
	public static void copyDocToHtml(File file,File tagart){
		
		try {
			//获取文件夹名称
			prefixName = FilenameUtils.getBaseName(tagart.getName());

			//如果没有，就创建目标文件夹
			//simpleName  这种方法会去掉  后缀名称
			File imgFile = new File(StringUtil.getFileSimpleName(tagart.getPath()));
			if(!imgFile.exists()){
				imgFile.mkdirs();
			}
			
			HWPFDocument doc = new HWPFDocument(new FileInputStream(file));
			//初始化转换器
			WordToHtmlConverter converter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
			//设定图片管理
			converter.setPicturesManager(new PicturesManager() {
				
				@Override
				public String savePicture(byte[] paramArrayOfByte,
						PictureType paramPictureType, String paramString,
						float paramFloat1, float paramFloat2) {
					//设定图片路径傻的
					return prefixName+File.separator+paramString;
				}
			});
			
			converter.processDocument(doc);
			//设定图片
			List<Picture> pics = DocUtils.listDocPics(doc);
			//存储图片，根据给定的名称
			for(Picture pic:pics){
				pic.writeImageContent(new FileOutputStream(new File(imgFile,pic.suggestFullFileName())));
			}
			
			//导入w3c的document包
			Document docHtml = converter.getDocument();
			
			ByteOutputStream out  = new ByteOutputStream();
			
			DOMSource source = new DOMSource(docHtml);
			
			StreamResult result = new StreamResult(out);
			
			TransformerFactory tf =TransformerFactory.newInstance();
			Transformer trans = tf.newTransformer();
			trans.setOutputProperty(OutputKeys.INDENT, "yes");
			trans.setOutputProperty(OutputKeys.METHOD, "html");
			trans.setOutputProperty(OutputKeys.INDENT, "yes");
			
			trans.transform(source, result);
			//输出文件
			DocUtils.copyByte2File(out.toByteArray(),tagart);
			out.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerFactoryConfigurationError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * 将html转化为doc文档
	 */
	public static void copyHtmlToDoc(){
		
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
	 * 将文档中的图片存到文件夹中
	 * @param pics 图片集合
	 * @param path 文件存储路径
	 */
	public static void copyPic2Disk(List<Picture> pics,File path){
		if(pics == null  || pics.size()  <=0){
			return;
		}
		if(!path.isDirectory()){
			throw new RuntimeException("路径填写不正确");
		}
		//当文件夹路径不存在的情况下，我们自己创建文件夹目录
		if(!path.exists() ){
			path.mkdirs();
		}
		
		try {
			for(Picture pic:pics){
				pic.writeImageContent(new FileOutputStream(new File(path,UUID.randomUUID()+".jpg")));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 获取一个文档中的所有图片资源信息
	 * @param doc
	 * @return List<Picture> 图片文件集合
	 */
	public static List<Picture> listDocPics(HWPFDocument doc){
		return doc.getPicturesTable().getAllPictures();
	}
	
	/**
	 * 获取一个文档中的所有 表格资源信息
	 * @param doc
	 * @return List<Table> 图片文件集合
	 */
	public static List<Table> listDocTables(HWPFDocument doc){
		//
		TableIterator it = new TableIterator(doc.getRange());
		List<Table> tables = new ArrayList<Table>();
		while(it.hasNext()){
			tables.add(it.next());
		}
		return tables;
		
	}
	
	/**
	 * 格式化输出我们的表格，添加样式数据
	 */
	public static void tableFormat(){
		
	}
	
	/**
	 * 定义图片的类型，供html 转 doc用
	 * @author yellowcong
	 * @date 2016年1月8日
	 *
	 */
	static class ImageType{
		//图片高度
		private int height;
		//图片宽度
		private int width;
		//图片类型  jpg png啥的
		private String type;
		//图片的数据
		private byte [] data;
		public int getHeight() {
			return height;
		}
		public void setHeight(int height) {
			this.height = height;
		}
		public int getWidth() {
			return width;
		}
		public void setWidth(int width) {
			this.width = width;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public byte[] getData() {
			return data;
		}
		public void setData(byte[] data) {
			this.data = data;
		}
	}
}
