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
					System.out.print(user_score + "ȸ�� ��ȣ �Է� : ");
					user_num = sc.nextInt();
					if(user_num < com_num) {
						System.out.println("<< UP >>");
					}else if(user_num > com_num) {
						System.out.println("<< DOWN >>");
					}
				}
				System.out.println("<< ���� >>");
					if(best_score == 0 ||user_score < best_score) {
						best_score = user_score;
					}
				break;
			case 2 :
				if(best_score == 0) {
					System.out.println("���� ����� �����ϴ�.");
				}else {
				System.out.println("���� �ְ� ����� " +best_score+ "ȸ �Դϴ�.");
				}
				break;
			case 3 :
				System.out.println("���α׷��� �����մϴ�.");
				bool = false;
				break;
			default :
				System.out.println("�� �� �Է��ϼ̽��ϴ�, �ٽ� �Է����ּ���.");
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
						System.out.println("\"1 ~ 3\" ������ �������ּ���!");
						continue;
					}
					
					for(int i = 0; i < user_num; i++) {
						++countNum;
						if(countNum <= 31) {
							System.out.println(countNum + "!");
						}
						if(countNum == 31) {
							System.out.println("�й� �Ͽ����ϴ�...");
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
							System.out.println("�����ϰ� �¸��ϼ̽��ϴ�..^��^!!!");
							win++;
							Running = false;
						}
					}
				}
				break;
			case 2 :
				System.out.println("<< ����� ���� >>");
				System.out.println("WIN : " + win);
				System.out.println("LOSE : " + lose);
				break;
			case 3 :
				System.out.println("���α׷��� �����մϴ�.");
				bool = false;
				break;
			default :
				System.out.println("�� �� �Է��ϼ̽��ϴ�, �ٽ� �Է����ּ���.");
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
					System.out.println("�ݾ��� �����մϴ�.");
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
							System.out.println("1��° �ֻ��� �� : " + user_first_diceNum);
							System.out.println("2��° �ֻ��� �� : " + user_second_diceNum);
							System.out.println("3��° �ֻ��� �� : " + user_third_diceNum);
							System.out.println("�� �ֻ��� �� �� : " + user_total);
							System.out.print("���� �Ͻðڽ��ϱ�? [ Y / N ] : ");
							char myDecision = sc.next().charAt(0);
							if(myDecision == 'y' || myDecision == 'Y') {
								while(true) {
									System.out.print("�󸶸� �����Ͻðڽ��ϱ�? (���� �� ������ : "+ readyMoney + "��) : ");
									bettingFee = sc.nextInt();
									if(readyMoney < bettingFee) {
										System.out.println("�ݾ��� �����մϴ�, �ٽ� �Է����ּ���.");
										continue;
										}
										break;
									}
									System.out.println("1��° �ֻ��� �� : " + computer_first_diceNum);
									System.out.println("2��° �ֻ��� �� : " + computer_second_diceNum);
									System.out.println("3��° �ֻ��� �� : " + computer_third_diceNum);
									System.out.println("��ǻ�� �ֻ��� �� �� : " + computer_total);
								
									System.out.println("<< ��� >>");
									if(user_total > computer_total) {
										System.out.println("�¸�!!");
										System.out.println("+"+bettingFee+"��!!");
										readyMoney += bettingFee;
										win++;
									}else if(user_total < computer_total){
										System.out.println("�й�...");
										System.out.println("-"+bettingFee+"�� ��_��..");
										readyMoney -= bettingFee;
										lose++;
									}else {
										System.out.println("�����ϴ�.");
										draw++;
									}
									System.out.print("�ѹ� �� �Ͻðڽ��ϱ�? [ Y / N ]");
									char subMyDecision = sc.next().charAt(0);
									if(subMyDecision == 'y' || subMyDecision == 'Y') {
										if(readyMoney <= 0) {
											System.out.println("������ �����ٴ°� �Ƽ̳���?, ���� �뵿�� ���� ������������ ^��^!!");
											bool_2 = false;
										}else
											continue;
									}else if(subMyDecision == 'n' || subMyDecision == 'N') {
										System.out.println("�޴��� ���ư��ϴ�.");
										bool_2 = false;
									}
							}else if(myDecision == 'n' || myDecision == 'N') {
								System.out.println("�޴��� ���ư��ϴ�.");
								bool_2 = false;
						}
					}
				}
				break;		
			case 2 :
				System.out.println("<< ����� ���� >>");
				System.out.println("WIN : " + win);
				System.out.println("LOSE : " + lose);
				System.out.println("�� ������ : "+readyMoney+"��");
				break;
			case 3 :
				System.out.println("���α׷��� �����մϴ�.");
				bool = false;
				break;
			default :
				System.out.println("�� �� �Է��ϼ̽��ϴ�, �ٽ� �Է����ּ���.");
				break;
				}
			}
		}
	}
