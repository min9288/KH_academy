package kh.java.func;
import java.util.Random;
import java.util.Scanner;

public class RandomTest {
	public void test1() {
		Random r = new Random();
		int num = r.nextInt();
		System.out.println(num);
		int num2 = r.nextInt(10); // 0 ~ 9
		System.out.println(num2);
		int num3 = r.nextInt(6);
		System.out.println(num3);
		int num4 = r.nextInt(10) + 1; // 1 ~ 10
		System.out.println(num4);
		int num5 = r.nextInt(16) + 20; // 20 ~ 35
		System.out.println(num5);
	}
	public void coin() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		while (true) {
			System.out.println("=== ���� ��/�� ���߱� ===");
			System.out.println("���ڸ� �Է����ּ���(1. �ո� / 2.�޸�) : ");
			int select = sc.nextInt();
			int coin = r.nextInt(2) + 1;
			System.out.println("coin : "+ coin);
			if(coin == select) {
				System.out.println("������ϴ�!!");
				break;
			}else {
				System.out.println("��!");
			}
		}
	}
//	public void rps() {
//		Scanner sc = new Scanner(System.in);
//		Random r = new Random();
//		
//		System.out.println("=== ���� ���� �� ���� ===");
//		System.out.print("���ڸ� �����ϼ���(1. ���� / 2.���� / 3. ��) : ");
//		int select = sc.nextInt();
//		int aiSelect = r.nextInt(3) + 1; 
//		System.out.println("=============== ��� ===============");
//		if(select == 1) {
//			System.out.println("����� ������ �½��ϴ�.");
//		}else if (select == 2) {
//			System.out.println("����� ������ �½��ϴ�.");
//		}else if (select == 3) {
//			System.out.println("����� ���� �½��ϴ�.");
//		}
//		if(aiSelect == 1) {
//			System.out.println("��ǻ�ʹ� ������ �½��ϴ�.");
//		}else if (aiSelect == 2) {
//			System.out.println("��ǻ�ʹ� ������ �½��ϴ�.");
//		}else if (aiSelect == 3) {
//			System.out.println("��ǻ�ʹ� ���� �½��ϴ�.");
//		}
//		System.out.println("=========================================");
//		if((select == 1 && aiSelect == 2) || (select == 2 && aiSelect == 3) || select == 3 && aiSelect == 1) {
//			System.out.println("����� �����ϴ�. ^��^ ");
//		}else if (select == aiSelect) {
//			System.out.println("�����ϴ�. > _ <");
//		}else {
//			System.out.println("����� �̰���ϴ�. ��_��.. ");
//		}	
//	}
	public void rps() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		boolean bool = true;
		int win = 0;
		int lose = 0;
		int draw = 0;
		while (bool) {
			System.out.println("=== ���� ���� �� ���� ===");
			System.out.println("1. ���� ����");
			System.out.println("2. ���� Ȯ��");
			System.out.println("3. ���� ����");
			System.out.print("���� > ");
			int select_M = sc.nextInt();
			
			switch(select_M) {
			case 1:
				System.out.print("���ڸ� �����ϼ���(1. ���� / 2.���� / 3. ��) : ");
				int select = sc.nextInt();
				int aiSelect = r.nextInt(3) + 1; 
				String user = "";
				if(select == 1) {
					user = "����";
				}else if (select == 2) {
					user = "����";
				}else if (select == 3) {
					user = "��";
				}
				String com = "";
				if(aiSelect == 1) {
					com = "����";
				}else if (aiSelect == 2) {
					com = "����";
				}else if (aiSelect == 3) {
					com = "��";
				}
				System.out.println("=============== ��� ===============");
				System.out.println("����� " + user + "�� �½��ϴ�.");
				System.out.println("��ǻ�ʹ� " + com + "�� �½��ϴ�.");
				System.out.println("=========================================");
				if((user.equals("����") && com.equals("����")) || (user.equals("����") && com.equals("��")) || (user.equals("��") && com.equals("����"))) {
					System.out.println("����� �����ϴ�. ^��^ ");
					lose++;
				}else if (select == aiSelect) {
					System.out.println("�����ϴ�. > _ <");
					draw++;
				}else { 
					System.out.println("����� �̰���ϴ�. ��_��.. ");
					win++;
				}
				break;
			case 2:
				System.out.println("=============== �� ���� ===============");
				System.out.println("�¸� : " + win);
				System.out.println("���º� : " + draw);
				System.out.println("�й� : " + lose);
				break;
			case 3:
				System.out.println("������ �����մϴ�.");
				bool = false;
				break;
			default:
				System.out.println("�� �� �Է� �ϼ̽��ϴ�.");
				break;
			}
		}
	}
	public void rps2() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		boolean bool = true;
		int win = 0;
		int lose = 0;
		int draw = 0;
		while (bool) {
			System.out.println("=== ���� ���� �� ���� ===");
			System.out.println("1. ���� ����");
			System.out.println("2. ���� Ȯ��");
			System.out.println("3. ���� ����");
			System.out.print("���� > ");
			int select_M = sc.nextInt();
			
			switch(select_M) {
			case 1:
				while(true) {
					System.out.print("���ڸ� �����ϼ���(1. ���� / 2.���� / 3. ��) : ");
					int select = sc.nextInt();
					int aiSelect = r.nextInt(3) + 1; 
					String user = "";
					if(select == 1) {
						user = "����";
					}else if (select == 2) {
						user = "����";
					}else if (select == 3) {
						user = "��";
					}
					String com = "";
					if(aiSelect == 1) {
						com = "����";
					}else if (aiSelect == 2) {
						com = "����";
					}else if (aiSelect == 3) {
						com = "��";
					}
					System.out.println("=============== ��� ===============");
					System.out.println("����� " + user + "�� �½��ϴ�.");
					System.out.println("��ǻ�ʹ� " + com + "�� �½��ϴ�.");
					System.out.println("=========================================");
					if((user.equals("����") && com.equals("����")) || (user.equals("����") && com.equals("��")) || (user.equals("��") && com.equals("����"))) {
						System.out.println("����� �����ϴ�. ^��^ ");
						lose++;
						if(lose == 3) {
							System.out.println("============= ���� �й� =============");
							System.out.println("���������� �й��ϼ̽��ϴ�, �̿����ּż� �����մϴ�.");
							bool = false;
						}
					}else if (select == aiSelect) {
						System.out.println("������Ƿ� ��õ� �ϼ���!");
						draw++;
						break;
					}else { 
						System.out.println("����� �̰���ϴ�. ��_��.. ");
						win++;
						if(win == 3) {
							System.out.println("============= ���� �¸� =============");
							System.out.println("���������� �¸��ϼ̽��ϴ�, �̿����ּż� �����մϴ�.");
							bool = false;
						}
					}
					break;
				}
			case 2:
				System.out.println("=============== �� ���� ===============");
				System.out.println("�¸� : " + win);
				System.out.println("���º� : " + draw);
				System.out.println("�й� : " + lose);
				break;
			case 3:
				System.out.println("������ �����մϴ�.");
				bool = false;
				break;
			default:
				System.out.println("�� �� �Է� �ϼ̽��ϴ�.");
				break;
			}
		}
	}
}
		
