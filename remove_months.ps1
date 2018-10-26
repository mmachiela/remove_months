param(
[string]$Path
)

$runDate = Get-Date

$Date = (Get-Date).AddMonths(-2)

$monthDelete = Get-Date $Date -Format "yyyyMM"

#add filter to array below.
$arrFilter = @()

$arrRootFolders = get-childitem $Path -Exclude $arrFilter -Force -OutBuffer 1000 | where {$_.Attributes -match 'Directory'}

Write-Host "Cleanup Script Running - " $runDate
Write-Host "Path to cleanup: " $Path
Write-Host "Month to Cleanup: " $monthDelete
Write-Host "-------------"
Write-Host "Exclusion filters: "

Foreach ($filter in $arrFilter)
{
    Write-Host $filter   
}

Write-Host "-------------"
Write-Host "Start Cleanup!"
Write-Host "-------------"


foreach ($item in $arrRootfolders)
{
    Write-Host "Check Folder: " $item.FullName

    $arrSubfolders = get-childitem $Item.FullName -Recurse -Force -OutBuffer 1000 -Directory $monthDelete | where {$_.Attributes -match 'Directory'}
        
    foreach ($subFolder in $arrSubfolders)
    {
        Write-Host "!!! DELETE FOLDER: " $subFolder.FullName
        remove-item $subfolder.FullName -Recurse -Force
    }
            
}

$endDate = Get-Date

Write-Host "-------------"
Write-Host "Script ended! - " $endDate
Write-Host "-------------"
