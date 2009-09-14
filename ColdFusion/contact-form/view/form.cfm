<cfoutput>

<cfif arraylen(aryError) GT 0>
	<ul class="error-wrapper">
	<cfloop collection="#aryError#" item="e">
		<li>#aryError[e]#</li>
	</cfloop>
	</ul>
</cfif>

<form action="" method="POST">

	<fieldset>
		<label for="txtName">Name</label>
		<input type="text" name="name" id="txtName" value="#strName#">
	</fieldset>

	<fieldset>
		<label for="txtEmail">Email</label>
		<input type="text" name="email" id="txtEmail" value="#strEmail#">
	</fieldset>

	<fieldset>
		<label for="txtMessage">Message</label>
		<textarea name="message" id="txtMessage">#strMessage#</textarea>
	</fieldset>

	<fieldset class="spam-check">
		<label for="fldSpamCheck">Please leave this field blank</label>
		<input type="text" name="spamcheck" id="fldSpamCheck" value="#strSpamCheck#">
	</fieldset>

	<fieldset>
		<label>&nbsp;</label>
		<input type="submit" id="btnSubmit" value="Send Message">
	</fieldset>

	<input type="hidden" name="to_email" value="#strToEmail#">
	<input type="hidden" name="subject" value="#strSubject#">

	<input type="hidden" name="#modeField#" value="submit">

</form>

</cfoutput>