﻿$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'jmeter'
  url            = 'http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.1.zip'
  checksum = '71DDFDFC324D8877C4DA0DFBE9A860C5C10F5D233F4D84B2055252C0CDF76A6E'
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

  # Custom batch shim
try {
  cp $env:ChocolateyInstall\lib\$packageName\tools\jmeter.bat $env:ChocolateyInstall\bin
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw 
}