package com.crm.util;

import java.util.Date;

public class Test {
	public static void main(String[] args) {
		/*
		 * int[] Arr5 = {32,3453453,64,234,46565,23424}; int arr=0; for(int
		 * i=0;i<Arr5.length-1;i++) { for(int j=0;j<Arr5.length-i-1;j++) {
		 * if(Arr5[j]<Arr5[j+1]) {
		 * 
		 * arr=Arr5[j]; Arr5[j]=Arr5[j+1]; Arr5[j+1]=arr; } }
		 * 
		 * } for (int j2 = 0; j2 < Arr5.length; j2++) {
		 * System.out.println(Arr5[j2]+","); }
		 */
		
		Date myDate = new Date();
		
		System.out.println(myDate.toLocaleString());
	}

}
