# The script's main purpose is to extract the temperature of the CPU 
# Currently the program has to be run in Administrator mode
#Created by: Rares Bratean

#Requires -RunAsAdministrator



function GetTemp{

 $TempObject = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"

 $temp = $TempObject.CurrentTemperature

 $global:Celsius1 = ($temp[0]/10) - 273.15
 $global:Celsius2 = ($temp[1]/10) - 273.15
 $global:CriticalCelsius = ($TempObject.CriticalTripPoint[0]/10) - 273.15
 $global:CoolingTemp = ($TempObject.ActiveTripPoint[0]/10) - 273.15
 
 }
 

function DrawForm
{
 # Drawing the form

 GetTemp

 Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Label = New-Object System.Windows.Forms.Label
$Label1 = New-Object System.Windows.Forms.Label
$Label2 = New-Object System.Windows.Forms.Label

$Label.Text = "CurrentTemp: " + $Celsius1 + " C"
$Label.Width = 2222
$Label.Height = 70
$Label.Location = new-object system.drawing.point(20,20)
$Form.Controls.Add($Label)


$Label1.Text = "CoolingTemp: " + $CoolingTemp + " C"
$Label1.Width = 2222
$Label1.Height = 70
$Label1.Location = new-object system.drawing.point(20,100)
$Form.Controls.Add($Label1)

$Label2.Text = "CriticalTemp: " + $CriticalCelsius + " C"
$Label2.Width = 2222
$Label2.Height = 60
$Label2.Location = new-object system.drawing.point(20,180)
$Form.Controls.Add($Label2)


$UpButton = New-Object system.windows.Forms.Button
$UpButton.Text = "Update Temperature"
$UpButton.Width = 280
$UpButton.Height = 40
$UpButton.Location = new-object system.drawing.point(40,260)
$UpButton.Add_Click({
    GetTemp
    $Label.Text = "CurrentTemp: " + $Celsius1 + " C"
    $Label.Refresh()

})
$Form.Controls.Add($UpButton)

$Form.ShowDialog()

 }

DrawForm




