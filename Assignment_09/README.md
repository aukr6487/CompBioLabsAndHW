﻿## Independent Project: Selfish-herd behavior of sheep under threat

#### Aubrey Kroger
#### EBIO 5420
#### Independent Project

### Biological question
Does an individual sheep try to reduce their own risk by moving towards the center of the flock when approached by a dog?

### Context (introduction)
An area of study that greatly interests me is the collective behavior of different biological systems. Decentralized communication occurs when a swarm of bees needs to find a new swarm location, in the schooling of a large group of fish, or in the herding of sheep by a sheep dog. I'm reading the paper ["Selfish-herd behavior of sheep under threat"](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/selfish-herd.pdf) by King et. al in another class where we explore the simple, individual, local rules that determine this collective behavior. I thought that it would be interesting to analyze some of the data from this paper for the independent project for this class. "Selfish-herd behavior of sheep under threat" by King et. al explores the theory that a sheep flock's response to a herding dog as an example of the selfish herd theory; that aggregations result from individual efforts to reduce their own predation risk by moving towards the centre of a group (king, 2012). I want to explore this theory and determine if it is an accurate conclusion to draw from the data. 

### Methods
There have been many attempts to understand how the single agent sheepdog can gather a rather large group of unwilling agents, the sheep flock. "Selfish-herd behavior of sheep under threat" by King et. al explores the theory that a sheep flock's response to a herding dog as an example of the selfish herd theory; that aggregations result from individual efforts to reduce their own predation risk by moving towards the centre of a group. The authors of this study wanted to understand the response of a group of 'prey' animals (in this case, a flock of sheep) to an approaching 'predator' (in this case, a herding dog). 

