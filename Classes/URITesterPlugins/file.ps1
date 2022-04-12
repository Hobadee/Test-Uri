class URITesterPluginFile : URITesterPlugin{
    #
    URITesterPluginFile(){
        $this.name = "File Plugin"
        $this.version = "0.0.1"
        $this.handler = "file"
    }
}

[URITesterPluginFile]::new().register()
