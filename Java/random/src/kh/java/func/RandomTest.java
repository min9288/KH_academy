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
			System.out.println("=== 동전 앞/뒤 맞추기 ===");
			System.out.println("숫자를 입력해주세요(1. 앞면 / 2.뒷면) : ");
			int select = sc.nextInt();
			int coin = r.nextInt(2) + 1;
			System.out.println("coin : "+ coin);
			if(coin == select) {
				System.out.println("맞췄습니다!!");
				break;
			}else {
				System.out.println("땡!");
			}
		}
	}
//	public void rps() {
//		Scanner sc = new Scanner(System.in);
//		Random r = new Random();
//		
//		System.out.println("=== 가위 바위 보 게임 ===");
//		System.out.print("숫자를 선택하세요(1. 가위 / 2.바위 / 3. 보) : ");
//		int select = sc.nextInt();
//		int aiSelect = r.nextInt(3) + 1; 
//		System.out.println("=============== 결과 ===============");
//		if(select == 1) {
//			System.out.println("당신은 가위를 냈습니다.");
//		}else if (select == 2) {
//			System.out.println("당신은 바위를 냈습니다.");
//		}else if (select == 3) {
//			System.out.println("당신은 보를 냈습니다.");
//		}
//		if(aiSelect == 1) {
//			System.out.println("컴퓨터는 가위를 냈습니다.");
//		}else if (aiSelect == 2) {
//			System.out.println("컴퓨터는 바위를 냈습니다.");
//		}else if (aiSelect == 3) {
//			System.out.println("컴퓨터는 보를 냈습니다.");
//		}
//		System.out.println("=========================================");
//		if((select == 1 && aiSelect == 2) || (select == 2 && aiSelect == 3) || select == 3 && aiSelect == 1) {
//			System.out.println("당신이 졌습니다. ^ㅇ^ ");
//		}else if (select == aiSelect) {
//			System.out.println("비겼습니다. > _ <");
//		}else {
//			System.out.println("당신이 이겼습니다. ㅡ_ㅡ.. ");
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
			System.out.println("=== 가위 바위 보 게임 ===");
			System.out.println("1. 게임 시작");
			System.out.println("2. 전적 확인");
			System.out.println("3. 게임 종료");
			System.out.print("선택 > ");
			int select_M = sc.nextInt();
			
			switch(select_M) {
			case 1:
				System.out.print("숫자를 선택하세요(1. 가위 / 2.바위 / 3. 보) : ");
				int select = sc.nextInt();
				int aiSelect = r.nextInt(3) + 1; 
				String user = "";
				if(select == 1) {
					user = "가위";
				}else if (select == 2) {
					user = "바위";
				}else if (select == 3) {
					user = "보";
				}
				String com = "";
				if(aiSelect == 1) {
					com = "가위";
				}else if (aiSelect == 2) {
					com = "바위";
				}else if (aiSelect == 3) {
					com = "보";
				}
				System.out.println("=============== 결과 ===============");
				System.out.println("당신은 " + user + "를 냈습니다.");
				System.out.println("컴퓨터는 " + com + "를 냈습니다.");
				System.out.println("=========================================");
				if((user.equals("가위") && com.equals("바위")) || (user.equals("바위") && com.equals("보")) || (user.equals("보") && com.equals("가위"))) {
					System.out.println("당신이 졌습니다. ^ㅇ^ ");
					lose++;
				}else if (select == aiSelect) {
					System.out.println("비겼습니다. > _ <");
					draw++;
				}else { 
					System.out.println("당신이 이겼습니다. ㅡ_ㅡ.. ");
					win++;
				}
				break;
			case 2:
				System.out.println("=============== 총 전적 ===============");
				System.out.println("승리 : " + win);
				System.out.println("무승부 : " + draw);
				System.out.println("패배 : " + lose);
				break;
			case 3:
				System.out.println("게임을 종료합니다.");
				bool = false;
				break;
			default:
				System.out.println("잘 못 입력 하셨습니다.");
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
			System.out.println("=== 가위 바위 보 게임 ===");
			System.out.println("1. 게임 시작");
			System.out.println("2. 전적 확인");
			System.out.println("3. 게임 종료");
			System.out.print("선택 > ");
			int select_M = sc.nextInt();
			
			switch(select_M) {
			case 1:
				while(true) {
					System.out.print("숫자를 선택하세요(1. 가위 / 2.바위 / 3. 보) : ");
					int select = sc.nextInt();
					int aiSelect = r.nextInt(3) + 1; 
					String user = "";
					if(select == 1) {
						user = "가위";
					}else if (select == 2) {
						user = "바위";
					}else if (select == 3) {
						user = "보";
					}
					String com = "";
					if(aiSelect == 1) {
						com = "가위";
					}else if (aiSelect == 2) {
						com = "바위";
					}else if (aiSelect == 3) {
						com = "보";
					}
					System.out.println("=============== 결과 ===============");
					System.out.println("당신은 " + user + "를 냈습니다.");
					System.out.println("컴퓨터는 " + com + "를 냈습니다.");
					System.out.println("=========================================");
					if((user.equals("가위") && com.equals("바위")) || (user.equals("바위") && com.equals("보")) || (user.equals("보") && com.equals("가위"))) {
						System.out.println("당신이 졌습니다. ^ㅇ^ ");
						lose++;
						if(lose == 3) {
							System.out.println("============= 최종 패배 =============");
							System.out.println("최종적으로 패배하셨습니다, 이용해주셔서 감사합니다.");
							bool = false;
						}
					}else if (select == aiSelect) {
						System.out.println("비겼으므로 재시도 하세요!");
						draw++;
						break;
					}else { 
						System.out.println("당신이 이겼습니다. ㅡ_ㅡ.. ");
						win++;
						if(win == 3) {
							System.out.println("============= 최종 승리 =============");
							System.out.println("최종적으로 승리하셨습니다, 이용해주셔서 감사합니다.");
							bool = false;
						}
					}
					break;
				}
			case 2:
				System.out.println("=============== 총 전적 ===============");
				System.out.println("승리 : " + win);
				System.out.println("무승부 : " + draw);
				System.out.println("패배 : " + lose);
				break;
			case 3:
				System.out.println("게임을 종료합니다.");
				bool = false;
				break;
			default:
				System.out.println("잘 못 입력 하셨습니다.");
				break;
			}
		}
	}
}
		
