select * from
				            (select
					            rownum as rnum,
								p.project_no as projectNo,
								p.member_no as projectWriterMemberNo,
								p.recruit_start_date as rStartDate,
								p.recruit_end_date as rEndDate,
								p.view_count as viewCount,
								p.recruit_title as rTitle,
								p.recruit_content as rContent,
								p.project_name as projectName,
								p.project_goal as projectGoal,
								p.project_reader as projectReader,
								p.project_status as projectStatus,
								p.project_start_date as pStartDate,
								p.project_end_date as pEndDate,
								(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
								(select count(*) from project_dibs pd where pd.project_no = p.project_no) as dibCount,
					            (select count(*) from comments where BOARD_TYPE = 3 and BOARD_NO = p.project_no) as commentCount
							from project p
                            where p.project_no in ((select project_no from use_project_language where language_no = (select project_no from use_project_language where language_no = 
                            (select language_no from develop_language where language_name = 'node.js'))))
                            order by p.project_no DESC)
                        where rnum between 1 and 30;
                            
                            where rnum between 1 and 30 and projectNo in ((select project_no from use_project_language where language_no = 
                            (select language_no from develop_language where language_name = 'node.js')));
                            
                            select * from develop_language;
                            select* from use_project_language;
                            
                        select project_no from use_project_language where language_no = 
                            (select language_no from develop_language where language_name = 'node.js');
                        
                        select language_no from develop_language where language_name = 'javascript';
                        
                        
                        
                    select * from  
                        (select
					            rownum as rnum,
								p.project_no as projectNo,
								p.member_no as projectWriterMemberNo,
								p.recruit_start_date as rStartDate,
								p.recruit_end_date as rEndDate,
								p.view_count as viewCount,
								p.recruit_title as rTitle,
								p.recruit_content as rContent,
								p.project_name as projectName,
								p.project_goal as projectGoal,
								p.project_reader as projectReader,
								p.project_status as projectStatus,
								p.project_start_date as pStartDate,
								p.project_end_date as pEndDate,
								(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
								(select count(*) from project_dibs pd where pd.project_no = p.project_no) as dibCount,
					            (select count(*) from comments where BOARD_TYPE = 3 and BOARD_NO = p.project_no) as commentCount
							from project p
                            where p.project_no in ((select project_no from use_project_language where language_no in (select project_no from use_project_language where language_no in 
                            (select language_no from develop_language where language_name in ('node.js','javascript')))))
                            order by p.project_no DESC)
                        where rnum between 1 and 30;
                            select language_no from develop_language where language_name in ('node.js','javascript');
                            select project_no from use_project_language where language_no in (select project_no from use_project_language where language_no = 
                            (select language_no from develop_language where language_name = 'node.js'));
                            
                            select project_no from use_project_language where language_no = 
                            (select language_no from develop_language where language_name = 'node.js');
                            
                'node.js', 'python'            
          select * from
				            (select
					            rownum as rnum,
								p.project_no as projectNo,
								p.member_no as projectWriterMemberNo,
								p.recruit_start_date as rStartDate,
								p.recruit_end_date as rEndDate,
								p.view_count as viewCount,
								p.recruit_title as rTitle,
								p.recruit_content as rContent,
								p.project_name as projectName,
								p.project_goal as projectGoal,
								p.project_reader as projectReader,
								p.project_status as projectStatus,
								p.project_start_date as pStartDate,
								p.project_end_date as pEndDate,
								(select filepath from member m where m.member_no = p.member_no) as writerImgPath,
								(select count(*) from project_dibs pd where pd.project_no = p.project_no ) as dibCount,
					            (select count(*) from comments where BOARD_TYPE = 3 and BOARD_NO = p.project_no) as commentCount
							from project p
							where p.project_status = 1 and p.project_no in (
								(select project_no from use_project_language where language_no in (select project_no from use_project_language where language_no in 
	                            (select language_no from develop_language where language_name in ('node.js', 'python')))))
			       			order by viewCount DESC, dibCount DESC, commentCount DESC, project_no DESC) 
						where rnum between 1 and 30;
         
                        
 select * from
                            
(select rownum as rnum, p.project_no as projectNo,p.member_no as projectWriterMemberNo, p.recruit_start_date as rStartDate,p.recruit_end_date as rEndDate, p.view_count as viewCount, p.recruit_title as rTitle, p.recruit_content as rContent,         
p.project_name as projectName, 
p.project_goal as projectGoal, 
p.project_reader as projectReader,
p.project_status as projectStatus, 
p.project_start_date as pStartDate, 
p.project_end_date as pEndDate, 
(select filepath from member m where m.member_no = p.member_no) as writerImgPath, 
(select count(*) from project_dibs pd where pd.project_no = p.project_no) as dibCount,  
(select count(*) from comments where BOARD_TYPE = 3 and BOARD_NO = p.project_no) as commentCount        
from project p  
where p.project_no in ( (select project_no from use_project_language where language_no in 
(select project_no from use_project_language where language_no in (select language_no from develop_language where language_name in( ( 'node.js', 'python') ))
))) 
order by p.project_no DESC)  
where rnum between 1 and 30;
                        
                        
                        
                        
                        
                  