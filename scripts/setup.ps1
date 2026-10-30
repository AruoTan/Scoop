# Git Global Configuration

$ErrorActionPreference = 'Stop'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git is not installed or is not available in PATH.'
}

$settings = [ordered]@{
    'core.sshcommand'                    = 'C:/Windows/System32/OpenSSH/ssh.exe'
}

foreach ($key in $settings.Keys) {
    $expected = $settings[$key]
    git config --global $key $expected

    if ($LASTEXITCODE -ne 0) {
        throw "Failed to set Git global config: $key"
    }

    $actual = git config --global --get $key

    if ($LASTEXITCODE -ne 0 -or $actual -ne $expected) {
        throw "Verification failed for Git global config: $key"
    }

    Write-Host "$key=$actual"
}

Write-Host 'Git global configuration completed successfully.'

# Scoop Configuration

scoop bucket add extras
scoop bucket add self https://github.com/AruoTan/Scoop.git

scoop uninstall 7zip
scoop install self/7zip

scoop install dark innounp
