/*q1*/
select * from (select REVIEWID,CONTENT,USERID,TIME from F15_MOVIECOMMENT where reviewid = 40 order BY TIME DESC) where rownum<=3;

/*q2*/
select * from (select REVIEWID,CONTENT,USERID,TIME from F15_MOVIECOMMENT order BY TIME DESC) where rownum<=3;

/*q3*/
select * from(select count(*) as count, reviewid from F15_MOVIECOMMENT Group By REVIEWID order by count DESC) where rownum<=3;

/*q4*/

/*q5*/
select count(*) as count,userid from F15_MOVIECOMMENT group by userid having count(*)>= all(select count(*) from F15_MOVIECOMMENT group by userid);

/*q6*/
select id,address,count from(select count(*) as count,THEATREID from F15_MOVIESCHEDULE ms, F15_SCREENSROOM sr where ms.SCREENINGROOMNO=sr.id group by THEATREID having count(*)=(select max(count(*))from F15_MOVIESCHEDULE ms, F15_SCREENSROOM sr where ms.SCREENINGROOMNO=sr.id group by THEATREID))a, f15_theatre t where a.theatreid=t.id;

/*q7*/
select * from F15_THEATRE where TICKETCOUNT=(select max(ticketcount)from F15_THEATRE);

/*q8*/
select name,job,theatreid,workingtimestart,to_char(workingtimestart,'Day') from(select * from (select * from F15_ENROLLMENT where to_char(WORKINGTIMESTART,'Day')=(select to_char(to_date('2015-11-09','yyyy-MM-dd'),'Day') from dual) and theatreid = 2) a , f15_staff s where a.employee=s.ssn) b, f15_user u where b.userid= u.id;

/*q9*/
select * from f15_enrollment where to_char(workingtimestart,'yyyy-mm-dd')=to_char(sysdate+1,'yyyy-mm-dd') and THEATREID=2 and JOB='Security';
