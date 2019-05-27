package com.crm.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JToggleButton;
import javax.swing.WindowConstants;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public class Test {
	/*public static void main(String[] args) {
       int[] arr= {1,5,29,34,21,3,5,2};
       for (int i = 0; i < arr.length-1; i++) {
		for (int j = 0; j < arr.length-i-1; j++) {
			if (arr[j]>arr[j+1]) {
				int temp = arr[j];
				arr[j]=arr[j+1];
				arr[j+1]=temp;
			}
		}
	}
       for(int i =0;i<8;i++) {
    	   System.out.println(arr[i]);
       } */
		/*
		 * JFrame jf = new JFrame("测试窗口"); jf.setSize(250, 250);
		 * jf.setLocationRelativeTo(null);
		 * jf.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		 * 
		 * JPanel panel = new JPanel();
		 * 
		 * // 创建开关按钮 JToggleButton toggleBtn = new JToggleButton();
		 * 
		 * // 首先设置不绘制按钮边框 toggleBtn.setBorderPainted(false);
		 * 
		 * // 设置 选中(开) 和 未选中(关) 时显示的图片 toggleBtn.setSelectedIcon(new
		 * ImageIcon("toggle_on.png")); toggleBtn.setIcon(new
		 * ImageIcon("toggle_off.png"));
		 * 
		 * // 添加 toggleBtn 的状态被改变的监听 toggleBtn.addChangeListener(new ChangeListener() {
		 * 
		 * @Override public void stateChanged(ChangeEvent e) { // 获取事件源（即开关按钮本身）
		 * JToggleButton toggleBtn = (JToggleButton) e.getSource();
		 * System.out.println(toggleBtn.getText() + " 是否选中: " + toggleBtn.isSelected());
		 * } });
		 * 
		 * panel.add(toggleBtn);
		 * 
		 * jf.setContentPane(panel); jf.setVisible(true);
		 */
	/* } */ 
	 public static void main(String args[]) {
	       int i= compare_date("2019-11-12 15:21", "1999-12-11 09:59");
	       System.out.println("i=="+i);
	    }

	    public static int compare_date(String DATE1, String DATE2) {
	        
	        
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() > dt2.getTime()) {
	                System.out.println("dt1 在dt2前");
	                return 1;
	            } else if (dt1.getTime() < dt2.getTime()) {
	                System.out.println("dt1在dt2后");
	                return -1;
	            } else {
	                return 0;
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return 0;
	    }
	

}
