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
