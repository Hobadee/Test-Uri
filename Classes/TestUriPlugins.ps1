<#
Singleton as the root class which contains references to it's plugins
Plugins are a class, but register with a simple "plugin::register()" at the end of the plugin Failed
#>



<##
 # Singleton class
 #
 # Powershell doesn't have real singleton instances, so we fake it here.
 # Instantiate instance with:
 #  `$var = [TestUriPlugins]::GetInstance()`
 #>
class TestUriPlugins : System.Collections.Generic.List[PSObject]{


    # This hidden static variable stores our "singleton" instance
	hidden static [TestUriPlugins] $_instance = [TestUriPlugins]::new()


    <##
     # Singleton emulator
     # If instance is instantiated, return instance, else instantiate new instance and return that
     #
     # @return TestUriPlugins "singleton" instance of TestUriPlugins
     #>
	static [TestUriPlugins] GetInstance(){
		return [TestUriPlugins]::_instance
	}


	TestUriPlugins(){
	}


    [TestUriPlugins]Register($plugin){

        if($plugin.getName() -eq $null){
            throw "Plugin must have a name!"
        }
        if($plugin.getVersion() -eq $null){
            throw "Plugin must have a version!"
        }
        if($plugin.getSchemes().count -eq 0){
            throw "Plugin must have schemes configured!"
        }

        Write-Output "Registering plugin"

        $this.add($plugin)
        return $this
    }


    [boolean]checkUri([URI]$URI){
        Write-Debug ("Checking URI Object: "+$URI.AbsoluteUri)
        Write-Debug ("Looking for URI Scheme: "+$URI.Scheme)
        foreach($item in $this){
            foreach($scheme in $item.getSchemes()){
                if($URI.Scheme -eq $scheme){
                    Write-Debug ("Found plugin for scheme: "+$scheme)
                    Write-Debug ("Using plugin: "+$item.getName())
                    return $item.checkUri($URI)
                }
            }
        }
        throw "No plugin found to handle URI scheme!"
    }
}
