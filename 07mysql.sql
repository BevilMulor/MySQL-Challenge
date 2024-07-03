#Find all clients with projects having a deadline after October 31st, 2024:
SELECT DISTINCT Clients.ClientName
FROM Projects
JOIN Clients ON Projects.ClientID = Clients.ClientID
WHERE Projects.Deadline > '2024-10-31';