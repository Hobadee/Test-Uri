<##
 # This is an abstract class.  Powershell doesn't allow abstract classes.  We fake it.
 #
 # All URI test plugins extend this class
 #>
class TestUriPlugin{

    [string]$name
    [string]$version
    [Array]$schemes = $()

    <##
     # Powershell doesn't allow abstract classes or interfaces, so fake it by failing if we call directly
     #>
    TestUriPlugin(){
        $type = $this.GetType()

        if ($type -eq [TestUriPlugin])
        {
            throw("Class $type must be inherited")
        }
    }


    <##
     # Powershell doesn't allow abstract classes or interfaces, so fake it by failing if we call directly
     #>
    [boolean]checkUri([URI]$URI){
        throw "Plugin check not implemented!  Must override checkUri() method!"
    }


    <##
     # Register this plugin
     #>
    [TestUriPlugin]register(){
        [TestUriPlugins]::GetInstance().Register($this)
        return $this
    }


    [string]getName(){
        return $this.name
    }
    [string]getVersion(){
        return $this.version
    }
    [Array]getSchemes(){
        return $this.schemes
    }
}
