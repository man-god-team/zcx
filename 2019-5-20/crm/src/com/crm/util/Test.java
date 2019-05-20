package com.crm.util;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JToggleButton;
import javax.swing.WindowConstants;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public class Test {
	public static void main(String[] args) {
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
       } 
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
       } 
 
	

}
