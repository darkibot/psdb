#
# DeleteItemsOlderThenHours.ps1
#

$srcModule = $MyInvocation.MyCommand.Path `
        -replace 'MySolution\\tests\\(.*?)\.Test\\(.*?)\.Tests\.ps1', `
                 'MySolution \src\$1\$2.psd1'
#Import-Module $srcModule
