function Test-Plugins {
	<#
		.Synopsis
			Testing my plugin classes
		
		.Description
            Testing my plugin classes.
						
		.Example
			Test-Plugin
	#>
	[CmdletBinding(SupportsShouldProcess=$true)]

	$plugins = [URITesterPlugins]::GetInstance()
	return $plugins

	<#
	echo "Status:  [$(New-Text "Success" -fg "Green")]"
	echo "Status:  [$(New-Text "Failure" -fg "Red")]"
	#>
}
