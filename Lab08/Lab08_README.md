#### Lab08 Explained

[KROGER_Lab8.R](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Lab08/KROGER_Lab8.R) contains a function that completes the discrete-time logistic growth equation. The equation, 
`n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )`
is used in many models of population abundance over time where
* `n[t]`  is the abundance of the population at time  `t`
* `n[t – 1]`  is the abundance of the population in the previous time step
* `r`is the intrinsic growth rate of the population
* and `K`  is the environmental carrying capacity for the population. 

This script calculates population abundance over time when given specific input parameters to the function, plots the population abundance over time, and then outputs a [csv file](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Lab08/Discrete_Time_Log_Growth_Data.csv) containing the data that was calculated. The file has two columns, the first being _generations_ and the second being _population abundance_. 

An example plot is show below:
![Logistic growth equation plot](https://github.com/aukr6487/CompBioLabsAndHW/blob/master/Lab08/plot.png)

**Note**: This plot was created using the function _logistic_growth_ in KROGER_Lab8.R with input parameters
* r = 0.8
* K = 10000
* generations = 12
* initial_pop = 2500


    
    
