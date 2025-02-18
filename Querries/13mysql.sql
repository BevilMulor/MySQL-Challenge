__Create a view to display project information along with assigned team leads:
CREATE VIEW ProjectWithTeamLeads AS
SELECT Projects.ProjectName, Employees.EmployeeName AS TeamLead
FROM Projects
JOIN ProjectTeam ON Projects.ProjectID = ProjectTeam.ProjectID
JOIN Employees ON ProjectTeam.EmployeeID = Employees.EmployeeID
WHERE ProjectTeam.TeamLead = TRUE;