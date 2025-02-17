
-------------------------------------Database Accident_Summary_DB------------------------

create database Accident_Summary_DB

use Accident_Summary_DB

select * from accidents

----------------------------------------------------------------------------------------
-----------------------a. Total Number Of casualties of year 2022--------------------------


select format(accident_date,'yyyy') as 'year of 2022',sum (number_of_casualties) as 'total count of casualties' from accidents
where format(accident_date,'yyyy') ='2022'
group by format(accident_date,'yyyy')

------------------------------------------------------------------------------------------
----------------------------b. Total Number of accident of year 2022--------------------------

select format(accident_date,'yyyy') as 'year of 2022' ,count( accident_index) as 'total count of accident'from accidents
where format(accident_date,'yyyy') = '2022'
group by format(accident_date,'yyyy')

------------------------------------------------------------------------------------------------
------------------------------c. Total fatal Casualtes of year 2022-----------------------

select count(accident_severity) as 'total fatal accident' , sum(number_of_casualties) as 'total count of casualties', format(accident_date,'yyyy') as 'year of 2022' from accidents
where format(accident_date,'yyyy') ='2022'and accident_severity like 'fatal'
group by format(accident_date,'yyyy') 

-------------------------------------------------------------------------------------------------------
-------------------------d. Total serious Casualtes of year 2022---------------------

select * from accidents

select count(accident_severity) as 'total accident serious', sum(number_of_casualties) as 'total casualties',
format(accident_date,'yyyy') as 'year of 2022'
from accidents
where accident_severity like 'serious' and format(accident_date,'yyyy')='2022'
group by format(accident_date,'yyyy')

---------------------------------------------------------------------------------------------------------
---------------------------e. Total Slight Casualtes of year 2022------------------------------

select count(accident_severity) as 'total accident slight',sum(number_of_casualties) as 'total casualties', format(accident_date,'yyyy') as 'year of 2022' from accidents
where accident_severity like 'slight' and format(accident_date,'yyyy')='2022'
group by format(accident_date,'yyyy')

                       ------------------------------------------------------------------
select sum(number_of_casualties) as Current_year_slight from accidents
where year(accident_date)='2022' and accident_severity='slight'
--------------------------------------------------------------------------------------------------------------
-----------------------------f. Group the Vehicle type with their number of accident by them-----------------------

select * from accidents

select vehicle_type , count(vehicle_type) as 'total counnt of vehicle type' , count(accident_index) as 'total count of accident' 
from accidents
group by vehicle_type

                 --------------------------------------------------------------


SELECT
  vehicle_category,
  SUM(number_of_casualties) AS Current_year_casualties
FROM (
  SELECT 
    CASE
      WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'cars'
      WHEN vehicle_type = 'Agricultural Vehicle' THEN 'Agricultural'
      WHEN vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc') THEN 'bikes'
      WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'buses'
      WHEN vehicle_type IN ('Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under', 'Goods 7.5 tonnes mgw and over') THEN 'Vans'
      ELSE 'Others'
    END AS vehicle_category,
    number_of_casualties
  FROM 
    [dbo].[accidents]
  WHERE 
    YEAR(accident_date) = 2022
) AS derived_table
GROUP BY
  vehicle_category;
-----------------------------------------------------------------------------------------------------------------------------
-------------------------------- g. Year 2022 casualties month trend-------------------------------

select * from accidents


select format(accident_date,'MM/yyyy') as 'month', sum(number_of_casualties) as 'total casualties'
from accidents
where format(accident_date,'yyyy')='2022'
group by format(accident_date,'MM/yyyy')
order by format(accident_date,'MM/yyyy') , sum(number_of_casualties) asc
                  ---------------------------------------------------------------

select format(accident_date,'MM/yyyy') as 'month',sum(number_of_casualties) as 'total casualties'
from accidents
where format(accident_date,'MM')='10' AND format(accident_date,'yyyy')='2022'
group by format(accident_date,'MM/yyyy'), format(accident_date,'yyyy')



----------------------------------------------------------------------------------------------------------------
--------------------------h. 2021 casualties month trend--------------------------------------


select * from accidents


select format (accident_date, 'MM/yyyy') as 'month' , sum(number_of_casualties) as 'total casualties'
from accidents
where format (accident_date, 'yyyy')='2021'
group by format (accident_date, 'MM/yyyy')
order by format (accident_date, 'MM/yyyy') asc

----------------------------------------------------------------------------------------------------
----------------i. Casualties in different Different Type Road Types in year 2022---------

select format(accident_date,'yyyy') as 'year 2022' , road_type , sum(number_of_casualties) as 'total casualties'
from accidents
where format(accident_date,'yyyy')='2022' 
group by format(accident_date,'yyyy'),road_type
order by sum(number_of_casualties) asc

-----------------------------------------------------------------------------------------------------

---------------------j. Casualties in Rural and Urban Areas in year 2022-----------------

select * from accidents

select format(accident_date,'yyyy') as 'year 2022', urban_or_rural_area , sum(number_of_casualties) as 'total count of casualties'
from accidents
where format(accident_date,'yyyy')='2022'
group by urban_or_rural_area ,format(accident_date,'yyyy')

---------------------------------------------------------------------------------------------------------------------
-----------------------k. Casualties by lightening Condition in year 2022----------------------

select * from accidents

select format(accident_date,'yyyy') as 'year 2022', light_conditions , sum(number_of_casualties) as 'total count of casualties'
from accidents
where format(accident_date,'yyyy')='2022'
group by light_conditions ,format(accident_date,'yyyy')



SELECT 
  Light_condition,
  SUM(number_of_casualties) AS Total_Casualties
FROM (
  SELECT 
    CASE 
      WHEN light_conditions = 'Daylight' THEN 'Day'
      WHEN light_conditions IN ('Darkness - lights lit', 'Darkness - lighting unknown', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
      ELSE 'Other'
    END AS Light_condition,
    number_of_casualties
  FROM 
    [dbo].[accidents]
  WHERE 
    YEAR(accident_date) = 2022
	) AS derived_table
GROUP BY 
  Light_condition;

--------------------------------------------------------------------------------------------------------------
-----------------l. Top 10 location where the highest number of casualties occurred in year 2022--------------------

select top 10 format(accident_date,'yyyy') as 'year 2022', local_authority as 'location', 
sum(number_of_casualties) as 'total count of casualties'
from accidents
where format(accident_date,'yyyy')='2022'
group by local_authority,format(accident_date,'yyyy')
order by sum(number_of_casualties) desc
 
 -------------------------------------------------------------------------------------------------------





