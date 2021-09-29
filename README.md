# Collecting and Processing Landsat 8 Imagery Retreived from Google Earth Engine for the Purpose of Performing an Extended Fire Severity Analysis

**Programming Languages Used**
- Python
- R

## Installing Packages
All libraries needed for Python can be found in the file `Py_Libraries` while packages needed for R can be found in `R_Libraries`.

## Retrieving Landsat Data from Google Earth Engine - Python
The firsts step is to create a shapefile that includes the spatial data from which the spectral imagery will be collected. In this example, point data was used to reference the pixels of interest. Shapefiles can be generated using common geographic software such as ArcGIS or an open source alternative like QGIS. **It is important to note that a Google Earth Engine Token must first be generated for the following code to run effectively.**
In this example, the python file `gee_sub`is run to collect the spectral data from the spatial points identified above. 
The output is separate .csv files for each spatial point of interest, which includes data for all dates that imagery exists within the parameters set in the python script.

## Processing and Appending .csv Files - R
Some steps were acheived by manually editing the .csv files for a simplified and tailored approach to the specific fires being studied. 
Once run, the output of the `R_Data_Cleaning` file produces an appended file containing all of the data for all fires. 
Manual steps were conducted as follows:
  1. All of the data for each fire was exported into a unique .csv file named after their respective fires. 
  2. Date columns representing the start and end date of their respective fires were added to each fire file.
  3. The date closest to the end of the fire where values from all 20 points were present (those with poor QA values were previously rejected), and where all years occured within ~1 month of each other was chosen as the date from which data was selected and exported to a new .csv file to represent only the relevent temporal and spectral data. 

The file `dNBR_Reshape` is then run to calculate the differenced normalized burn ratio (dNBR) values and reshape the data to a more workable format. It also provides the data from which statistical analysis will be run. 

## Quantifying Burn Severity - R
dNBR, which is written as ***Prefire NBR - Postfire NBR*** is used to quantify relative burn severity, that is to say, how much the vegetation has been affected by a fire. NBR, which is written as ***(NIR - SWIR II) / (NIR + SWIR II)*** for Landsat 8 depicts absolute values but does not consider how much change occured after a fire. However, both are a powerful tool for visualizing severity. The code used to graph NBR and dNBR values is displayed in `ggplot_NBR`.

## Statistical Anlysis - R
To compare if dNBR values are significant between the years studied, an analysis of variance should be performed. To test if the data meet the assumptions of a parametric test like ANOVA, the Shapiro-Wilk test, along with a quantile-quantile plot, and Bartlett's test can be used. The code used to run these tests can be found in the `Assumptions_of_Anova` file. Because the data used in my study did not meet the assumptions of ANOVA, a nonparametric version called the Kruskal-Wallis test was used instead. While the Kruskal-Wallis test determines whether there is significant differences between groups, it does not indicate the difference between specific groups. Thus, a pairwise Kruskal-Wallis test was used, which can be found in the file called `Kruskal-Wallis_Test`. The code provided writes the results of the pairwise test to a .csv file. 
