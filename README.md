# Random Seat Selection Tool

This is the software tool I use to choose seats in an auditorium randomly for getting student responses during class.

### Contents
This repository contains:  

* MATLAB scripts that implement the seat choice.  
	* choose_a_seat.m (usage explained below)
	* randomSeatSelector.m (usage explained below)
* Images that I use to make a "button" for running the random seat choice
	* cat.jpg (normal usage)
	* weencat.jpg (for Halloween)
* RandomSeatInfo.mat, which is a MATLAB workspace file storing information from previous uses of the code (for adding extra steps of "randomness")
* An example seat map of an auditorium, coded as a .csv file.  The auditorium is coded on a lattice, with 0s representing spaces where there are no seats, and 1s representing individual seats.

### Usage
1.  Do NOT start MATLAB yet.
2.  Plug your computer into whatever projection device you use
3.  Mirror your screens
4.  Start MATLAB
5.  Open the MATLAB editor
6.  In the editor, open the "choose_a_seat.m" script
7.  Press the "Run" button after the script opens, and change directories if prompted to by the dialogue window
8.  That should open a figure window
9.  Press the cat button in its lower left hand corner
10.  Repeat step 9 as needed to choose a new seat (you do NOT need to repeat step 7)

### Note about the visualization
Line #1 in "choose_a_seat.m" determines whether the displayed seat map is visualized from the instructor perspective (podium at bottom) or from the student/audience perspective (podium at top).  The seat map is rotated 180 degrees in each of these relative to the other. To make the view from the audience perspective, use:

`rotateMap = false;`

To make the view from the instructor perspective, use:

`rotateMap = true;`

