#!/bin/bash

# Lab01 Script

grep time PredPreyData.csv > PredPreyDataCUT.csv
tail PredPreyData.csv >> PredPreyDataCUT.csv
cut -f 2-4 -d , PredPreyDataCUT.csv > PredPreyDataSmall.csv