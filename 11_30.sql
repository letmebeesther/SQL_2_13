create function hap()
	returns int
as
begin
	return 3+5
end

select dbo.hap()

create function hap2(@x int, @y int)
	returns int
as
begin
	return @x+@y
end

select dbo.hap(10,20)

create function avgg(@a int, @b int)
	returns float
as
begin
	return (@a+@b)/2.0
end

select dbo.avgg(10,20) 평균

select * from 팀장현황

create function fn_직책(@j char(20))
	returns int
as
begin
	return (select count(*) from 팀장현황 where 직책=@j)
end


select dbo.fn_직책('일반디자이너') 일반디자이너_인원수

create function fn_직책2(@j varchar(20))
	returns int
as
begin 
	return (select count(*) from 팀장현황 
	where 직책 like '%'+@j+'%')
end

select dbo.fn_직책2('디자이너') 디자이너_인원수

select * from 책

create function fn_책(@b varchar(30))
	returns varchar(30)
as
begin
	return (select 책제목 from 책 where 책코드=@b)
end

select dbo.fn_책('C1034') 책제목

create function fn_책2(@b varchar(20))
returns table
as
return (select 책제목, 가격 from 책 where 책코드=@b)

select * from dbo.fn_책2('C1034')

create function fn_점수1(@up int)
returns table
as
return (select * from 성적 where 점수 >= @up)

select * from dbo.fn_점수1(90)

create function fn_점수2(@up int, @down int)
returns table
as
return (select * from 성적 where 점수 <= @up and 점수 >= @down)

select * from dbo.fn_점수2(90,80)

create function fn_점수0(@a int, @b int)
returns @t table (이름 char(20), 점수 int)
as
begin
	insert @t
	select 이름, 점수 from 성적 
	where 점수 between @a and @b
	return
end

select * from dbo.fn_점수0(90,100)

create function fn_점수y(@y int)
returns @t table (이름 char(20), 점수 int)
as
begin
	insert @t
	select 이름, 점수 from 성적 where 점수 >= @y
	return
end

select *from dbo.fn_점수y(90)