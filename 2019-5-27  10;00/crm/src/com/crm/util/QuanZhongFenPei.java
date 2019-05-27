package com.crm.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Component;

import com.crm.entity.Yonghu; 
@Component
public class QuanZhongFenPei {

	public Yonghu fenpei(List<Yonghu> userlist) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=0;i<userlist.size();i++) {
			  map.put(i,userlist.get(i).getY_weight());  
		}
		// ��ȡȨ���ܺ�
		Integer sum = map.values().parallelStream().reduce(Integer::sum).get();
		List<Integer> list = new ArrayList<>();
		map.keySet().forEach(key -> {
			int value = map.get(key);
			for (int i = 0; i < value; i++) {
				list.add(key);
			}
		});
		Collections.shuffle(list);
		Integer index = list.get(new Random().nextInt(sum));
		return userlist.get(index);

	}
}
