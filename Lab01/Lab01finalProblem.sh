#!/bin/bash

# Lab01 Script

grep time PredPreyData.csv > PredPreyDataCUT.csv
tail PredPreyData.csv >> PredPreyDataCUT.csv
cut -f 2-4 -d , PredPreyDataCUT.csv > PredPreyDataSmall.csv

# PredPreyDataSmall.csv is the  new .csv file with 11 lines of data total and three columns total, in which the top line should be the original headers, and the other 10 lines should be the last 10 lines of the original data

