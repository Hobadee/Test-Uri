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
		[parameter(Mandatory=$true)]
		[String]
		$URI
	)


	$plugins = [TestUriPlugins]::GetInstance()
	$UriObj = [URI]::new($URI)

	$ret = $plugins.checkUri($UriObj)

	return $ret

	<#
	echo "Status:  [$(New-Text "Success" -fg "Green")]"
	echo "Status:  [$(New-Text "Failure" -fg "Red")]"
	#>
}
