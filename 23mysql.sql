#Create a view to display project details along with the total number of team members assigned:
CREATE VIEW ProjectDetailsWithTeamCount AS
SELECT Projects.ProjectName, Projects.Requirements, Projects.Deadline, COUNT(TeamMembers.EmployeeID) AS TeamMemberCount
FROM Projects
JOIN TeamMembers ON Projects.ProjectID = TeamMembers.ProjectID
GROUP BY Projects.ProjectID;
Create a view to show overdue projects with the number of days overdue:
sql
Copy code
CREATE VIEW OverdueProjects AS
SELECT ProjectName, DATEDIFF(CURDATE(), Deadline) AS DaysOverdue
FROM Projects
WHERE Deadline < CURDATE();