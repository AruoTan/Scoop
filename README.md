## How to use this scoop bucket?

```pwsh
scoop bucket add self git@github.com:AruoTan/Scoop.git
scoop install self/<manifestname>
```

## How to install Scoop?

### 1st Method

```pwsh
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force; $s = irm https://get.scoop.sh; $old = '$SCOOP_CONFIG_FILE = "$SCOOP_CONFIG_HOME\scoop\config.json"'; if (-not $s.Contains($old)) { throw '安装脚本已变化，停止安装' }; $s = $s.Replace($old, '$SCOOP_CONFIG_FILE = "$SCOOP_DIR\config.json"'); & ([scriptblock]::Create($s)) -ScoopDir 'D:\Scoop'
```

### 2nd Method

```pwsh
irm get.scoop.sh -outfile 'install.ps1'
# .\install.ps1 -? // look command info
.\install.ps1 -ScoopDir 'D:/Scoop' -ScoopGlobalDir 'D:/Scoop/apps'
```

## Things that must be done before using Scoop normally

Before starting, make sure the system has enabled the proxy on port 10808.

```pwsh
scoop install git
irm https://raw.githubusercontent.com/AruoTan/Scoop/refs/heads/master/scripts/setup.ps1 | iex
```
