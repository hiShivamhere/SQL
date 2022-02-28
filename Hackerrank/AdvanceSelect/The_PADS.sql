SET @a=0, @d=0, @p=0, @s=0;

SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM
(
 SELECT IF (OCCUPATION='Doctor', Name, NULL) AS Doctor,
        IF (OCCUPATION='Professor', Name, NULL) AS Professor,
        IF (OCCUPATION='Singer', Name, NULL) AS Singer,
        if (OCCUPATION='Actor', Name, NULL) as Actor,
  CASE OCCUPATION
    WHEN 'Doctor' THEN @d:= @d+1
    WHEN 'Professor' THEN @p:= @p+1
    WHEN 'Singer' THEN @s:= @s+1
    when 'Actor' THEN @a:= @a+1
 end as OCPN
 FROM OCCUPATIONS
 ORDER BY NAME    
)
AS TEMP
GROUP BY TEMP.OCPN;
