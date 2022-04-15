class TestUriPlugin{

    [string]$Name
    [string]$version
    [string]$handler

    <##
     # Powershell doesn't allow abstract classes or interfaces, so fake it by failing if we call directly
     #>
    TestUriPlugin(){
        #throw "This is an abstract class"
    }


    <##
     # Register this plugin
     #>
    [TestUriPlugin]register(){
        [TestUriPlugins]::GetInstance().Register($this)
        return $this
    }
}
