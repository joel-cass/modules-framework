<cfoutput>
<form action="" method="POST">
	<div>
		<label for="txtSearch">Enter Keyword:</label>
		<input type="text" name="keyword" id="txtSearch" value="#keyword#">
		<input type="submit" class="button" value="GO">
	</div>
	
	<input type="hidden" name="collection" value="collection_name">
	
	<input type="hidden" name="#modeField#" value="submit">
</form>
</cfoutput>