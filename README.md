# CPU-Temperature-Powershell
The PowerShell script is design to extract the temperature information from your CPU. (The temperature is in Celcius)
This is done by using the WMI tool and calling the class "MSAcpi_ThermalZoneTemperature".
The output will be a form with three values. The first values will be the current cpu temperature, the second the cooling temperature
and the third is the critical temperature. 
Furthermore, there is a button which updates the current temperature, if pressed.

# What is required
Your BIOS has to support MSAcpi_ThermalZoneTemperature class and the script has to be run in administrator mode to work.
