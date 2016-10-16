package com.yellowcong.utils;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.NRTManager;
import org.apache.lucene.search.NRTManagerReopenThread;
import org.apache.lucene.search.SearcherManager;
import org.apache.lucene.search.SearcherWarmer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.chenlb.mmseg4j.analysis.MMSegAnalyzer;

/**
 * 建立索引管理的类
 * @author yellowcong
 * @date 2016年1月4日
 *
 */
public class LuceneContext{
	private static LuceneContext context = null;
	//定义索引文件地址
	private static String indexPath = FileUtils.mkClassPathDir("index");
	//字典目录
	private static String dicPath = FileUtils.getClassPathFilePath("data");
	//分词器
	private static Analyzer analyzer;
	//版本
	private static Version version;
	//写
	private static IndexWriter writer;
	private static NRTManager nrtMgr;
	private static SearcherManager mgr;
	//索引存放的Directory
	private static Directory directory;
	private LuceneContext(){}
	
	/**
	 * 获取实例化对象
	 * @return
	 */
	public static LuceneContext getInstance(){
		if(context == null){
			init();
			context = new LuceneContext();
		}
		return context;
	}
	
	/**
	 * 初始化
	 */
	private static void init() {
		try {
			directory = FSDirectory.open(new File(indexPath));
			//版本
			version = Version.LUCENE_35;
			//分词器
			analyzer = new MMSegAnalyzer(dicPath);
			//IndexWriter 
			writer = new IndexWriter(directory,new IndexWriterConfig(version,analyzer));
			//NRTManager 这个包实现了所有的IndexWriter 的方法
			nrtMgr = new NRTManager(writer, new SearcherWarmer() {
				@Override
				public void warm(IndexSearcher arg0) throws IOException {
//					System.out.println("重新开启");
				}
			});
			//获取SearchManager
			mgr = nrtMgr.getSearcherManager(true);
			
			NRTManagerReopenThread reopenThread = new NRTManagerReopenThread(nrtMgr, 5.0,0.025);
			reopenThread.setName("NRTManager 管理器");
			//设定为后台线程
			reopenThread.setDaemon(true);
			//启动线程
			reopenThread.start();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取我们的查询工具
	 * @return IndexSearcher
	 */
	public IndexSearcher getIndexSearcher(){
		return mgr.acquire();
	}
	
	/**
	 * 释放资源  不能 直接至为Null
	 * @param searcher
	 */
	public void releaseSearcher(IndexSearcher searcher) {
		try {
			mgr.release(searcher);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 提交索引
	 */
	public void commitIndex() {
		try {
			writer.commit();
			writer.forceMerge(3);
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public NRTManager getNRTManager() {
		return nrtMgr;
	}
	/**
	 * 获取版本
	 * @return
	 */
	public Version getVersion() {
		return version;
	}
	
	public Analyzer getAnalyzer() {
		return analyzer;
	}
	public void deleteAll(){
		try {
			nrtMgr.deleteAll();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
