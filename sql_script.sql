CREATE TABLE companyTypes ( 
companyTypesID SMALLINT NOT NULL,
companyTypesStr VARCHAR(30),
PRIMARY KEY (companyTypesID));

CREATE TABLE relationshipTypes ( 
relationshipTypesID SMALLINT NOT NULL,
relationshipTypesStr VARCHAR(30),
PRIMARY KEY (relationshipTypesID));

CREATE TABLE languages ( 
languagesID SMALLINT NOT NULL,
languagesStr VARCHAR(30),
PRIMARY KEY (languagesID));

CREATE TABLE company ( 
companyID SMALLINT NOT NULL,
companyStr VARCHAR(30) NOT NULL,
streetAddress VARCHAR(40) NOT NULL,
city VARCHAR(25) NOT NULL,
state VARCHAR(3) NOT NULL,
zipCode VARCHAR(9) NOT NULL,
alias VARCHAR(30),
entryDate DATETIME NOT NULL,
companyTypesID SMALLINT NOT NULL,
languagesID SMALLINT NOT NULL,
PRIMARY KEY (companyID),
FOREIGN KEY (languagesID) REFERENCES languages (languagesID),
FOREIGN KEY (companyTypesID) REFERENCES companyTypes (companyTypesID));

CREATE TABLE companyRelationships ( 
companyRelationshipsID SMALLINT NOT NULL,
fromCompany SMALLINT NOT NULL,
toCompany SMALLINT NOT NULL,
relationshipTypesID SMALLINT NOT NULL,
commentField VARCHAR(150),
dateRecorded DATETIME NOT NULL,
PRIMARY KEY (fromCompany, toCompany),
FOREIGN KEY (fromCompany) REFERENCES company (companyID),
FOREIGN KEY (toCompany) REFERENCES company (companyID),
FOREIGN KEY (relationshipTypesID) REFERENCES relationshipTypes (relationshipTypesID));

CREATE TABLE auditors ( 
auditorsID SMALLINT NOT NULL,
auditCompanyID SMALLINT NOT NULL,
auditorsStr VARCHAR(30) NOT NULL,
PRIMARY KEY (auditorsID));

CREATE TABLE auditType ( 
auditTypeID SMALLINT NOT NULL,
auditTypeStr VARCHAR(30) NOT NULL,
PRIMARY KEY (auditTypeID));

CREATE TABLE auditStatus ( 
auditStatusID SMALLINT NOT NULL,
auditStatusStr VARCHAR(30) NOT NULL,
PRIMARY KEY (auditStatusID));

CREATE TABLE actionType ( 
actionTypeID SMALLINT NOT NULL,
actionTypeStr VARCHAR(30) NOT NULL,
PRIMARY KEY (actionTypeID));

CREATE TABLE audits ( 
auditsID SMALLINT NOT NULL,
auditeeID SMALLINT NOT NULL,
auditorsID SMALLINT NOT NULL,
auditStatusID SMALLINT NOT NULL,
auditDate DATETIME NOT NULL,
auditTypeID SMALLINT NOT NULL,
PRIMARY KEY (auditsID),
FOREIGN KEY (auditTypeID) REFERENCES auditType (auditTypeID),
FOREIGN KEY (auditeeID) REFERENCES company (companyID),
FOREIGN KEY (auditorsID) REFERENCES auditors (auditorsID),
FOREIGN KEY (auditStatusID) REFERENCES auditStatus (auditStatusID));

CREATE TABLE auditAction ( 
auditActionID SMALLINT NOT NULL,
auditsID SMALLINT NOT NULL,
actionTypeID SMALLINT NOT NULL,
auditDate DATETIME NOT NULL,
auditStatusID SMALLINT NOT NULL,
PRIMARY KEY (auditActionID),
FOREIGN KEY (auditsID) REFERENCES audits (auditsID),
FOREIGN KEY (actionTypeID) REFERENCES actionType (actionTypeID),
FOREIGN KEY (auditStatusID) REFERENCES auditStatus (auditStatusID));

CREATE TABLE criteria ( 
criteriaID SMALLINT NOT NULL,
criteriaStr VARCHAR(30) NOT NULL,
PRIMARY KEY (criteriaID));

CREATE TABLE assessment ( 
assessmentID SMALLINT NOT NULL,
assessmentStr VARCHAR(30) NOT NULL,
PRIMARY KEY (assessmentID));

CREATE TABLE legalReference ( 
legalReferenceID SMALLINT NOT NULL,
legalReferenceStr VARCHAR(30) NOT NULL,
PRIMARY KEY (legalReferenceID));

CREATE TABLE resolution ( 
resolutionID SMALLINT NOT NULL,
resolutionStr VARCHAR(30) NOT NULL,
PRIMARY KEY (resolutionID));

CREATE TABLE auditTypeCriteria ( 
auditTypeCriteriaID SMALLINT NOT NULL,
auditTypeID SMALLINT NOT NULL,
criteriaID SMALLINT NOT NULL,
PRIMARY KEY (auditTypeCriteriaID),
FOREIGN KEY (auditTypeID) REFERENCES auditType (auditTypeID),
FOREIGN KEY (criteriaID) REFERENCES criteria (criteriaID));

CREATE TABLE auditResults ( 
auditResultsID SMALLINT NOT NULL,
auditActionID SMALLINT NOT NULL,
auditCriteriaID SMALLINT NOT NULL,
assessmentID SMALLINT NOT NULL,
legalReferenceID SMALLINT NOT NULL,
resolutionID SMALLINT NOT NULL,
PRIMARY KEY (auditResultsID),
FOREIGN KEY (auditActionID) REFERENCES auditAction (auditActionID),
FOREIGN KEY (assessmentID) REFERENCES assessment (assessmentID),
FOREIGN KEY (legalReferenceID) REFERENCES legalReference (legalReferenceID),
FOREIGN KEY (resolutionID) REFERENCES resolution (resolutionID),
FOREIGN KEY (auditCriteriaID) REFERENCES criteria (criteriaID));