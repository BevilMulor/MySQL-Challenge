#Create a stored procedure to move completed projects (past deadlines) to an archive table:
CREATE TABLE ArchivedProjects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(255),
    Requirements TEXT,
    Deadline DATE,
    ClientID INT
);

CREATE PROCEDURE ArchiveCompletedProjects ()
BEGIN
    INSERT INTO ArchivedProjects (ProjectID, ProjectName, Requirements, Deadline, ClientID)
    SELECT ProjectID, ProjectName, Requirements, Deadline, ClientID
    FROM Projects
    WHERE Deadline < CURDATE();
    
    DELETE FROM Projects
    WHERE Deadline < CURDATE();
END;
