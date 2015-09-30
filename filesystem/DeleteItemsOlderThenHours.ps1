#
# DeleteItemsOlderThenHours.ps1 -Path c:\temp -Hours 12
#
# In order to keep environments clean - we need to run script
# which will cleanup child items in directory.
#
# How to use?
# Schedule a job with required arguments

PARAM(
	[Parameter(Mandatory=$true)]
	[string] $Path,
	[Parameter(Mandatory=$true)]
	[string] $Hours,
	[switch] $autoUpdate
)

# Shared function
function Older-Than()
{
    PARAM(
        [Parameter(ValueFromPipeline=$true)][Object[]]$Files,
        [Parameter(ValueFromPipeline=$false, Position=0)][Int]$Hours
)
    Process
    {
        $Files | ?{ ( (Get-Date) - $_.LastWriteTime).TotalHours -gt $Hours }
    }
}

Get-ChildItem -Path $Path | Older-Than -Hours $Hours | Remove-Item -Force -Recurse

# Self-Update
# To be implemented...
if ($autoUpdate -and (Test-Path $PSCommandPath)) {
	Write-Host "Automatic update script..."
	#Invoke-WebRequest -Uri -OutFile $PSCommandPath
}
