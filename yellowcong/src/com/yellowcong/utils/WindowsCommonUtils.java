package com.yellowcong.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * window 的工具方法
 * @author yellowcong
 * @date 2016年1月8日
 *
 */
public class WindowsCommonUtils {
	private WindowsCommonUtils(){}

	/**
	 * 执行命令
	 * @param common
	 * @return
	 */
	public static Process exec(String common){
		try {
			Process process = Runtime.getRuntime().exec(common);
			return process;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 通过pid杀死某个进程
	 * @param pid
	 */
	public static void killProcess(int pid){
		WindowsCommonUtils.exec("tskill "+pid);
	}
	
	/**
	 * 通过 name杀死某个进程
	 * @param name
	 */
	public static void killProcess(String name){
		List<Task> tasks = WindowsCommonUtils.getTask(name);
		//循环来杀死进程
		for(WindowsCommonUtils.Task task:tasks){
			WindowsCommonUtils.killProcess(task.getPid());
		}
	}
	/**
	 * 通过名称来获取任务  
	 * 一个名称可以获取到多个进程
	 * @param name
	 * @return
	 */
	public static List<Task> getTask(String name){
		List<Task> tasks =  listProcess();
		List<Task> result = new ArrayList<WindowsCommonUtils.Task>();
		for(Task task:tasks){
			if(task.getName().equals(name) ||task.getName().equals(name+".exe")){
				result.add(task);
			}
		}
		return result;
	}
	/**
	 * 获取所有的Task 列表
	 * @return
	 */
	public static List<Task> listProcess(){
		Process process = WindowsCommonUtils.exec("taskList");
		Scanner scanner = new Scanner(process.getInputStream());
		List<Task> tasks = new ArrayList<Task>();
		int index = 0;
		while(scanner.hasNextLine()){
			String str = scanner.nextLine();
			
			if(index >2){
				String name = str.substring(0,30).trim();
				int pid = new Integer(str.substring(30, 34).replace(" ", ""));
				String dialogName = str.substring(35,60).trim();
				int dialogCount =new Integer(str.substring(60,63).replace(" ", ""));
				int ramUse = new Integer(str.substring(64,74).replace(" ", "").replace(",",""));
				
//				System.out.println(ramUse);
//				System.out.println(name+"__"+pid);
				tasks.add(new Task(name, pid, dialogName, dialogCount, ramUse));
			}
			index ++;
		}
		//tskill 
		scanner.close();
		return tasks;
	}
	
	
	
	//创建内部类 姐觉一些为难题
	public static class Task{
		//任务名称
		private String name;
		//pid
		private int pid;
		//对话框
		private String dialogName;
		//对话框数量
		private int dialogCount;
		//内存使用
		private int ramUse;
		
		
		public Task(String name, int pid, String dialogName, int dialogCount,
				int ramUse) {
			super();
			this.name = name;
			this.pid = pid;
			this.dialogName = dialogName;
			this.dialogCount = dialogCount;
			this.ramUse = ramUse;
		}
		public Task() {
			super();
			// TODO Auto-generated constructor stub
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPid() {
			return pid;
		}
		public void setPid(int pid) {
			this.pid = pid;
		}
		public String getDialogName() {
			return dialogName;
		}
		public void setDialogName(String dialogName) {
			this.dialogName = dialogName;
		}
		public int getDialogCount() {
			return dialogCount;
		}
		public void setDialogCount(int dialogCount) {
			this.dialogCount = dialogCount;
		}
		public int getRamUse() {
			return ramUse;
		}
		public void setRamUse(int ramUse) {
			this.ramUse = ramUse;
		}
		
	}
}

