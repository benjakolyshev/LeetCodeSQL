UPDATE  SALARY
SET
        SEX = (CASE sex WHEN 'm' THEN 'f'
        ELSE 'm' end);
       
/*
SELECT salary
SET sex = if(sex = 'm', 'f', 'm')
*/