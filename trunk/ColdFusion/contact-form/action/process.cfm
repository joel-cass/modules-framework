<!-- get parameters -->
<cfset strTo = form["to_email"]>
<cfset strFrom = form["email"]>
<cfset strSubject = form["subject"]>
<cfset strMessage =  "Message posted from " & CGI['SERVER_NAME']>
<cfset strMessage = strMessage & " at " & dateFormat(now()) &  " " & timeFormat(now()) & chr(13) & chr(10)>
<cfset strMessage = strMessage & "------------------------------------\n\n">
<cfset strMessage = strMessage & "Name: " & form["name"] & chr(13) & chr(10)>
<cfset strMessage = strMessage & "Email: " & form["email"] & chr(13) & chr(10)>
<cfset strMessage = strMessage & "Message: " & form["message"]>

<!-- send mail -->
<cfmail from="#strFrom#" to="#strTo#" subject="#strSubject#">#strMessage#</cfmail>

<cfset mode = "thanks">