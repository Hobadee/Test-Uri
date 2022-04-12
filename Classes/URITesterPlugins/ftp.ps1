class URITesterPluginFTP : URITesterPlugin{
    #
    URITesterPluginFTP(){
        $this.name = "FTP Plugin"
        $this.version = "0.0.1"
        $this.handler = "ftp"
    }
}

[URITesterPluginFTP]::new().register()
