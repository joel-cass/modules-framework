<cfsetting enablecfoutputonly="true">

<!--- @name: Controller Framework --->
<!--- @author: Joel Cass --->
<!--- @description: Very basic framework for minor applications
Structure:
./
	[attributes.module]/
		action/
			[mode].cfm - gets / modifies data as per instruction	[optional]
		view/
			[mode].cfm - displays data / interfaces, can also be used for relocations.
 --->

<cfif thisTag.ExecutionMode EQ "start">
	<cfparam name="attributes.module" type="string" default="">
	<cfparam name="attributes.modeField" type="string" default="#attributes.module#_mode">
	<cfparam name="attributes.defaultMode" type="string" default="default">
	<cfparam name="attributes.stObj" type="struct">
	
	<cfset _mode = attributes.defaultMode>
	<cfset _path = getDirectoryFromPath(getCurrentTemplatePath())>
	
	<cfif NOT directoryExists("#_path#/#attributes.module#")>
		<cfthrow message="Module #attributes.module# not found.">
	</cfif>
	
	<cfif structKeyExists(FORM, attributes.modeField)>
		<cfset _mode = FORM[attributes.modeField]>
	<cfelseif structKeyExists(URL, attributes.modeField)>
		<cfset _mode = URL[attributes.modeField]>
	</cfif>
	
	<!--- include module file for any params --->
	<cfif fileExists("#_path#/#attributes.module#/module-params.cfm")>
		<cfinclude template="#attributes.module#/module-params.cfm">
	</cfif>
	
	<!--- include model file from processing / getting data --->
	<cfset lastMode = "">
	<cfloop condition="#lastMode# NEQ #_mode#">
		<cfset lastMode = _mode>
		<cfif fileExists("#_path#/#attributes.module#/action/#_mode#.cfm")>
			<cfinclude template="#attributes.module#/action/#_mode#.cfm">
		</cfif>
	</cfloop>
	
	<!--- include view file for displaying data --->
	<cfif fileExists("#_path#/#attributes.module#/view/#_mode#.cfm")>
		<cfinclude template="#attributes.module#/view/#_mode#.cfm">
	</cfif>
</cfif>

<cfsetting enablecfoutputonly="false">