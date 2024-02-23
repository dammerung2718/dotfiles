# install packages
$packages = Get-Content Pkgfile | Where-Object { $_ -match '^win' }
foreach ($package in $packages) {
  $packageName = $package -replace '^win ', ''
  winget install --id $packageName.Trim('"')
}
