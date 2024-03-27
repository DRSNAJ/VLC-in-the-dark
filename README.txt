READ ME =====
---------------------------------------------------------------------------------------------------
Steps to follow for simulation:
1.	Open the MATLAB file titled “optisystem_mod.m”
	>	To change the brightness of codewords change the length of the pulse by changing L (range: 1-31)
2.	Enter a 5-bit long data sequence 
3.	Open the Optisystem file titled “MatLab_OPPM_MAIN.osd” 
	>	Open the properties of any MATLAB block within the block diagram and ensure that “Load MATLAB” is selected (do this every time after opening Optisystem to ensure that the MATLAB terminal is open for use after the simulation)
4.	Run the simulation
5.	On the open MATLAB terminal type “optisystem_mod;”
6.	A plot for the received signal and the transmitted and received data bits should be printed

---------------------------------------------------------------------------------------------------
To generate all the possible symbols run “Gen_CodeWords.m” 
To change the brightness of codewords change the length of the pulse by changing L (range: 1-31).
