<#
# Ask user for what they want to name the folder (Done)
# Create an index.html file within that folder (Done)


# Create folders
- /js
- /styles
- /images

# Extensions
- Loop through each filename that you want to create
- Cut out the extension
- If extension is .js, put into /scripts folder

#>

## SETUP THE ENVIRONMENT
$folderToMake = Read-Host "What do you want to name the folder?"

$makeFolder = new-object -ComObject scripting.filesystemobject
$makeFolder.CreateFolder("C:\PowerShell\" + $folderToMake)
$rootDirectory = "C:\PowerShell\" + $folderToMake
$foldersToMake = @('\js', '\styles', '\images')
$filesToMake = @('index.html', 'styles.css', 'script.js')


foreach ($result in $foldersToMake)
{
    $makeFolder.CreateFolder($rootDirectory + "\" + $result)
}

foreach ($result in $filesToMake)
{    
    if ($result -Like "*.css")
    {
        New-Item c:\Powershell\$folderToMake\styles\$result -ItemType file
    }
    elseif ($result -Like "*.js")
    {
        New-Item c:\Powershell\$folderToMake\js\$result -ItemType file
    }
    else
    {
        New-Item c:\Powershell\$folderToMake\$result -ItemType file
    }
}