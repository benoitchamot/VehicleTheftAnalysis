# Vehicle Theft Analysis in New Zealand
Find out which vehicle, in what location and at one time are the most likely to be stolen. Based on stolen vehicle data from the New Zealand police department.

## Business case

## Insights

## Data
### Extracation, Transformation, Loading (ETL) 
The main data source was provided by Maven Analytics, LLC as part of the Vehicle Theft Analysis projects. The data provided was already cleaned and could be used as is once loaded into a MySQL database using the file `create_stolen_vehicles_db.sql`, which contains the necessary SQL queries to create the tables and populate them.

### Data structure
...ERD...

### Exploratory Data Analysis (EDA)

## Technical report
### Technologies
I have used a combination of SQL and pandas to work with the data. While both could have been on their own.


- MySQL Workbench to run the database creation script and perform an initial scan of the data
- SQLAlchemy to access the database from python
- SQL queries, executed through SQLAlchemy
- pandas to summarise the data and for the final data analysis
- seaborn for visualisation
- plotly express for the map visualisation
- 

### Problems encountered
In order to prepare the choropleth map, I had to find a GeoJSON file that would describe the regions of New Zealand used in the dataset. This meant following these steps that proved sometimes challenging:
1. find the necessary data from a reliable source
2. transform the data so it could be interpreted by plotly
3. understand the subtleties of map projections so the regions would display correctly

This part took me the most time in this project. In order to be able to provide results quickly, I focused first on the density mapbox, which would allow me to display density points located at the latitude/longitude of the center of the different regions. To do this I used the `geoapify` API to get the longitude and latitude for each region and display them with plotly express.

Once I knew I had a minimum viable product that could display the data in a satisfactory way, I spent additional time figuring out how to display the choropleth map, which is a better way to visualise region-wide information.