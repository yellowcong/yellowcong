package com.yellowcong.utils;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.NumericField;
import org.apache.lucene.document.NumericField.DataType;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.jdbc.JdbcDirectory;
import org.apache.lucene.store.jdbc.JdbcStoreException;
import org.apache.lucene.util.Version;
import org.springframework.beans.BeansException;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chenlb.mmseg4j.analysis.MMSegAnalyzer;
import com.yellowcong.model.Pager;
import com.yellowcong.model.SystemContext;

/**
 * 索引工具包
 * 高亮显示的是我们的查询数据对象
 * 
 * 有个很神奇的问题，当我们导入了POI3.13的jar包的时候，解析docx的文档就会出现问题，真是菊花疼
 * @author yellowcong
 * @date 2016年1月4日
 *
 */
public class IndexUtils {
	//定义索引文件地址
	private static String indexPath = FileUtils.mkClassPathDir("index");
	//字典目录
	private static String dicPath = FileUtils.getClassPathFilePath("data");
	private static IndexReader reader =null ;
	private static MMSegAnalyzer analyzer = null;
	
	//定义我们的字典地址
	private IndexUtils(){
		
	}
	
	/**
	 * 获取我们的 IndexReader 
	 * @return
	 */
	public static IndexReader getIndexReader(){
		if(reader ==  null){
			try {
				reader = IndexReader.open(FSDirectory.open(new File(indexPath)));
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return reader;
	}
	
	/**
	 * 获取IndexSearcher
	 * 解决项目的同步更新的问题
	 * @return
	 */
	public static IndexSearcher getIndexSearch(){
		try {
			if(reader == null){
				reader = IndexReader.open(FSDirectory.open(new File(indexPath)));
			}else{
				//如果改变了，会返回一个新的对象，如果没有改变，会是原来的对象
				IndexReader tr = IndexReader.openIfChanged(reader); 
				if(tr !=null){
                     //将以前的Reader 删除
                    reader.close();
					reader = tr;
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(new Date().toLocaleString()+" : IndexReader 获取失败");
		}
		return new IndexSearcher(reader);
	}

	/**
	 * 其中有些项目只有一个IndexWriter ，我们需要将 Writer 提交  
	 * 获取我们的Writer
	 * @return
	 */
	public static IndexWriter getIndexWriter(){
		IndexWriter writer =null;
		try {
			writer = new IndexWriter(FSDirectory.open(new File(indexPath)), new IndexWriterConfig(Version.LUCENE_35,new MMSegAnalyzer(dicPath)));
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());		}
		return writer;
	}
	
	/**
	 * 写一篇文档数据
	 * @param document 一篇文档
	 */
	public static void writer(Document document ){
		try {
			getIndexWriter().addDocument(document, getAnalyzer());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 写我们的文档数据,写多篇文档
	 * @param documents 传入写入的数据几何
	 */
	public static void writer(List<Document> documents ){
			try {
				getIndexWriter().addDocuments(documents, getAnalyzer());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	/**
	 * 获取分词器
	 * @return
	 */
	public static MMSegAnalyzer getAnalyzer(){
		if(analyzer == null){
			analyzer = new MMSegAnalyzer(dicPath);
		}
		return analyzer;
	}
	
	/**
	 * 高亮显示 ,注意高亮显示不能操作没有存储的数据
	 * @param query 查询的Query　对象
	 * @param fieldName  查询的字段
	 * @param text 高亮的对象
	 * @return
	 */
	public static  String highlighter(Query query,String fieldName,String text){
		try {
			QueryScorer scorer = new QueryScorer(query);
			Formatter formatter = new SimpleHTMLFormatter("<span color='red'>", "</span>");
			Highlighter lighter = new Highlighter(formatter,scorer);
			lighter.setTextFragmenter(new SimpleSpanFragmenter(scorer));
			//获取高亮显示的结果
			String result = lighter.getBestFragment(IndexUtils.getAnalyzer(), fieldName, text);
			return result;
		} catch (Exception e) {
			throw new RuntimeException("高亮显示不能操作未存储的索引数据"+new Date().toLocaleString());		
		}
	}
	
	/**
	 * 写索引到硬盘中
	 *@param document 
	 */
	public static void writeIndex(Document document){
		try {
			IndexWriter writer = IndexUtils.getIndexWriter();
			writer.addDocument(document);
			writer.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	/**
	 * 一个字段的
	 * 通过传入 字段  和  字段对应的 值 来查询索引 ，返回文档
	 * @param field  字段     id ,content,filename,name 类似
	 * @param val  传递过来的值
	 * @param sort 排序的字段
	 * @return 
	 */
	public static List<Document> query(String field,String val,Sort sort){
		return query(new String[]{field}, val,sort);
	}
	
	/**
	 * 一个字段的
	 * 通过传入 字段  和  字段对应的 值 来查询索引 ，返回文档
	 * @param field  字段     id ,content,filename,name 类似
	 * @param val  传递过来的值
	 * @param isLight 是否高亮显示
	 * @param orderFields 排序字段
	 * @param reverse 是否倒叙 还是正顺序
	 * @return 
	 */
	public static List<Document> queryByOrder(String [] fields,String val,boolean isLight,String [] orderFields,boolean reverse){
		try {
			List<Document> docs = null;
			IndexSearcher searcher = IndexUtils.getIndexSearch();
			QueryParser parser = null;
			
			//多个条件 和一个条件的情况
			if(fields!= null && fields.length >1){
				parser = new MultiFieldQueryParser(Version.LUCENE_35, fields, getAnalyzer());
			}else{
				parser =new QueryParser(Version.LUCENE_35, fields[0], IndexUtils.getAnalyzer());
			}
			
			Query query = parser.parse(val);
			TopDocs topDocs = null;
			if(orderFields != null && orderFields.length >0){
				//这个是查询的 条数,可以修改
				topDocs = searcher.search(query, 10,getSort(fields, val, orderFields, reverse));
			}else{
				topDocs = searcher.search(query, 10);
			}
			if(topDocs.scoreDocs.length >0){
				docs = new ArrayList<Document>();
				
				for(ScoreDoc scoreDoc :topDocs.scoreDocs){
					Document document = searcher.doc(scoreDoc.doc);
					if(isLight){
						for(String field:fields){
							//获取高亮的结果
							String result = IndexUtils.highlighter(query, field, document.get(field));
							//设定document 的数据，将默认数据修改为我们的高亮数据
							document.getField(field).setValue(result);
						}
					}
					docs.add(document);
				}
			}
			return docs;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
	}
	
	/**
	 * 顺序查询数据 
	 * @param fields 查询的字段
	 * @param val  查询的值
	 * @param isLight  是否高亮显示   高亮 现实的数据需要被 Store.YES 才可以设定高亮
	 * @param orderFields  排序的字段
	 * @return
	 */
	public static List<Document> queryByOrderASC(String  field,String val,String orderField){
		return queryByOrder(new String[]{field}, val, false,new String[]{orderField},  false);
	}
	
	/**
	 * 顺序查询，带多条数据
	 * @param fields 查询的字段
	 * @param val  查询的值
	 * @param orderFields  排序的字段
	 * @return
	 */
	public static List<Document> queryByOrderASCLight(String  field,String val,String orderField){
		return queryByOrder(new String[]{field}, val, true,new String[]{orderField},  false);
	}
	/**
	 * 顺序查询 多条数据
	 * @param fields 查询多条数据
	 * @param val  查询的值
	 * @param isLight  是否高亮显示   高亮 现实的数据需要被 Store.YES 才可以设定高亮
	 * @param orderFields  排序的字段
	 * @return
	 */
	public static List<Document> queryByOrderASC(String []  fields,String val,String orderField){
		return queryByOrder(fields, val, false,new String[]{orderField},  false);
	}
	
	/**
	 * 带高亮的顺序排序
	 * @param fields
	 * @param val
	 * @param orderField
	 * @return
	 */
	public static List<Document> queryByOrderASCLight(String []  fields,String val,String orderField){
		return queryByOrder(fields, val, true,new String[]{orderField},  false);
	}
	/**
	 * 倒叙查询
	 * @param field 查询字段
	 * @param val 数据
	 * @param orderField 排序字段
	 * @return
	 */
	public static List<Document> queryByOrderDESC(String  field,String val,String orderField){
		return queryByOrder(new String[]{field}, val, false,new String[]{orderField},  true);

	}
	
	/**
	 * 带高亮的倒序
	 * @param field
	 * @param val
	 * @param orderField
	 * @return
	 */
	public static List<Document> queryByOrderDESCLight(String  field,String val,String orderField){
		return queryByOrder(new String[]{field}, val, true,new String[]{orderField},  true);

	}
	/**
	 * 倒叙查询  多条数据 数组
	 * @param fields 数组
	 * @param val
	 * @param orderField
	 * @return
	 */
	public static List<Document> queryByOrderDESC(String [] fields,String val,String orderField){
		return queryByOrder(fields, val, false,new String[]{orderField},  true);
	}
	
	/**
	 * 带高亮显示 的排序
	 * @param fields
	 * @param val
	 * @param orderField
	 * @return
	 */
	public static List<Document> queryByOrderDESCLight(String [] fields,String val,String orderField){
		return queryByOrder(fields, val, true,new String[]{orderField},  true);
	}
	/**
	 * 通过字段名称
	 * 来获取排序字段的 Sort类
	 * @param fields
	 * @param val 
	 * @param sortFields 排序字段   为空时，使用默认字段  Sort.RELEVANCE
	 * @param reverse 是否倒叙还是顺序
	 * @return 
	 */
	private static Sort getSort(String [] fields, String val,String [] sortFields, boolean reverse){
		List<Document> docs = query(fields, val);
		SortField [] sorts = null ;
		Sort sort = null;
		if(docs != null && docs.size()>0){
			Document doc  = docs.get(0);
			//获取到我们的字段类型
			if(sortFields != null && sortFields.length >0 ){
				sorts = new SortField[fields.length];
				int index= 0;
				for(String field :sortFields){
					//获取类 对象 
					String className = doc.getFieldable(field).getClass().getSimpleName();
					//获取数据类型
					String dataType = null;
					if(className.equals("NumericField")){
						NumericField nf = (NumericField) doc.getFieldable(field);
						//是int 还是LONG
						//INT, LONG, FLOAT, DOUBLE;
						dataType = nf.getDataType().toString();
					}if(className.equals("Field")){
						//String类型的数据
						dataType = "STRING";
						//对于String类型的 排序 选哟是 按照
					}
					
					Map<String,Integer> map = new HashMap<String,Integer>();
					map.put(DataType.LONG.toString(), SortField.LONG);
					map.put(DataType.INT.toString(), SortField.INT);
					map.put(DataType.DOUBLE.toString(), SortField.DOUBLE);
					map.put(DataType.FLOAT.toString(), SortField.FLOAT);
					map.put("STRING", SortField.STRING);
					//设定Sort
					sorts[index] = new SortField(field, map.get(dataType),reverse);
					index ++;
				}
				sort  = new Sort(sorts);
			}else{
				//当没有设定排序的时候，我们的系统默认的排序方法
				sort = Sort.RELEVANCE;
			}
		}
		return sort;
	}
	/**
	 * 默认查询不带排序的查询
	 * 通过传入 字段  和  字段对应的 值 来查询索引 ，返回文档
	 * @param field  字段     id ,content,filename,name 类似
	 * @param val  传递过来的值
	 * @return 
	 */
	public static List<Document> query(String field,String val){
		return query(new String[]{field}, val,null);
	}
	
	
	/**
	 * 不带高亮显示的查询
	 * @param fields 查询的字段  可以是数组
	 * @param val  查询的内容
	 * @param sort 排序
	 * @return
	 */
	public static List<Document> query(String [] fields,String val,Sort sort){
		return query(fields, val,false,sort);
	}
	
	/**
	 * 不带高亮显示的查询
	 * @param fields 查询的字段  可以是数组
	 * @param val  查询的内容
	 * @param sort 排序
	 * @return
	 */
	public static List<Document> query(String [] fields,String val){
		return query(fields, val,false,null);
	}
	
	
	//queryWithLight 带有分页查询的方法 有四个
	/**
	 * 带高亮显示的查询
	 * @param fields 字段 
	 * @param val 查询的数据
	 * @param sort 排序
	 * @return
	 */
	public static List<Document> queryWithLight(String [] fields,String val,Sort sort){
		return query(fields, val,true,sort);
	}
	
	/**
	 * 带高亮显示的查询 不带排序
	 * @param fields 字段 
	 * @param val 查询的数据
	 * @return
	 */
	public static List<Document> queryWithLight(String [] fields,String val){
		return query(fields, val,true,null);
	}
	
	/**
	 * 带高亮显示的查询,不带排序
	 * @param fields 字段 
	 * @param val 查询的数据
	 * @return
	 */
	public static List<Document> queryWithLight(String field,String val){
		return query(new String[]{field},val,true,null);
	}
	
	/**
	 * 带高亮显示的查询,不带排序
	 * @param fields 字段 
	 * @param val 查询的数据
	 * @param sort 带排序
	 * @return
	 */
	public static List<Document> queryWithLight(String field,String val,Sort sort){
		return query(new String[]{field},val,true,sort);
	}
	
	/**
	 * 精确  比如通过id查询,有设定的  
	 * 需要 设定不动的数据作为查询 NO_ANALYZE 才可以精确查询
	 * @param term 我们的查询数据
	 * @return
	 */
	public static List<Document> queryByTerm(Term term,Sort sort){
		try {
			List<Document> docs = null;
			IndexSearcher searcher = IndexUtils.getIndexSearch();
			Query query = new TermQuery(term);
			TopDocs topDocs =null; 
			if(sort != null){
				
				topDocs = searcher.search(query, 10,sort);
			}else{
				topDocs = searcher.search(query, 10);
			}
			if(topDocs.scoreDocs.length >0){
				docs = new ArrayList<Document>();
				
				for(ScoreDoc scoreDoc :topDocs.scoreDocs){
					Document document = searcher.doc(scoreDoc.doc);
					docs.add(document);
				}
			}
			return docs;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	/**
	 * 不带排序的查询
	 * @param term
	 * @return
	 */
	public static List<Document> queryByTerm(Term term){
		return queryByTerm(term, null);
	}
	/**
	 * 多个查询条件的情况
	 * @param fields 字段
	 * @param val 值
	 * @param isLight 是否高亮显示
	 * @param sort  排序字段
	 * @return
	 */
	public static List<Document> query(String [] fields,String val,boolean isLight,Sort sort){
		try {
			List<Document> docs = null;
			IndexSearcher searcher = IndexUtils.getIndexSearch();
			QueryParser parser = null;
			
			//多个条件 和一个条件的情况
			if(fields!= null && fields.length >1){
				parser = new MultiFieldQueryParser(Version.LUCENE_35, fields, getAnalyzer());
			}else{
				parser =new QueryParser(Version.LUCENE_35, fields[0], IndexUtils.getAnalyzer());
			}
			
			Query query = parser.parse(val);
			TopDocs topDocs = null;
			if(sort != null){
				//这个是查询的 条数,可以修改
				topDocs = searcher.search(query, 10,sort);
			}else{
				topDocs = searcher.search(query, 10);
			}
			if(topDocs.scoreDocs.length >0){
				docs = new ArrayList<Document>();
				
				for(ScoreDoc scoreDoc :topDocs.scoreDocs){
					Document document = searcher.doc(scoreDoc.doc);
					if(isLight){
						for(String field:fields){
							//获取高亮的结果
							String result = IndexUtils.highlighter(query, field, document.get(field));
							//设定document 的数据，将默认数据修改为我们的高亮数据
							document.getField(field).setValue(result);
						}
					}
					docs.add(document);
				}
			}
			return docs;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	

	/**
	 * 分页查询数据   分页数据查询中，不可以添加排序功能
	 * 通过searchAfter 这个方法，查询的数据没有排序功能
	 * @param fields 字段
	 * @param val 值
	 * @param isLight 是否高亮
	 * @return
	 */
	public static Pager<Document> queryByPager(String [] fields,String val,boolean isLight){
		//FIXME 搞定 分页查询 
		try {
			List<Document> docs = null;
			IndexSearcher searcher = IndexUtils.getIndexSearch();
			QueryParser parser = null;
			Pager<Document> pager = null;
			
			Integer pageSize = SystemContext.getPageSize();
			Integer pageNow = SystemContext.getPageNow();
			
			if(pageSize == null || pageSize <= 0){
				pageSize = 10;
			}
			if(pageNow == null || pageNow<= 0){
				pageNow = 1;
			}
			int pageoffset = (pageNow-1)*pageSize;
			//多个条件 和一个条件的情况
			if(fields!= null && fields.length >1){
				parser = new MultiFieldQueryParser(Version.LUCENE_35, fields, getAnalyzer());
			}else{
				parser =new QueryParser(Version.LUCENE_35, fields[0], IndexUtils.getAnalyzer());
			}
			
			Query query = parser.parse(val);
			TopDocs topDocs = null;
			topDocs = searcher.searchAfter(queryLastDoc(pageoffset,searcher, query),query, pageSize);
				
			if(topDocs.scoreDocs.length >0){
				docs = new ArrayList<Document>();
				for(ScoreDoc scoreDoc :topDocs.scoreDocs){
					Document document = searcher.doc(scoreDoc.doc);
					if(isLight){
						for(String field:fields){
							//获取高亮的结果
							String result = IndexUtils.highlighter(query, field, document.get(field));
							//设定document 的数据，将默认数据修改为我们的高亮数据
							//这个高粱的是  String类型数据，如果是int就会报错
							document.getField(field).setValue(result);
						}
					}
					docs.add(document);
				}
				//设定Pager中的数据
				pager = new Pager<Document>();
				pager.setRowCount(topDocs.totalHits);
				pager.setPageCount((topDocs.totalHits - 1)/pageSize +1);
				pager.setData(docs);
				pager.setPageNow(pageNow);
				pager.setPageSize(pageSize);
			}
			return pager;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	/**
	 * 获取查询的 数目
	 * @return
	 */
	public static int getMaxCount(Query query){
		try {
			IndexSearcher searcher = IndexUtils.getIndexSearch();
			TopDocs topDocs = searcher.search(query, 1);
			return topDocs.totalHits;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	/**
	 * 分页查询  带排序字段操作的
	 * @param fields 字段
	 * @param val 值
	 * @param isLight 是否高亮
	 * @param sort 排序
	 * @return
	 */
	public static Pager<Document> queryByPager(String [] fields,String val,boolean isLight,Sort sort){
		//FIXME 搞定 分页查询 
		try {
			List<Document> docs = null;
			IndexSearcher searcher = IndexUtils.getIndexSearch();
			QueryParser parser = null;
			Pager<Document> pager = null;
			
			Integer pageSize = SystemContext.getPageSize();
			Integer pageNow = SystemContext.getPageNow();
			
			if(pageSize == null || pageSize <= 0){
				pageSize = 10;
			}
			if(pageNow == null || pageNow<= 0){
				pageNow = 1;
			}
			int start = (pageNow-1)*pageSize;
			int end =  	pageNow*pageSize;	
			//多个条件 和一个条件的情况
			if(fields!= null && fields.length >1){
				parser = new MultiFieldQueryParser(Version.LUCENE_35, fields, getAnalyzer());
			}else{
				parser =new QueryParser(Version.LUCENE_35, fields[0], IndexUtils.getAnalyzer());
			}
			
			Query query = parser.parse(val);
			TopDocs topDocs = null;
			topDocs = searcher.search(query,getMaxCount(query),sort);
				
			if(topDocs.scoreDocs.length >0){
				docs = new ArrayList<Document>();
				for(int i =start ;i<end;i++){
					ScoreDoc scoreDoc =  topDocs.scoreDocs[i];	
						Document document = searcher.doc(scoreDoc.doc);
						if(isLight){
							for(String field:fields){
								//获取高亮的结果
								String result = IndexUtils.highlighter(query, field, document.get(field));
								//设定document 的数据，将默认数据修改为我们的高亮数据
								//这个高粱的是  String类型数据，如果是int就会报错
								document.getField(field).setValue(result);
							}
						}
						docs.add(document);
					}
				}
				//设定Pager中的数据
				pager = new Pager<Document>();
				pager.setRowCount(topDocs.totalHits);
				pager.setPageCount((topDocs.totalHits - 1)/pageSize +1);
				pager.setData(docs);
				pager.setPageNow(pageNow);
				pager.setPageSize(pageSize);
			return pager;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	/**
	 * 一个字段的查询
	 * @param field 字段
	 * @param val 值
	 * @param isLight 是否高亮
	 * @return
	 */
	public static Pager<Document> queryByPager(String  field,String val,boolean isLight){
		return queryByPager(new String[]{field}, val, isLight);
	}
	/**
	 * 获取文章后面的文档  获取后面的目标文档
	 * @param pageOffset  pageNow xpageSize 
	 * @param searcher 查询
	 * @param query query对象
	 * @return
	 */
	private static ScoreDoc queryLastDoc(int pageOffset,IndexSearcher searcher,Query query){
		try {
			if(pageOffset <=  0) return null;
			TopDocs docs = null;
				docs = searcher.search(query,pageOffset);
			return docs.scoreDocs[pageOffset-1];
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询数据.通过Reader  获取文档的数据
	 */
	public static void getInfo(){
		try {
			IndexReader reader = IndexUtils.getIndexReader();
			System.err.println("--------------索引系统信息---------------------");
			System.out.println("文档数量"+reader.numDocs()); //获取文档数量
			System.out.println("文档总数"+reader.maxDoc());//最大的文档
			System.out.println("删除的文档数-->"+reader.numDeletedDocs());
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	/**
	 * 删除所有数据
	 */
	public static void deleteAll(){
		IndexWriter writer  = null;
		try {
			writer = IndexUtils.getIndexWriter();
			writer.deleteAll();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
			}finally{
			closeWriter(writer);
		}
	}
	
	/**
	 * 取消清空数据
	 */
	public void undelete(){
		IndexReader reader = null;
		try {
			reader = IndexReader.open(FSDirectory.open(new File(indexPath)),false); //指定reader only 为false
			reader.undeleteAll(); //设定恢复所有的删除数据
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			closeReader(reader);
		}
	}
	
	
	/**
	 * 精确删除数据
	 * @param term
	 */
	public static void deleteByTerm(Term term){
		IndexWriter writer = null;
		try {
			writer = getIndexWriter();
			writer.deleteDocuments(term);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally{
			closeWriter(writer);
		}
		
	}
	/**
	 * 清空所有索引数据，不可以恢复
	 */
	public static void forceDeletes(){
		IndexWriter  writer = null;
		try {
			writer = IndexUtils.getIndexWriter();
			writer.forceMergeDeletes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeWriter(writer);
		}
	}
	
	/**
	 * 关闭writer
	 * @param writer
	 */
	public static void closeWriter(IndexWriter writer){
		try {
			if(writer != null){
				writer.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	/**
	 * 关闭Reader
	 * @param writer
	 */
	public static void closeReader(IndexReader reader){
		try {
			if(reader != null){
				reader.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	/**
	 * 判断索引表是否存在e
	 * @param directory 文件
	 * @return
	 */
	public static boolean indexExists(JdbcDirectory directory){
		boolean flag = false;
		try {
			PreparedStatement ps = directory.getDataSource().getConnection().prepareStatement("show tables");
			ResultSet set = ps.executeQuery();
			String tableName = directory.getTable().getName();
			while(set.next()){
				if(set.getString(1).equals(tableName)){
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 获取JDBCDirecotry
	 * @return
	 */
	public static JdbcDirectory getJDBCDirecotry(){
		try {
			AbstractApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
			DataSource dataSource =(DataSource) context.getBean("dataSource");
			//创建Directory
			JdbcDirectory directory = new JdbcDirectory(dataSource,"t_index");
			boolean exists  = IndexUtils.indexExists(directory);
			if(!exists){
				directory.create();
			}
			return directory;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取JDBC的IndexWriter
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static IndexWriter getIndexWriter4JBCD(){
		IndexWriter writer =null;
		try {
			Directory directory = IndexUtils.getJDBCDirecotry();
//			writer = new IndexWriter(directory, new MMSegAnalyzer(dicPath),false,IndexWriter.MaxFieldLength.UNLIMITED);
			writer = new IndexWriter(directory, new IndexWriterConfig(Version.LUCENE_35, new MMSegAnalyzer(dicPath)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return writer;
	}
	
}
