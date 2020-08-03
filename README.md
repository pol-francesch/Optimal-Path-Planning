# Optimal-Path-Planning
Implementation of the A* search alogirthm to find an optimal path on a generated map. This project was created during my stay at TU Delft in the Netherlands. It encompasses both the code written, and a final report which is included in this reposetory.

Due to the many functions I am using in this code, I have split repository into different folders, each pertaining to a section of the document. Here, I will describe
each section and provide instructions on how to run the code. Note that the section names in this
appendix roughly match the section names in the paper, and in the repository. Along with the code, I will
include the image files which are embedded in this document. Please note, it is likely that you will
have to install additional optimization libraries if you have not used these functions in the past.

## Making Maps
I am including this section for completeness, so that you can see the different algorithms. The one
which returns the ugly maps is "createMap2". The one which generates the nice map is "plotOptPath",
which is mainly used for plotting the path in a nice map. You can feel free to generate your own maps
using createMap2.

## MATLAB Path Planning - PRM
This includes a single script file which you can run, and will return a map with a, hopefully, complete
path. When this is turned in, the algorithm will be using 20 nodes, which is just enough to sometimes
make a path. If when you run it, it does not make a path, I recommend trying again. For consistency,
you can change line 18 to a higher node number.

## A* Algorithm
This section represents the bulk of the work of this paper. The main program is "aStar_Optimization",
and it will run the optimization code for you. At the top, you can see various objLoc you can choose
from; I used these in my testing. Feel free to make your own if you wish.
On line 24, you can select the weight which you would like to use. And then on lines 26-34 are
where you select the type of graph you would like. If you want to see it in action, only line 27 should
be uncommented. If you are only looking to see the final path, only lines 30, 33 and 34 should be
uncommented.

I have included some videos in this section to demonstrate the "Fancy plot"

## Efficiency Analysis
The main code here is "checkBestRes2" but producing the plots I have generated for the report can
take hours, so I would not recommend actually trying to run this code unless you can leave it be for a
while. If you want to check that it works, modify the code to run through a small amount of resolutions,
a small amount of times. In this case, we would modify lines 22 and 37. I would also recommend using
a reasonably higher weight like 2 or 3.
