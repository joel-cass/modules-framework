<cfcomponent extends="farcry.core.packages.types.versions" 
		displayname="Module" 
		hint="Modules Framework (Base Class)" 
		bSchedule="true" bUseInTree="true" bFriendly="true"
		bObjectBroker="true" objectbrokermaxobjects="100">

	<cfproperty ftseq="01" ftFieldset="General" name="title" type="string" ftlabel="Title" hint="" blabel="true" ftvalidation="required" />
	<cfproperty ftseq="02" ftFieldset="General" name="teaser" type="longchar" fttype="richtext" ftlabel="Teaser" hint="" />
	<cfproperty ftseq="03" ftFieldset="General" name="sendToFriend" type="string" ftlabel="Show Send to Friend link" ftType="list" ftList="No,Yes" ftvalidation="required" />
	<cfproperty ftseq="10" ftFieldset="Module" name="moduleName" type="string" ftlabel="Module" hint="Name of Module" ftType="list" ftListData="getModules" ftvalidation="required" />
	<cfproperty ftseq="11" ftFieldset="Module" name="defaultMode" type="string" ftlabel="Default Mode" hint="Name of first mode to execute" ftType="list" ftListData="getModes" ftvalidation="required" />
	
	
	<cffunction name="getModules" access="public" output="false" returntype="query">
		<cfargument name="objectid" type="string" required="true">
	
		<cfset var qryModules = "">
		<cfset var qryReturn = queryNew("Name,Value", "varchar,varchar")>
	
		<cfdirectory action="list" directory="#expandPath('#application.packagepath#/modules')#" name="qryModules">
		
		<cfloop query="qryModules">
			<cfif qryModules.type EQ "dir" AND left(qryModules.name, 1) NEQ "."> 
				<cfset queryAddRow(qryReturn, 1)>
				<cfset querySetCell(qryReturn, "Name", qryModules.name)>
				<cfset querySetCell(qryReturn, "Value", qryModules.name)>
			</cfif>
		</cfloop>
		
		<cfreturn qryReturn>	
	</cffunction>	
	

	<cffunction name="getModes" access="public" output="false" returntype="query">
		<cfargument name="objectid" type="string" required="true">
	
		<cfset var stcData = getData(objectid=arguments.objectid)>
		<cfset var qryModes = "">
		<cfset var qryReturn = queryNew("Name,Value", "varchar,varchar")>
	
		<cfif stcData.moduleName EQ "">
			<cfset queryAddRow(qryReturn, 1)>
			<cfset querySetCell(qryReturn, "Name", "form")>
			<cfset querySetCell(qryReturn, "Value", "form")>
		<cfelse>
			<cfdirectory action="list" directory="#expandPath('/farcry/projects/consultingworx/modules/#stcData.moduleName#/view/')#" name="qryModes" filter="*.cfm">
			
			<cfloop query="qryModes">
				<cfset queryAddRow(qryReturn, 1)>
				<cfset querySetCell(qryReturn, "Name", listDeleteAt(qryModes.name, listLen(qryModes.name, "."), "."))>
				<cfset querySetCell(qryReturn, "Value", listDeleteAt(qryModes.name, listLen(qryModes.name, "."), "."))>
			</cfloop>
		</cfif>
		
		<cfreturn qryReturn>	
	</cffunction>	
	
</cfcomponent>