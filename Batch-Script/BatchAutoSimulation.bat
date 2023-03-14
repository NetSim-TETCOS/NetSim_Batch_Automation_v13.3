:: ***********************************************************************************************
:: * Copyright (C) 2019                                                              			*
:: * TETCOS, Bangalore. India                                                        			*
:: *                                                                                  				*
:: * Tetcos owns the intellectual property rights in the Product and its content.     	*
:: * The copying, redistribution, reselling or publication of any or all of the       	*
:: * Product or its content without express prior written consent of Tetcos is       	*
:: * prohibited. Ownership and / or any other right relating to the software and all  	*
:: * intellectual property rights therein shall remain at all times with Tetcos.      	*
:: *                                                                                  				*
:: * Author:  Kundrapu Dilip Kumar                                                    		*
:: * Date:    17-08-2019                    					*		
:: *                                                               					*
:: * Modified Date: 17-12-2021                                                              					*
:: * ---------------------------------------------------------------------------------------------------------------*

@ECHO OFF

setlocal
REM - NetSim will not ask for key press after the simulation
SET NETSIM_AUTO=1 
REM - Windows won't pop-up GUI screen for error reporting on exception
SET NETSIM_ERROR_MODE=1 


REM - This will restrict the AutoTest.bat to open via double clicking (without CLI arguments)
if [%1] == [] (
	if [%2] == [] (
		exit
	)
)

REM - Arguments from user input
SET APP_PATH=%1
SET LICENSE=%2

setlocal EnableDelayedExpansion


if exist "%Temp%\NetSimCoreAuto" (
	RD /Q /S "%Temp%\NetSimCoreAuto"
)

REM - Creates a folder in the %TEMP%
MD "%Temp%\NetSimCoreAuto"

REM - For all the directories/sub-directories which contain .netsim file
for /r %%i in (*.netsim) do (

	COPY "%%~dpi" "%Temp%\NetSimCoreAuto"		
		
		REM - Runs the simulation 
		START "" /w /MIN %APP_PATH%\NetSimCore.exe -apppath %APP_PATH% -iopath "%Temp%\NetSimCoreAuto" -license %LICENSE%			
						
			COPY "%Temp%\NetSimCoreAuto" "%%~dpi"
		
		REM - Close if Wireshark.exe is open
		C:\windows\system32\TASKLIST /fi "IMAGENAME EQ Wireshark.exe" | C:\windows\system32\find ":" > nul
		IF errorlevel 1 (
			C:\windows\system32\TASKKILL /f /im "Wireshark.exe"
		)		

	
	REM - Delete all the files from NetSimCoreAuto
	DEL /Q "%Temp%\NetSimCoreAuto"
)

REM - Removes the folder from the %TEMP%
RD /Q /S "%Temp%\NetSimCoreAuto"
PAUSE
endlocal