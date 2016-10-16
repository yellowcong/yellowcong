package com.yellowcong.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.yellowcong.model.SystemContext;


/**
 * 过滤器，实现分页操作
 * @author 狂飙のyellowcong
 * 2015年7月25日
 *
 */
public class SystemContextFilter  implements Filter {
	private Integer pageSize;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filter) throws IOException, ServletException {
		// TODO Auto-generated method stub	
		try {
			//设定  pageSize pageNow sort order
			int pageNow =1;
			
			String rows = request.getParameter("pageSize");
			String page = request.getParameter("pageNow");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String newsPage = request.getParameter("pager.offset");
			//设定数据 
			
			if(rows != null){
				pageSize = Integer.parseInt(rows);
			}
			if(page != null){
				pageNow = Integer.parseInt(page);
			}
			
			SystemContext.setPageNow(pageNow);
			SystemContext.setPageSize(pageSize);
			SystemContext.setOrder(order);
			SystemContext.setSort(sort);
			
			//刚刚一直不动，可能是这个过滤器搞的鬼
			filter.doFilter(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			SystemContext.removePageNow();
			SystemContext.removePageOrder();
			SystemContext.removePageSize();
			SystemContext.removePageSort();
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		String str = config.getInitParameter("pageSize");
		if(str == null || str.trim().equals("")){
			pageSize = 10;
		}else{
			pageSize = Integer.parseInt(str);
		}
	}

}
