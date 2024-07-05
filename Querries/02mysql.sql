# List all projects for "Big Retail Inc." ordered by deadline:
SELECT Projects.*
FROM Projects
JOIN Clients ON Projects.ClientID = Clients.ClientID
WHERE Clients.ClientName = 'Big Retail Inc.'
ORDER BY Projects.Deadline;
