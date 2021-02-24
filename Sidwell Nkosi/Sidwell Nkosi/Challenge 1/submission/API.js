const express = require('express')
const mainRouter = express.Router()
let path = require('path');


const fs = require('fs');
const download = require('download')
const csv = require('csv-parser')

const resource_url = 'https://s3-eu-west-1.amazonaws.com/discovery-insure-interview-rev1/sightings_alerts.zip';
let results = [];

mainRouter.get('/', (req, res) => {

  res.sendFile(path.join(__dirname, 'views', 'map-display.html'));

})

mainRouter.post('/data', function (req, res) {

 download (resource_url, "data", {extract: true}).then(() =>{ //download and extract the sighting data from the resourse url
     
      const data_dir = './data/sightings_alerts/'
      let files = fs.readdirSync(data_dir) // getting all the downloaded files 
      
       files.forEach(file => { 
        //converting csv data into javascript objects 
        
        fs.createReadStream(data_dir+file)
          .pipe(csv({}))
          .on('data', (data) => results.push(data))
          .on('end', () => {

            //sending processed data to client 
            if(!res.headersSent){
              res.send(results)
            } 
    
          })

      })

})
 
});


module.exports = mainRouter

