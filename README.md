# Collecting and Processing Landsat 8 Imagery Retreived from Google Earth Engine for the Purpose of Performing an Extended Fire Severity Analysis

**Programming Languages Used**
- Python
- R

### All data included in this repository should be downloaded to the desired working directory

## Retrieving Landsat Data from Google Earth Engine
The firsts step is to create a shapefile that includes the spatial data from which the spectral imagery will be collected. In this example, point data was used to reference the pixels of interest. Shapefiles can be generated using common geographic software such as ArcGIS or an open source alternative like QGIS. **It is important to note that a Google Earth Engine Token must first be generated for the following code to run effectively.**
In this example, the python file `gee_sub`is run to collect the spectral data from the spatial points identified above. 
The output is separate .csv files for each spatial point of interest, which includes data for all dates that imagery exists within the parameters set in the python script.

## Processing and Appending .csv Files
Some steps were acheived by manually editing the .csv files for a simplified and tailored approach to the specific fires being studied. 
Once run, the output of the `R_Data_Cleaning` file produces an appended file containing all of the data for all fires. 
Manual steps were conducted as follows:
  1. All of the data for each fire was exported into a unique .csv file named after their respective fires. 
  2. Date columns representing the start and end date of their respective fires were added to each fire file.
  3. The date closest to the end of the fire where values from all 20 points were present (those with poor QA values were previously rejected), and where all years occured within ~1 month of each other was chosen as the date from which data was selected and exported to a new .csv file to represent only the relevent temporal and spectral data.
  4. Average dNBR values for each year were calculated for the purpose of graphical representation, depicting the change in dNBR values prior to and up to four years following a fire. This file is distinct from a file generated later that contains the dNBR values obtained using R code, which does not contain the pre-fire dNBR value as its purpose is post-fire statistical analysis, whereby pre-fire values are undesireable. 

The file `dNBR_Reshape` is then run to 
