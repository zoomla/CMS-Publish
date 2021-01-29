CREATE FUNCTION [dbo].[ZL_StringSplitTable] 
(@str NVARCHAR(MAX),@split NVARCHAR(10))RETURNS TABLE AS RETURN( SELECT B.id FROM 
(SELECT [value] = CONVERT(XML , '' + REPLACE(@str , @split , '') + '')
) A OUTER APPLY (SELECT id = N.v.value('.' , 'nvarchar(100)') FROM A.[value].nodes('/v') N ( v ) ) B) 

GO
CREATE FUNCTION [dbo].[ZL_StripeHtmlTag](@cont varchar(max))
returns varchar(max)
as
begin
declare @tem varchar(max),@i int,@j int;
set @tem = replace(ISNULL(@cont,''),'&nbsp;','');
set @i = charindex('<',@tem,0);
set @j = charindex('>',@tem,1);
while @i < @j
begin
select @tem = replace(@tem,SUBSTRING(@tem,@i,@j-@i+1),'')
set @i = charindex('<',@tem,0);
set @j = charindex('>',@tem,1);
end
return @tem
end