#Count the number of projects assigned to David Lee:
SELECT COUNT(DISTINCT Projects.ProjectID) AS ProjectCount
FROM Projects
JOIN TeamMembers ON Projects.ProjectID = TeamMembers.ProjectID
JOIN Employees ON TeamMembers.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeName = 'David Lee';