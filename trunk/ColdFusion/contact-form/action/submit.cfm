<cfset aryError = arrayNew()>

<!-- required fields -->
<cfif form["name"] EQ "">
	<cfset aryError["name"] = "Please enter your name">
</cfif>
<cfif form["email"] EQ "">
	<cfset aryError["email"] = "Please enter your email address">
</cfif>
<cfif form["message"] EQ "">
	<cfset aryError["message"] = "Please enter your message">
</cfif>


<!-- email fields -->
<cfif REFindNoCase("^[^@]+@[^@]+.[^@]+$", form["email"]) EQ 0>
	<cfset aryError["email"] = "Your email address does not appear to be valid">
</cfif>

<!-- spam check - check that field is not filled in -->
<cfif form["spamcheck"] NEQ "">
	<cfset aryError["spamcheck"] = "Please do not fill in this field">
</cfif>

<!-- redirection -->
<cfif arrayLen(aryError) EQ 0>
	<cfset mode = "form">
<cfelse>
	<cfset mode = "process">
</cfif>