# database-creation
Code that reads an sql file and creates a database
To run this project we need an empty SQLite database or MS-Access database. This code reads the SQL script previously created, parses the script into separate SQL statements, displays the statements one after the other in a listbox, and sends them one by one (as welll as checks whether or not the table already existst) to the previously seleted SQLite or Ms-Access database for execution.
