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
