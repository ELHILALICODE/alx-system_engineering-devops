Summary
On Mai 20th, 2018 at midnight the server access went down resulting in 504 error for anyone trying to access a website. Background on the server being based on a LAMP stack.

Timeline
00:00 GMT - 500 error for anyone trying to access the website
00:05 GMT - Ensuring Apache and MySQL are up and running.
00:10 GMT - The website was not loading properly which on background check revealed that the server was working properly as well as the database.
00:12 GMT - After a quick restart of Apache, the server returned a status of 200 and OK while trying to curl the website.
00:18 GMT - Reviewing error logs to check where the error might be coming from.
00:25 GMT - Check /var/log to see that the Apache server was being prematurely shut down. The error log for PHP was nowhere to be found.
00:30 GMT - Checking php.ini settings revealed all error logging had been turned off. Turning the error logging on.
00:32 GMT - Restarting apache server and going to the error logs to check what is being logged into the php error logs.
00:36 GMT - Reviewing error logs for php revealed a mistyped file name which was resulting in incorrect loading and premature closing of apache.
00:38 GMT - Fixing file name and restarting Apache server.
00:40 GMT - The server is now running normally and the website is loading properly.
Root Cause and Resolution

The issue stemmed from an incorrect file name in the wp-settings.php file, specifically a file with a .phpp extension instead of .php. When attempting to curl the server, a 500 error was returned. Investigating the error logs revealed that no PHP error log file was being created, and the default Apache error log did not provide useful information regarding the server's premature closure.
Upon realizing that PHP error logs were not being generated, the engineer reviewed the php.ini file and discovered that error logging was disabled. After enabling error logging and restarting the Apache server, the PHP logs revealed the misspelled file extension in wp-settings.php.
To resolve the issue, the engineer used Puppet to deploy a fix across all servers, correcting the file extension. Restarting the servers resulted in the site and server loading properly.
Corrective and Preventive Measures
Please make sure that error logging is enabled on all servers and sites to facilitate quick identification and resolution of issues.
Local Testing: Test all servers and sites locally before deploying to a multi-server setup to identify and correct errors before going live, minimizing downtime and fixing time.
