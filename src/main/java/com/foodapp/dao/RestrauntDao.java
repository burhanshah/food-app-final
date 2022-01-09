package com.foodapp.dao;

import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.Restraunt;

public class RestrauntDao {

	List<Restraunt> res = new ArrayList<Restraunt>();

	public RestrauntDao() {
		initRestraunts();
	}

	private void initRestraunts() {

	}

	public Restraunt getRestrauntByName(String name) {
		Restraunt rest = null;
		for (Restraunt r : res) {
			if (r.getName().equalsIgnoreCase(name)) {
				rest = r;
				break;
			}
		}
		return rest;
	}

	public List<Restraunt> getRes() {
		return res;
	}

	public void setRes(List<Restraunt> res) {
		this.res = res;
	}

	public void addRestraunts(Restraunt res) {
		this.res.add(res);
	}

}
