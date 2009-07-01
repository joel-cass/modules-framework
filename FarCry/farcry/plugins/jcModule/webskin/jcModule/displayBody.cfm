<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Standard Page Display for gruModule --->
<!--- @@author: Joel Cass --->

<!--- tag libraries --->
<cfimport taglib="#application.packagepath#/modules" prefix="mod">
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<mod:controller module="#stObj.ModuleName#" defaultMode="#stObj.defaultMode#" stObj="#stObj#">

<cfsetting enablecfoutputonly="false" />
