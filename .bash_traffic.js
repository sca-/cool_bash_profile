const https = require('https');
const url = require('url');
const path = require('path');
const fs = require('fs');

const departurePlaceId = 'ChIJt9urMlGzSkERNGuxTOQZjbU';
const arrivalPlaceId = 'ChIJ09uaNFZJtUYR4kIQK2JmZ8A';
const apiKey = process.env.GOOGLE_MAPS_API_KEY;

if (!apiKey) exit(1);

const baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';

const requestUrl = `${baseUrl}?origin=place_id:${departurePlaceId}&destination=place_id:${arrivalPlaceId}&key=${apiKey}&departure_time=now`;

let req = https.request(
	Object.assign(
		{},
		url.parse(requestUrl),
		{
			headers: {
				accept: '*/*'
			}
		}
	),
	(res) => {
		let data = '';
		res.on('data', chunk => data += chunk);
		res.on('end', $=> {
			const result = JSON.parse(data);
			const duration = result['routes'][0]['legs'][0]['duration_in_traffic'];
			const summary = result['routes'][0]['summary'];
			const color = duration['value'] < 30*60 ?
				"\\e[32m"
				:
				duration['value'] < 45*60 ?
					"\\e[33m"
					:
					"\\e[31m";

			fs.writeFileSync(
				path.resolve(process.env.HOME, '.TRAFFIC.vars'),
				`TRAFFICCHAR="${color}⇧ ${duration['text']} (${summary})\\e[39m"`
			);
		})
	}
);

req.end();
