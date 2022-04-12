#Region './Classes/00-URITesterPlugins.ps1' 0
<#
Singleton as the root class which contains references to it's plugins
Plugins are a class, but register with a simple "plugin::register()" at the end of the plugin Failed
#>



<##
 # Singleton class
 #
 # Powershell doesn't have real singleton instances, so we fake it here.
 # Instantiate instance with:
 #  `$var = [URITesterPlugins]::GetInstance()`
 #>
class URITesterPlugins : System.Collections.Generic.List[PSObject]{


    # This hidden static variable stores our "singleton" instance
	hidden static [URITesterPlugins] $_instance = [URITesterPlugins]::new()


    <##
     # Singleton emulator
     # If instance is instantiated, return instance, else instantiate new instance and return that
     #
     # @return URITesterPlugins "singleton" instance of URITesterPlugins
     #>
	static [URITesterPlugins] GetInstance(){
		return [URITesterPlugins]::_instance
	}


	URITesterPlugins(){
	}


    [URITesterPlugins]Register($plugin){
        $this.add($plugin)
        return $this
    }
}
#EndRegion './Classes/00-URITesterPlugins.ps1' 42
#Region './Classes/01-URITesterPlugin.ps1' 0
class URITesterPlugin{

    [string]$Name
    [string]$version
    [string]$handler

    <##
     # Powershell doesn't allow abstract classes or interfaces, so fake it by failing if we call directly
     #>
    URITesterPlugin(){
        #throw "This is an abstract class"
    }


    <##
     # Register this plugin
     #>
    [URITesterPlugin]register(){
        [URITesterPlugins]::GetInstance().Register($this)
        return $this
    }
}
#EndRegion './Classes/01-URITesterPlugin.ps1' 23
#Region './Classes/URITesterPlugins/file.ps1' 0
class URITesterPluginFile : URITesterPlugin{
    #
    URITesterPluginFile(){
        $this.name = "File Pluging"
        $this.version = "0.0.1"
        $this.handler = "file"
    }
}

[URITesterPluginFile]::new().register()
#EndRegion './Classes/URITesterPlugins/file.ps1' 11
#Region './Classes/URITesterPlugins/ftp.ps1' 0
class URITesterPluginFTP : URITesterPlugin{
    #
    URITesterPluginFTP(){
        $this.name = "FTP Pluging"
        $this.version = "0.0.1"
        $this.handler = "ftp"
    }
}

[URITesterPluginFTP]::new().register()
#EndRegion './Classes/URITesterPlugins/ftp.ps1' 11
#Region './Classes/URITesterPlugins/http.ps1' 0
class URITesterPluginHTTP : URITesterPlugin{
    #
    URITesterPluginHTTP(){
        $this.name = "HTTP Pluging"
        $this.version = "0.0.1"
        $this.handler = "ftp"
    }
}

[URITesterPluginHTTP]::new().register()
#EndRegion './Classes/URITesterPlugins/http.ps1' 11
#Region './Public/Test-Plugins.ps1' 0
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
#EndRegion './Public/Test-Plugins.ps1' 22
