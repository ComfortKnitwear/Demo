


select SUM(qry.TotalPcs) from 
(
SELECT        Employee, Department, Job, PO, SUM(Pcs) AS TotalPcs, COUNT(Employee) AS Count, Branch
FROM            dbo.Employee_Work
GROUP BY Employee, PO, Department, Job, Branch

) as qry



SELECT      *
FROM            dbo.Employee_Work
where id not in

(
SELECT        Id
FROM            dbo.Employee_Work INNER JOIN
                         dbo.PORates ON dbo.Employee_Work.PO = dbo.PORates.PONo AND dbo.Employee_Work.Department = dbo.PORates.Department AND dbo.Employee_Work.Job = dbo.PORates.Job
--GROUP BY dbo.Employee_Work.Employee, dbo.Employee_Work.PO, dbo.Employee_Work.Department, dbo.Employee_Work.Job, dbo.Employee_Work.Branch, dbo.PORates.Rate, dbo.PORates.Alteration, dbo.PORates.Style


)




--select * from Employee_Work where PO = 1230913 and Job = 486


--update Employee_Work

--set Job = 586
--where PO = 1230913 and Job = 486


--select * from PORates where PONo = 1240053 and Department = 3 and Job = 97

--update PORates
--set Department = 4, Job = 397
--where PONo = 1240053 and Department = 3 and Job = 97

