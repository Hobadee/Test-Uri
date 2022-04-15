class TestUriPluginWeb : TestUriPlugin{
    #
    TestUriPluginWeb(){
        $this.name = "Web Plugin"
        $this.version = "1.0.0"
        $this.schemes = @("http", "https", "ftp", "ftps")
    }

    [boolean]checkUri([URI]$URI){
        $sts = $null
        try{
            $sts = Invoke-WebRequest -Uri $URI
        }
        catch{
            Write-Debug "Invoke-WebRequest failed"
        }
        if($sts.StatusCode -eq 200){
            return $true
        }
        else{
            return $false
        }
    }
}

[TestUriPluginWeb]::new().register()
