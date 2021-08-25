package kr.or.iei.book.vo;

public class Book {
	private int bookNo;
	private String bookGenre;
	private String bookTitle;
	private String bookIntro;
	private String bookAuthor;
	private int bookVolume;
	
	public Book() {
		super();
	}
	
	public Book(int bookNo, String bookGenre, String bookTitle, String bookIntro, String bookAuthor,
			int bookVolume) {
		super();
		this.bookNo = bookNo;
		this.bookGenre = bookGenre;
		this.bookTitle = bookTitle;
		this.bookIntro = bookIntro;
		this.bookAuthor = bookAuthor;
		this.bookVolume = bookVolume;
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
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookIntro() {
		return bookIntro;
	}
	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public int getBookVolume() {
		return bookVolume;
	}
	public void setBookVolume(int bookVolume) {
		this.bookVolume = bookVolume;
	}
	
	
}
