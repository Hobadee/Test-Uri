class URITesterPluginHTTP : URITesterPlugin{
    #
    URITesterPluginHTTP(){
        $this.name = "HTTP Plugin"
        $this.version = "0.0.1"
        $this.handler = "http"
    }
}

[URITesterPluginHTTP]::new().register()