In "Selfish-herd behavior of sheep under threat", a trained Australian Kelpie herding dog was told to herd a flock of 46 resting sheep to an open gate, given
only the command “bring them home”. The sheepdog and all of the sheep were given a harness with a Global Positioning System (GPS) module, antenna, microcontroller, data storage card, and rechargeable battery. This harness was used to track the location of each sheep and the sheepdog over time and over the course of 3 experiments. The researchers reconstructed these locations of all sheep and the sheepdog in Euclidean space from the GPS data at each second. The type of data provided are 3 videos ([1](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/mmc2.avi), [2](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/mmc3.avi), [3](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/mmc4.avi)) that demonstrate the location of the sheep and sheepdog at each second for all 3 experiments. A lot of video processing has already been done on these videos, so the sheep are described as red dots, the sheepdog is a blue dot, and the background is white in the videos. The video format is a .avi format that is somewhat difficult to work with (doesn't work with QuickTimePlayer on Mac) (King, 2012). 

![Screenshot of video file](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/video.png)

From the position information, the researchers calculated the flock's center, the dog's distance from this flock center at each second, and the distance of all of the sheep from this flock center at each second. This paper also coined a term "flock cohesion" which they defined as the mean of all sheep distances from the flock center (King, 2012). The authors then created an equation based model, modeling change in flock cohesion (x) over time. "This equation implies that once the dog approaches within some distance d of the flock centroid, the sheep begin to aggregate with rate s, until the distance between the sheep is comparable to x0" (King, 2012). 

![Equation](https://github.com/aukr6487/CompBioLabsAndHS/blob/master/Assignment_09/equation.png)


#### What YOU did with the data and how you did it. 
In order to work with data that is similar to what we have worked with in class, I took these three videos and created three collections of csv files ([1](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_09/centroids2), [2](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_09/centroids3), [3](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_09/centroids4)) with the position of each of the sheep and the sheepdog in the videos. This process was done using MATLAB [(code)](https://github.com/aukr6487/CompBioLabsAndHW/tree/master/Assignment_09/video.m). 

![Screenshot of csv file](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/centroid1.png)

My first problem to address was cleaning up the csv files so that I am able to analyze the data. As a reminder, this dataset (due to the MATLAB code) contains 200 csv files (one csv file for each frame of the video). To begin sorting this data, I first added a "Time" column to each csv file that contains the frame number. I then combined all of the csv files into one file by binding them by rows and put this in a dataframe. Now we have one dataframe containing all of the position information gathered from the MATLAB script. I then filtered this data frame for certain values of x and y so that the output only contained the values of interest (cutting out the centroids that were plotted on the axis ticks and the time legend). 

My next goal was to label the sheepdog in each frame. To do this I created 2 arrays, one containing the x values of the sheepdog location and one containing the y values of the sheepdog location. It's important to note that some of these sheepdog locations were found using the MATLAB script, but other values were determined through inspection and are not contained in the csv files. In order to label the sheepdog in each frame, I added a column called "Sheepdog" to the data frame with the default value 0 in every row. I then looped through all of the rows in the data frame and checked if they matched with the sheepdog location values. If they did match, I changed the "Sheepdog" value in that row to 1. For the values that were not found in the data frame, I created new data frames with the same headers as the original one with the sheepdog coordinates and bound it by rows to the original data frame. 

Now we finally have a data frame that contians all of the location data for the sheep and sheepdog, with the frame numbers and sheepdog labeled. For ease of calculations, I split up this cleaned up data frame into two data frames; one containing the sheep locations and time frame values and one containing the sheepdog locations and time frame values. My next steps in data analysis were very similar to what the researchers completed, but this was a challenge for me since I didn't have access to their raw position data or any detailed methods section to see how they completed this analysis. I used pipes to calculate the flock center at each frame, which I determined by taking the average of all of the sheep locations from the sheep data frame. These values were stored in a data frame (average_sheeps). Next, I calculated the distance of the sheepdog from the flock center at each time frame and stored those values in a dataframe as well (sheep_distance). I also calculated the distance of each sheep from the flock center at each time frame and put these values in a data frame (stragglers), as well as took the max value of the sheep distances at each time in order to create a data frame containing the farthest sheep from the flock center at each time frame (furthest_sheep). Using the "Selfish-herd behavior of sheep under threat" paper's definition of flock cohesion, I calculated the mean of all of the sheep distances from the flock center at each time frame (King, 2012). 

![Screenshot of average_sheeps dataframe](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/average_sheeps.png)

![Screenshot of sheep_distance dataframe](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/sheepd_d.png)

### Results and conclusions
![Screenshot of sheep_distance dataframe](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Assignment_09/plots.png)

I was able to plot some data of interest; the distance of the sheepdog from the center of the flock over time, the distance of the furthest sheep from the center of the flock over time, and flock cohesion over time. The part of this plot that is really interesting to me is right before the 50 time frame mark, particularly on the sheepdog distance plot and flock cohesion plot. I noticed that the measure of flock cohesion (or the measure of how dispersed or clustered the flock is) changed once the sheepdog reached a certain distance from the flock center. I used a quick for loop to determine when the largest change in flock cohesion occurs. Taking this row value, I looked at the sheepdog distance from the flock at this row to determine how close the sheepdog was when the flock began to cluster. I think it's really cool that my plots were able to show this phenomenon, since the researchers in "Selfish-herd behavior of sheep under threat" also noticed that the sheep began to demonstrate herding or aggregating behavior once the sheepdog was at a certain distance from them (King, 2021). I wish I had enough time to do this same analysis on the other two videos and determine if the sheep cluster when the sheepdog is at a similar distance from the flock center, but I think this result is still valuable. We see from these plots and data analysis that the sheep begin predator avoidance and aggregation when the sheepdog is a certain distance from the flock. This may help us learn more about how sheep determine "threat" or "risk". Is risk or threat measurement determined on the sheepdog distance, or maybe the sheepdog speed? 

### References Cited 
1.  Andrew J. King et al. “Selfish-herd behaviour of sheep under threat”. In: Current Biology 22.14 (2012), R561–R562. issn: 0960-9822. doi: https://doi.org/10.1016/j.cub.2012.05.008. url: https: //www.sciencedirect.com/science/article/pii/S0960982212005295.