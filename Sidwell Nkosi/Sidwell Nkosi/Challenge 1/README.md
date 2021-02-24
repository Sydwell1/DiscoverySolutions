### Challenge 1 

# Problem Solving Approach 

	1. Problem understanding 
	
		The aim of this stage was to read up and gain more understanding about BLE devices.
		
		I then went to download the sighting data files from the provided link, analyzed the type of data that i was suppose to use to solve the problem 
		
		Reading the question over and over, i then came up with a hypothesis, which is:
			* Since the data is collected from 3 BLE deices, on the Heat map i should at least get 3 clusters of data points 
			
	2. Planning 
	
		The aim of this stage was to divide the problem into sub-tasks that i needed to do in order to meet the question's requirements. This includes:
			- API Dev
				* Develop an API that can download the sighting data zip folder 
				* Unzip and extract the data files 
				* Read in multiple files in a folder (to accommodate a situation where by the sighting data zip folder has multiple files inside)
				* Open and read each data file, and convert the csv data format into JavaScript objects
				
			- Data Visualization 
				* Read up and learn to use Google Map Platform tools 
				* Use Google Map services to draw the heat map and populate it with BLE devices' heat signatures 
				
	
			
# Challenges i faced 

	The solution is perfect for small scale data set, i noticed that as the data set increases, the Heat map takes some time to display all the data. Optimizing the heat map display speed was one of the major challenges i faced. Due to the time constraints, i couldn't spend more time optimizing the code. However, this is one problem that might need to be addressed for the API to handle huge data sets. 
 	

#Observation Insight 

	As predicted by my initial hypothesis, there are 3 data clusters on the heat map. I noticed there were some outliers on the data points, looking more into it, i came to the conclusion that the data points that are not within the 3 data clusters are due to at least 1 BLE sensor being installed on a car.  

# Application info

	The API was developed using node js (back-end) in conjunction with HTML and Google Maps tool for displaying the data point heat signatures (front-end)
	Please note that the used map is not licensed its only used for development purposes. 
	
	server.js is the application entry point file
	Please see the git repository link to see the challenge solution overview https://github.com/Sydwell1/Bluetooth-Scanner.git
