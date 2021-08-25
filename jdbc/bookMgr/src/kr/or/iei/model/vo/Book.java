package kr.or.iei.model.vo;

public class Book {
	private int bookNo;
	private String bookGenre;
	private String bookName;
	private String bookIntro;
	private String bookWriter;
	private int bookStock;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(int bookNo, String bookGenre, String bookName, String bookIntro, String bookWriter, int bookStock) {
		super();
		this.bookNo = bookNo;
		this.bookGenre = bookGenre;
		this.bookName = bookName;
		this.bookIntro = bookIntro;
		this.bookWriter = bookWriter;
		this.bookStock = bookStock;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookGenre() {
		return bookGenre;
	}
	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookIntro() {
		return bookIntro;
	}
	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public int getBookStock() {
		return bookStock;
	}
	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}
	
}
