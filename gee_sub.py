#Read In Libraries
import os, re
import pandas as pd
import ee
from gee_subset import gee_subset

#Get Google Earth Engine Token
ee.Authenticate(ADD TOKEN)

#Initialize Google Earth Engine
ee.Initialize(ADD TOKEN)

#Read in Point Features to GeoPandas Data Frame
import geopandas as gpd
oh_p = gpd.read_file("Working_Directory/Shapefile.shp")
print(oh_p.head())

#Find number of point features
cnt = len(oh_p)
print(cnt)
siteSet = list(range(1, cnt, 1))
print(siteSet)

#Run Extraction for each point and writes out to CSV using For Loop
for i in range(0,160):
    df1 = gee_subset.gee_subset(product = "LANDSAT/LC08/C01/T1_SR", bands = ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B10","B11", "sr_aerosol", "pixel_qa", "radsat_qa"], 
                                start_date = "2013-04-11", 
                                end_date = "2020-12-31", 
                                latitude = oh_p.iloc[i, 3], 
                                longitude = oh_p.iloc[i ,4], scale = 10)
    
    sid = str(oh_p.iloc[i, 1]) + str(oh_p.iloc[i,2])
    df1["SiteID"] = sid
    df1.to_csv("Working_Directory" + str(oh_p.iloc[i, 1]) + str(oh_p.iloc[i,2]) + ".csv")

