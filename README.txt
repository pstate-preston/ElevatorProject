This was an assignment in Digital Logic II in university. Initially designed and traced by hand, the project has been 
implemented using Vivado and a Basys3 FPGA. 

The logic implemented models a 3-story elevator with the following parameters:
1. A "door open" button which holds the door open regardless of other conditions, given that the door was already open when pressed.
2. A button for each floor to call the elevator. Behavior will be identical to any buttons placed inside the elevator.
3. A reset button to revert the system to an initial state(arriving at floor 1).

The output is modeled using the seven segment display(to indicate current floor) and an LED(to indicate if the door is open).

Instructions for this project constrained that the system open its doors upon arrival at any floor for two clock cycles.

System is implemented by employing a Mealy type state machine, and a synchronous D-flipflop.