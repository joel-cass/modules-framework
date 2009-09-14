<cfparam name="collection">
<cfparam name="keyword" default="">

<cfif keyword NEQ "">
	<cfset mode = "results">
<cfelse>
	<cfset mode = "form">
</cfif>