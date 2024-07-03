#Find the team lead for the "Mobile App for Learning" project:
SELECT Employees.EmployeeName
FROM ProjectTeam
JOIN Employees ON ProjectTeam.EmployeeID = Employees.EmployeeID
JOIN Projects ON ProjectTeam.ProjectID = Projects.ProjectID
WHERE Projects.ProjectName = 'Mobile App for Learning' AND ProjectTeam.TeamLead = TRUE;