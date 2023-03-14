1. Open CMD window with the current directory as the location of the BatchAutoSimulation.bat file.

2. The 'Test Files' folder(s) and BatchAutoSimulation.bat should be in the same folder.

3. Run the command with 2 arguments - apppath(bin path) and license respectively:

   BatchAutoSimulation.bat  "C:\Program Files\NetSim\Standard_v13_3\bin\bin_x64" 5053@192.168.0.9 < nul

4. '< nul' is to skip the 'Terminate Batch Job(Y/N)?' message in the CMD window.

5. The simulation output files such as Metrics.xml and other files such as packet trace, event trace, animation related, logs etc can be found in the same folder containing the configuration file.

6. If you want to stop the simulation tests mid-way, close the CMD window prior to closing NetSim simulation window.

7. If you pass the wrong arguments, quit the simulation by ending the process of 'Windows Command Processor' from Task Manager.  


NOTE: Do not run the BatchAutoSimulation.bat by double-clicking. Run it only in a CMD window along with 2 arguments.

