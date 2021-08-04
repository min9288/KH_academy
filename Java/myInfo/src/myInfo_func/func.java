package myInfo_func;

public class func 
{
	public void data() 
	{
		String column1 = "이름";
		String column2 = "나이";
		String column3 = "성별";
		String column4 = "주소";
		String column5 = "전화번호";
		
		String name1 = "정민우";
		String name2 = "홍길동";
		int i1 = 30;
		int i2 = 40;
		char s1 = '남';
		
		String pNum1 = "010-123-4567";
		String pNum2 = "010-456-7894";
		
		String add1 = "서울시 초록마을로18길 25-16";
		String add2 = "서울시 초록마을로18길 25-16-17";
		
		System.out.println(column1+"\t"+column2+"\t"+column3+"\t"+"\t"+column4+"\t"+"\t"+"\t"+column5);
		System.out.println("--------------------------------------------------------------------------------");
		System.out.printf("%s\t%d\t%c\t%s\t%s\n", name1, i1, s1, add1, pNum1);
		System.out.println("--------------------------------------------------------------------------------");
		System.out.printf("%s\t%d\t%c\t%s\t%s", name2, i2, s1, add2, pNum2);
	}
}
