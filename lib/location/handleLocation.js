'use strict';

const client = require('../client');
const superagent = require('superagent');
const Location = require('./Location');

function handleLocation(response, location){
  const sqlQuery = 'SELECT * FROM location WHERE search_query = $1';
  const safeValues = [location];
  client.query(sqlQuery, safeValues)
    .then(sqlResults => {
      // the city exists in the DB, get the city out of the DB and use that object to send to the front end
      if(sqlResults.rows.length){
        // console.log('I am successful! getting data from the DB', data.rows);
        response.status(200).json(sqlResults.rows[0]);
      } else {
        // make an API call and get the city information from Google API
        const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${location}&key=${process.env.GEOKEY}`;
        superagent.get(url)
          .then(results => {
            const locationObject = new Location(location, results.body.results[0]);
        
            const sql = `INSERT INTO location (search_query, formatted_query, latitude, longitude) VALUES ($1, $2, $3, $4);`;
            const safeValues = [locationObject.search_query, locationObject.formatted_query, locationObject.latitude, locationObject.longitude];

            client.query(sql, safeValues)

            response.send(locationObject);

          })
          .catch(error => {
            console.log(error)
            response.send(error).status(500);
          });
      }
  })
}

module.exports = handleLocation;