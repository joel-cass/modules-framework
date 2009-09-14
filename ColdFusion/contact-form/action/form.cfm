<!-- defaults -->
<cfset strName = "">
<cfset strEmail = "">
<cfset strToEmail = "your@email.address">
<cfset strSubject = "Contact Form Submission">
<cfset strMessage = "">
<cfset strSpamCheck = "">

<!-- get parameters -->
<cfif structKeyExists(form, "name")>
	<cfset strName = form["name"]>
</cfif>
<cfif structKeyExists(form, "email")>
	<cfset strEmail = form["email"]>
</cfif>
<cfif structKeyExists(form, "message")>
	<cfset strMessage = form["message"]>
</cfif>
<cfif structKeyExists(form, "spamcheck")>
	<cfset strSpamCheck = form["spamcheck"]>
</cfif>