class TestUriPluginHTTP : TestUriPlugin{
    #
    TestUriPluginHTTP(){
        $this.name = "HTTP Plugin"
        $this.version = "0.0.1"
        $this.handler = "http"
    }
}

[TestUriPluginHTTP]::new().register()
