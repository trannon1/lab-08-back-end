'use strict';

const express = require('express');
require('dotenv').config();
const cors = require('cors');
const app = express();
const superagent = require('superagent');
const PORT = process.env.PORT || 3001;
app.use(cors());

const client = require('./lib/client');
const getLocation = require('./lib/location/getLocation');

// routes

app.get('/location', getLocation);
// app.get('/location', (request, response) => {
//   try{
//     searchLatToLong(request, response);
//   }
//   catch(error){
//     console.error(error); // will turn the error message red if the environment supports it

//     response.status(500).send('so sorry, something is not working on our end');
//   }
// })

app.get('/weather', (request, response) => {
  try{
    getWeather(request, response);
  }
  catch(error){
    console.error(error); // will turn the error message red if the environment supports it

    response.status(500).send('so sorry, something is not working on our end');
  }
})

app.get('/events', (request, response) => {
  try{
    getEvent(request, response);
  }
  catch(error){
    console.error(error); // will turn the error message red if the environment supports it

    response.status(500).send('so sorry, something is not working on our end');
  }
})

// app.get('/add', (request, response) => {
  
//   let url = `https://maps.googleapis.com/maps/api/geocode/json?address=${request.query.data}&key=${process.env.GEOKEY}`;

//   superagent.get(url)
//     .then(results => {
      
//       const locationObject = new Location(request.query.data, results.body.results[0]);
    
//       let sql = `INSERT INTO location (search_query, formatted_address, latitude, longitude) VALUES (${locationObject.search_query}, ${locationObject.formatted_address}, ${locationObject.latitude}, ${locationObject.longitude});`;

//       let safeValues = [request.query.data];

//     })
//     .catch (err => {
//       response.send(err);
//     })
  
//   let safeValues = [request.query.data];

//   client.query(sql, safeValues)


//   // check the database
//   let sql = 'SELECT * FROM location;';
//   let safeValues = ['Seattle'];

//   client.query(sql, safeValues)
//     .then(results => {
//       console.log(results);
//     })
// })

// function searchLatToLong(request, response){

//   let url = `https://maps.googleapis.com/maps/api/geocode/json?address=${request.query.data}&key=${process.env.GEOKEY}`;

//   superagent.get(url)
//     .then(results => {
      
//       const locationObject = new Location(request.query.data, results.body.results[0]);

//       response.send(locationObject);
    
//     })
//     .catch (err => {
//       response.send(err);
//     })
// }

function getWeather(request, response){
  let latitude = request.query.data.latitude;
  let longitude = request.query.data.longitude;

  let url =  `https://api.darksky.net/forecast/${process.env.DARKSKYKEY}/${latitude},${longitude}`;

  superagent.get(url)
  .then(results => {
    const weatherObject = results.body.daily.data.map(values => 
      new Weather(values.summary, values.time)
    )
    response.send(weatherObject);
  })
  .catch (err =>{
    response.send(err);
  })
}

function getEvent(request, response){
  let latitude = request.query.data.latitude;
  let longitude = request.query.data.longitude;

  let url =  `http://api.eventful.com/json/events/search?app_key=${process.env.EVENTBRITEKEY}&where=${latitude},${longitude}`;

  superagent.get(url)
  .then(results => {
    let events = JSON.parse(results.text);
    const eventObject = events.events.event.map(value => 
      new Event(value)
    )
    response.send(eventObject);
  })
  .catch (err =>{
    response.send(err);
  })
}

// function Location(request, geoData){
//   this.search_query = request;
//   this.formatted_query = geoData.formatted_address;
//   this.latitude = geoData.geometry.location.lat;
//   this.longitude = geoData.geometry.location.lng;
// }

function Weather(summary, time){
  this.forecast = summary;
  this.time = new Date(time * 1000).toDateString();
}

function Event(value){
  this.link = value.url;
  this.name = value.title;
  this.event_date = value.start_time;
  this.summary = value.description;
}

// LAB 8 DB Questions

app.get('/add', (request, response) => {
  let firstName = request.query.first;
  let lastName = request.query.last;
  
  let sql = 'INSERT INTO people (first_name, last_name) VALUES ($1, $2);';
  let safeValues = [firstName, lastName];

  client.query(sql, safeValues)

  // check the database
  
// })



app.get('*', (request, response) => {
  response.status(404).send('Page not found');
});

client.connect()
  .then( () => {
    app.listen(PORT, () => console.log(`App is on port ${PORT}`));
  })
  .catch( err => console.error(err));

