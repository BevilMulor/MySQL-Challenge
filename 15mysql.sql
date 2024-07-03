#Create a view to display the total number of projects assigned to each employee:
CREATE VIEW EmployeeProjectCount AS
SELECT Employees.EmployeeName, COUNT(DISTINCT TeamMembers.ProjectID) AS ProjectCount
FROM Employees
JOIN TeamMembers ON Employees.EmployeeID = TeamMembers.EmployeeID
GROUP BY Employees.EmployeeName;
