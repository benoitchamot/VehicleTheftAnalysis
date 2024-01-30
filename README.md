# Vehicle Theft Analysis in New Zealand
Find out which vehicle, in what location and at one time are the most likely to be stolen. Based on stolen vehicle data from the New Zealand police department (2021-2022).

## Business case
The New Zealand police department needs help to raise awareness about motor vehicle thefts. They want to better understand historical thefts before releasing a public service announcement to encourage citizen to be aware of thefts and stay safe.

The objectives of this project are to understand **when**, **where** and **which** vehicles are likely to be stolen. 

This case, and the data behind is, was proposed by [Maven Analytics](https://app.mavenanalytics.io/guided-projects/3) as one of their online challenges. The text above is taken and adapted from their website.

## Insights
### Location
There exist strong correlations between the population in a region and the number of vehicles stolen, as well as the population density and the thefts. It is expected that the more people live in a region, the more vehicles there will be and therefore the higher the chance of theft (all other parameters being constant).

![](/Images/population_vs_density.png)

We therefore focused on looking at the number of vehicle thefts per 1000 inhabitants instead.

![](/Images/thefts_per_population.png)

The region of Nelson stood out in this part of the analysis with a number of vehicles stolen significantly above the national average. While the root cause for this result is beyond the scope of this project, it is strongly advise that the New Zealand police focuses at least part of their campaign on the Nelson area. Over the period considered, 92 vehicles were stolen. While this is a far cry from Auckland's 1638, the small population of Nelson makes it an interesting test bed for any campaign as measuring any impact should be easier.

![](/Images/map_regions.png)

### Type of vehicles
* From the data available, silver, white and black vehicles, of type stationwagon, hatchback and trailers are the most likely target. However, it is very important to note that these types and colours could simply be the most common ones. Further analysis of the vehicles sold in New Zealand would be needed to see if this correlates.

![](/Images/types_and_colours.png)

### Other information requiring more analysis
* From the data available, it looks like thefts are marginally more likely to happen on Mondays and Tuesdays
* The available data shows that March 2022 had the highest number of thefts and April 2022 had the lowest. The average per month could be increasing between 2021 and 2022, however, since both yearly report are incomplete (not covering the same months), a year-by-year comparison is not possible. It is not possible to indicate whether thefts are increasing between 2021 and 2022 or whether we are only observing a seasonal phenomenon. The recommendation is to not favour any particular seaons or month for a campaign at this stage. More data will be needed to assess long-term trend and seasonal variations.

![](/Images/thefts_day_of_the_week.png)

## Data
### Extracation, Transformation, Loading (ETL) 
The main data source was provided by Maven Analytics, LLC as part of the Vehicle Theft Analysis projects. The data provided was already cleaned and could be used as is once loaded into a MySQL database using the file `create_stolen_vehicles_db.sql`, which contains the necessary SQL queries to create the tables and populate them.

Two other sources were used:
1. Additional geometry data from the New Zealand police were obtained from [koordinates.com](https://koordinates.com/layer/105480-nz-police-district-boundaries-29-april-2021/) to create the choropleth map.
2. The (`geoapify`)[https://www.geoapify.com/] API was used to retrieve the central coordinates of the main region to create the density map.

The data from both these sources are used directly in `Map.ipynb`. The notebook explain their use in more details.

### Data structure
...ERD...

### Exploratory Data Analysis (EDA)


## Technical report
### Technologies
I have used a combination of SQL and Pandas to work with the data. While either could have been on their own, this dual approach offers some advantages:
1. Writing effective and targeted SQL queries to access the MySQL database can easily be scaled up compared to having to read the entire dataset into a single DataFrame.
2. Pandas offers more ways to format the code, write functions and reorganise the data quickly for analysis and visualisation.
3. Being able to combine two different languages allows to compensate for each of their shortcomings and could allow different programmers to continue the work with either system, depending on their skills and preferences.

### Other technologies and tools
Other modules and tools, I have used include:
- MySQL Workbench to run the database creation script and perform an initial scan of the data
- SQLAlchemy to access the database with Python
- SQL queries, executed through SQLAlchemy
- Pandas to summarise the data and for the final data analysis
- Seaborn for visualisation
- Matplotlib and Plotly Express for the map visualisation
- Requests to access the `geoapify` API
- Geopandas to manipulate geometry files

### Problems encountered
In order to prepare the choropleth map, I had to find a GeoJSON file that would describe the regions of New Zealand used in the dataset. This meant following these steps that proved sometimes challenging:
1. find the necessary data from a reliable source
2. transform the data so it could be interpreted by plotly
3. understand the subtleties of map projections so the regions would display correctly

This part took me the most time in this project. In order to be able to provide results quickly, I focused first on the density mapbox, which would allow me to display density points located at the latitude/longitude of the center of the different regions. To do this I used the `geoapify` API to get the longitude and latitude for each region and display them with plotly express.

Once I knew I had a minimum viable product that could display the data in a satisfactory way, I spent additional time figuring out how to display the choropleth map, which is a better way to visualise region-wide information.