class TestUriPluginFile : TestUriPlugin{
    #
    TestUriPluginFile(){
        $this.name = "File Plugin"
        $this.version = "0.0.1"
        $this.handler = "file"
    }
}

[TestUriPluginFile]::new().register()
