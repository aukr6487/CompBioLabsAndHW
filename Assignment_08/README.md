## Independent Project: Selfish-herd behavior of sheep under threat
### By Aubrey Kroger 
### EBIO 5423

#### Introduction 
An area of study that greatly interests me is the collective behavior of different biological systems. This decentralized communication occurs when a swarm of bees needs to find a new swarm location, in the schooling of a large group of fish, or in the herding of sheep by a sheep dog. I'm reading the paper ["Selfish-herd behavior of sheep under threat"](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_08/selfish-herd.pdf) by King et. al in another class where we explore the simple, individual, local rules that determine this collective behavior. I thought that it would be interesting to analyze some of the data from this paper for the independent project for this class. 
"Selfish-herd behavior of sheep under threat" by King et. al explores the theory that a sheep flock's response to a herding dog as an example of the selfish herd theory; that aggregations result from individual efforts to reduce their own predation risk by moving towards the centre of a group.  Does an individual sheep try to reduce their own risk by moving towards the center of the flock when approached by a dog? What about when approached by two dogs? I want to explore this theory and determine if it is an accurate conclusion to draw from the data, as well as make a simulation that models this same behavior for a various number of sheep and dogs (stretch goal).

#### Summary of Data to be Analyzed
##### Goals of original study that produced the data 
There have been many attempts to understand how the single agent sheepdog can gather a rather large group of unwilling agents, the sheep flock. "Selfish-herd behavior of sheep under threat" by King et. al explores the theory that a sheep flock's response to a herding dog as an example of the selfish herd theory; that aggregations result from individual efforts to reduce their own predation risk by moving towards the centre of a group. The authors of this study wanted to understand the response of a group of 'prey' animals (in this case, a flock of sheep) to an approaching 'predator' (in this case, a herding dog). 
##### Brief description of methodology that produced the data
In "Selfish-herd behavior of sheep under threat", a trained Australian Kelpie herding dog was told to herd a
flock of 46 resting sheep to an open gate, given
only the command “bring them home”. The sheepdog and all of the sheep were given a harness with a Global Positioning System (GPS) module, antenna, microcontroller, data storage card, and rechargeable battery. This harness was used to track the location of each sheep and the sheepdog over time and over the course of 3 experiments. 
##### Type of data in this data set:
The authors reconstructed the position of all sheep and the sheepdog in Euclidean space from the GPS data at each second. The type of data provided are 3 videos ([1](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_08/mmc2.avi), [2](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_08/mmc3.avi), [3](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_08/mmc4.avi)) that demonstrate the location of the sheep and sheepdog at each second for all 3 experiments. A lot of video processing has already been done on these videos, so the sheep are described as red dots, the sheepdog is a blue dot, and the background is white in the videos. The video format is a .avi format that is somewhat difficult to work with (doesn't work with QuickTimePlayer on Mac). 

![Screenshot of video file](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_08/video.png)

In order to work with data that is similar to what we have worked with in class, I took these three videos and created three collections of csv files ([1](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_08/centroids2), [2](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_08/centroids3), [3](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_08/centroids4)) with the position of each of the sheep and the sheepdog in the videos. This process was done using MATLAB [(code)](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_08/video.m). Now we have some messy data that we can work with. 

![Screenshot of csv file](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_08/centroid1.png)

Let's look at the first collection of csv files that matches the data in the first video. The folder of csv files contains `N` number of csv files, where `N` is the number of frames in the video. Looking at a specific csv file, there are `X` amount of rows. `X` is the number of centroids determined by the MATLAB file. There are 3 columns in this file; the first column represents the x coordinates of the centroids, the second column represents the y coordinates of the centroids, and I'm honestly not sure the third column represents. There are quite a few problems with this data. I'm not very familiar with object detection in MATLAB, so the code provided is not very accurate. When some sheep are closer together, the red dots look like one big red blob and the code treats that as **one** dot instead of a collection of dots. Due to this, the number of centroids also changes frame to frame (or csv file to csv file) as sheep get closer together or further apart. I also need to spend some time figuring out what this third column represents. 

#### Detailed Description of Analysis to be Done and Challenges Involved
Some analysis that I want to do for each experiment:
* determine the centroid of the flock of sheep at each second (something the paper already did)
* determine the distance from each sheep to the centroid of the flock at each second (something the paper already did)
* determine the average distance from a sheep to the centroid of the flock at each second (something the paper already did)
* Identifying sheep furthest away from centroid at each second 
* determine distance of dog from flock centroid at each second (something the paper already did)
* determine the distance of the dog from the sheep the furthest away at each second 
* determine how quickly the flock centroid gets to the target location

Stretch goals:
* reverse engineer my own local rules of interaction that would mimic this behavior
* create a NetLogo simulation with these local rules that mimic this behavior 

*Note* The paper analyzed a lot of these things but the code or method of analysis is not included. I still think this analysis is valuable in exploring the collective behavior theory, so I want to make these same calculations. 

Creating this MATLAB file that does some image processing was already a difficult feat for me. I think it's going to be difficult to quickly determine these distances and averages with the extensive amount of csv files in this dataset already. How can I calculate changes across multiple csv files? Am I going to have to combine them into one at some point to make these valuations easier? I'm looking forward to wrestling with this data!

#### References
1.  Andrew J. King et al. “Selfish-herd behaviour of sheep under threat”. In: Current Biology 22.14 (2012), R561–R562. issn: 0960-9822. doi: https://doi.org/10.1016/j.cub.2012.05.008. url: https: //www.sciencedirect.com/science/article/pii/S0960982212005295.
