function Get-ClassName {
    $ie = new-object -com InternetExplorer.Application
    $ie.navigate("http://www.classnamer.com/")
    if (!$ie) { Write-Host "variable is null" }
    while ($ie.Busy -eq $true) 
    { 
        Start-Sleep -Milliseconds 1000; 
    } 

    $doc = $ie.Document
    if (!$doc) 
    { 
        Write-Host "variable is null"
        return "SorryCantGiveYouAGenericClass" 
    }
    $answer = $doc.getElementByID("classname") 
    return $answer.innerHtml
}

Export-ModuleMember Get-ClassName