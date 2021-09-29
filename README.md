# Collecting and Processing Landsat 8 Imagery Retreived from Google Earth Engine for the Purpose of Performing an Extended Fire Severity Analysis

**Programming Languages Used**
- Python
- R

### All data included in this repository should be downloaded to the desired working directory

## Retrieving Landsat Data from Google Earth Engine
The firsts step is to create a shapefile that includes the spatial data from which the spectral imagery will be collected. In this example, point data was used to reference the pixels of interest. Shapefiles can be generated using common geographic software such as ArcGIS or an open source alternative like QGIS. **It is important to note that a Google Earth Engine Token must first be generated for the following code to run effectively.**
In this example, the python file `gee_sub.py`is run to collect the spectral data from the spatial points identified above.   
