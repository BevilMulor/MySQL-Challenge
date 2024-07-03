#Display a message indicating if a project is overdue (deadline passed):
SELECT ProjectName,
       CASE
           WHEN Deadline < CURDATE() THEN 'Overdue'
           ELSE 'On Schedule'
       END AS Status
FROM Projects;
