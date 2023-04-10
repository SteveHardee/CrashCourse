$localdownloadpath = "C:\Labs"
$downloadURL = "https://github.com/SteveHardee/CrashCourse/raw/main/artifacts/LabFiles.zip"
$filename = $downloadURL.Substring($downloadURL.LastIndexOf("/")+1)
$fullpath = $localdownloadpath + "\" + $filename
$extractedpath = $localdownloadpath + "\" + $filename.Split('.')[0]

if (-not (Test-path $localdownloadpath))
{
    New-Item -Path $localdownloadpath -ItemType Directory
}
Invoke-WebRequest -Uri $downloadURL -OutFile $fullpath
Unblock-File -Path $fullpath
Expand-Archive -Path $fullpath -DestinationPath $extractedpath
