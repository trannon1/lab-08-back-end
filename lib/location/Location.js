'use strict';

function Location(request, geoData){
    this.search_query = request;
    this.formatted_query = geoData.formatted_address;
    this.latitude = geoData.geometry.location.lat;
    this.longitude = geoData.geometry.location.lng;
  }

module.exports = Location;