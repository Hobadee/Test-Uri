function Test-Uri {
	<#
		.Synopsis
			Testing my plugin classes
		
		.Description
            Testing my plugin classes.
						
		.Example
			Test-Plugin
	#>
	[CmdletBinding()]
	Param(
		[parameter(Mandatory=$true, ParameterSetName='Test')]
		[URI]$URI
		,
		[parameter(ParameterSetName='Info')]
		[switch]$ListPlugins
	)

	$plugins = [TestUriPlugins]::GetInstance()

	if($ListPlugins){
		$plugins
	}
	elseif($URI -ne $null){
		return $plugins.checkUri($URI)
	}
	else{
		Write-Error "No URI given!"
	}

	<#
	echo "Status:  [$(New-Text "Success" -fg "Green")]"
	echo "Status:  [$(New-Text "Failure" -fg "Red")]"
	#>
}
