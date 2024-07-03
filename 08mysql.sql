#List employees who are not currently team leads on any project:
SELECT Employees.EmployeeName
FROM Employees
LEFT JOIN ProjectTeam ON Employees.EmployeeID = ProjectTeam.EmployeeID AND ProjectTeam.TeamLead = TRUE
WHERE ProjectTeam.EmployeeID IS NULL;