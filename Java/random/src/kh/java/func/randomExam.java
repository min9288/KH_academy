package kh.java.func;

import java.util.Random;
import java.util.Scanner;

public class randomExam {
	public void UPDownGame () {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		boolean bool = true;
		int user_num = -1;
		int best_score = 0;
		
		while(bool) {
			System.out.println("== Up & Down Game ==");
			System.out.println("1. Game Start");
			System.out.println("2. Game Score");
			System.out.println("3. End Game");
			System.out.print(" > ");
			int select = sc.nextInt();
			int com_num = r.nextInt(99) + 1;
			int user_score = 0;
			
			switch (select) {
			case 1 :
				while(com_num != user_num) {
					++user_score;
					System.out.print(user_score + "회차 번호 입력 : ");
					user_num = sc.nextInt();
					if(user_num < com_num) {
						System.out.println("<< UP >>");
					}else if(user_num > com_num) {
						System.out.println("<< DOWN >>");
					}
				}
				System.out.println("<< 정답 >>");
					if(best_score == 0 ||user_score < best_score) {
						best_score = user_score;
					}
				break;
			case 2 :
				if(best_score == 0) {
					System.out.println("아직 기록이 없습니다.");
				}else {
				System.out.println("현재 최고 기록은 " +best_score+ "회 입니다.");
				}
				break;
			case 3 :
				System.out.println("프로그램을 종료합니다.");
				bool = false;
				break;
			default :
				System.out.println("잘 못 입력하셨습니다, 다시 입력해주세요.");
				break;
			}
		}
	}
	public void BaskinRobbins_31_Game() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		boolean bool = true;
		int win = 0;
		int lose = 0;
		
		while(bool) {
			System.out.println("==== Baskin Robbins31 Game ====");
			System.out.println("1. Game Start");
			System.out.println("2. Game Score");
			System.out.println("3. End Game");
			System.out.print(" > ");
			int select = sc.nextInt();
			
			switch (select) {
			case 1 :
				int countNum = 0;
				boolean Running = true;
				
				while(Running) {
					System.out.println("<< Your Turn >>");
					System.out.print("Input Number : ");
					int user_num = sc.nextInt();
					
					if(user_num <= 0 || user_num >= 4) {
						System.out.println("\"1 ~ 3\" 정수를 기입해주세요!");
						continue;
					}
					
					for(int i = 0; i < user_num; i++) {
						++countNum;
						if(countNum <= 31) {
							System.out.println(countNum + "!");
						}
						if(countNum == 31) {
							System.out.println("패배 하였습니다...");
							lose++;
							Running = false;
						}
					}
					System.out.println("<< Computer Turn >>");
					int com_num = r.nextInt(3) + 1;
					System.out.println("Computer Select_Number : "+ com_num);
					for(int i = 0; i < com_num; i++) {
						++countNum;
						if(countNum <= 31) {
							System.out.println(countNum + "!");
						}
						if(countNum == 31) {
							System.out.println("찬란하게 승리하셨습니다..^ㅇ^!!!");
							win++;
							Running = false;
						}
					}
				}
				break;
			case 2 :
				System.out.println("<< 당신의 전적 >>");
				System.out.println("WIN : " + win);
				System.out.println("LOSE : " + lose);
				break;
			case 3 :
				System.out.println("프로그램을 종료합니다.");
				bool = false;
				break;
			default :
				System.out.println("잘 못 입력하셨습니다, 다시 입력해주세요.");
				break;
			}
		}
	}
	public void Dice_Game() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		boolean bool = true;
		int user_total = 0;
		int computer_total = 0;
		int win = 0;
		int lose = 0;
		int draw = 0;
		int readyMoney = 10000;
		
		while(bool) {
			
			System.out.println("===== Dice Game =====");
			System.out.println("1. Game Start");
			System.out.println("2. Game Score");
			System.out.println("3. End Game");
			System.out.print(" > ");
			int select = sc.nextInt();
			
			switch(select) {
			
			case 1 :
				int bettingFee = 0;
				if(readyMoney <= 0) {
					System.out.println("금액이 부족합니다.");
					break;
				}else {
					boolean bool_2 = true;
					while (bool_2) {
						int user_first_diceNum = r.nextInt(6) + 1;
						int user_second_diceNum = r.nextInt(6) + 1;
						int user_third_diceNum = r.nextInt(6) + 1;
						
						int computer_first_diceNum = r.nextInt(6) + 1;
						int computer_second_diceNum = r.nextInt(6) + 1;
						int computer_third_diceNum = r.nextInt(6) + 1;
						computer_total = (computer_first_diceNum + computer_second_diceNum + computer_third_diceNum);
						user_total = (user_first_diceNum + user_second_diceNum + user_third_diceNum);
						
							System.out.println("<< Game Start >>");
							System.out.println("1번째 주사위 값 : " + user_first_diceNum);
							System.out.println("2번째 주사위 값 : " + user_second_diceNum);
							System.out.println("3번째 주사위 값 : " + user_third_diceNum);
							System.out.println("내 주사위 총 합 : " + user_total);
							System.out.print("배팅 하시겠습니까? [ Y / N ] : ");
							char myDecision = sc.next().charAt(0);
							if(myDecision == 'y' || myDecision == 'Y') {
								while(true) {
									System.out.print("얼마를 배팅하시겠습니까? (현재 내 소지금 : "+ readyMoney + "원) : ");
									bettingFee = sc.nextInt();
									if(readyMoney < bettingFee) {
										System.out.println("금액이 부족합니다, 다시 입력해주세요.");
										continue;
										}
										break;
									}
									System.out.println("1번째 주사위 값 : " + computer_first_diceNum);
									System.out.println("2번째 주사위 값 : " + computer_second_diceNum);
									System.out.println("3번째 주사위 값 : " + computer_third_diceNum);
									System.out.println("컴퓨터 주사위 총 합 : " + computer_total);
								
									System.out.println("<< 결과 >>");
									if(user_total > computer_total) {
										System.out.println("승리!!");
										System.out.println("+"+bettingFee+"원!!");
										readyMoney += bettingFee;
										win++;
									}else if(user_total < computer_total){
										System.out.println("패배...");
										System.out.println("-"+bettingFee+"원 ㅠ_ㅠ..");
										readyMoney -= bettingFee;
										lose++;
									}else {
										System.out.println("비겼습니다.");
										draw++;
									}
									System.out.print("한번 더 하시겠습니까? [ Y / N ]");
									char subMyDecision = sc.next().charAt(0);
									if(subMyDecision == 'y' || subMyDecision == 'Y') {
										if(readyMoney <= 0) {
											System.out.println("도박은 무섭다는걸 아셨나요?, 이제 노동의 맛을 느끼러가세요 ^ㅇ^!!");
											bool_2 = false;
										}else
											continue;
									}else if(subMyDecision == 'n' || subMyDecision == 'N') {
										System.out.println("메뉴로 돌아갑니다.");
										bool_2 = false;
									}
							}else if(myDecision == 'n' || myDecision == 'N') {
								System.out.println("메뉴로 돌아갑니다.");
								bool_2 = false;
						}
					}
				}
				break;		
			case 2 :
				System.out.println("<< 당신의 전적 >>");
				System.out.println("WIN : " + win);
				System.out.println("LOSE : " + lose);
				System.out.println("내 소지금 : "+readyMoney+"원");
				break;
			case 3 :
				System.out.println("프로그램을 종료합니다.");
				bool = false;
				break;
			default :
				System.out.println("잘 못 입력하셨습니다, 다시 입력해주세요.");
				break;
				}
			}
		}
	}
