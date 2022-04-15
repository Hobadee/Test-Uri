class TestUriPluginFile : TestUriPlugin{
    #
    TestUriPluginFile(){
        $this.name = "File Plugin"
        $this.version = "1.0.0"
        $this.schemes = @("file")
    }

    [boolean]checkUri([URI]$URI){
        Write-Debug ("Testing path: "+$URI.AbsolutePath)
        return Test-Path -Path $URI.AbsolutePath
    }
}

[TestUriPluginFile]::new().register()
