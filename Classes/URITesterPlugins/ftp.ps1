class TestUriPluginFTP : TestUriPlugin{
    #
    TestUriPluginFTP(){
        $this.name = "FTP Plugin"
        $this.version = "0.0.1"
        $this.handler = "ftp"
    }
}

[TestUriPluginFTP]::new().register()
