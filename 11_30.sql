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

select dbo.avgg(10,20) ���

select * from ������Ȳ

create function fn_��å(@j char(20))
	returns int
as
begin
	return (select count(*) from ������Ȳ where ��å=@j)
end


select dbo.fn_��å('�Ϲݵ����̳�') �Ϲݵ����̳�_�ο���

create function fn_��å2(@j varchar(20))
	returns int
as
begin 
	return (select count(*) from ������Ȳ 
	where ��å like '%'+@j+'%')
end

select dbo.fn_��å2('�����̳�') �����̳�_�ο���

select * from å

create function fn_å(@b varchar(30))
	returns varchar(30)
as
begin
	return (select å���� from å where å�ڵ�=@b)
end

select dbo.fn_å('C1034') å����

create function fn_å2(@b varchar(20))
returns table
as
return (select å����, ���� from å where å�ڵ�=@b)

select * from dbo.fn_å2('C1034')

create function fn_����1(@up int)
returns table
as
return (select * from ���� where ���� >= @up)

select * from dbo.fn_����1(90)

create function fn_����2(@up int, @down int)
returns table
as
return (select * from ���� where ���� <= @up and ���� >= @down)

select * from dbo.fn_����2(90,80)

create function fn_����0(@a int, @b int)
returns @t table (�̸� char(20), ���� int)
as
begin
	insert @t
	select �̸�, ���� from ���� 
	where ���� between @a and @b
	return
end

select * from dbo.fn_����0(90,100)

create function fn_����y(@y int)
returns @t table (�̸� char(20), ���� int)
as
begin
	insert @t
	select �̸�, ���� from ���� where ���� >= @y
	return
end

select *from dbo.fn_����y(90)