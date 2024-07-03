#Find the total number of employees working on each project:
SELECT Projects.ProjectName, COUNT(TeamMembers.EmployeeID) AS EmployeeCount
FROM Projects
JOIN TeamMembers ON Projects.ProjectID = TeamMembers.ProjectID
GROUP BY Projects.ProjectName;