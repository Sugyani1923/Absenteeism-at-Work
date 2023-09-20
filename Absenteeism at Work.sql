--create a join table
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID 
left join Reasons r
on a.Reason_for_absence = r.Number;

---find the healthiest Employees for bonus
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index <25 and 
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

---compensation rate increase for non-smokers/ budget $983,221 so .68 increase per hour/ $1,414.4 per year
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0

---Optimize this query
select a.ID, 
r.Reason, 
Month_of_absence, 
Body_mass_index,
CASE When Body_mass_index < 18.5 then 'Under Weight'
     When Body_mass_index between 18.5 and 25 then 'Healthy Weight'
	 When Body_mass_index between 25 and 30 then 'Over Weight'
	 When Body_mass_index > 30 then 'Obese'
	 ELSE 'Unknown' END as BMI_Category,
CASE when Month_of_absence IN (12,1,2) Then 'Winter'
     when Month_of_absence IN (3,4,5) Then 'Spring'
	 when Month_of_absence IN (6,7,8) Then 'Summer'
	 when Month_of_absence IN (9,10,11) Then 'Fall'
	 Else 'Unknown' END as Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID 
left join Reasons r
on a.Reason_for_absence = r.Number;





