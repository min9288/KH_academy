package lifestyle.model.vo;

import java.util.ArrayList;

public class LifestyleList {
	private ArrayList<Lifestyle> list;
	private ArrayList<Lifestyle> categoryList;
	private Lifestyle lf;
	private ArrayList<LfReview> lfReview;
	public LifestyleList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LifestyleList(ArrayList<Lifestyle> list, ArrayList<Lifestyle> categoryList, Lifestyle lf) {
		super();
		this.list = list;
		this.categoryList = categoryList;
		this.lf = lf;
	}
	
	public LifestyleList(ArrayList<Lifestyle> list, ArrayList<Lifestyle> categoryList) {
		super();
		this.list = list;
		this.categoryList = categoryList;
	}
	
	public LifestyleList(ArrayList<Lifestyle> list, ArrayList<Lifestyle> categoryList, Lifestyle lf,
			ArrayList<LfReview> lfReview) {
		super();
		this.list = list;
		this.categoryList = categoryList;
		this.lf = lf;
		this.lfReview = lfReview;
	}
	public ArrayList<LfReview> getLfReview() {
		return lfReview;
	}
	public void setLfReview(ArrayList<LfReview> lfReview) {
		this.lfReview = lfReview;
	}
	public ArrayList<Lifestyle> getList() {
		return list;
	}
	public void setList(ArrayList<Lifestyle> list) {
		this.list = list;
	}
	public ArrayList<Lifestyle> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(ArrayList<Lifestyle> categoryList) {
		this.categoryList = categoryList;
	}
	public Lifestyle getLf() {
		return lf;
	}
	public void setLf(Lifestyle lf) {
		this.lf = lf;
	}

	
	
	
	
}
