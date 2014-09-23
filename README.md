SinatraRESTAssignment
=====================

A simple REST-based API that processes requests to manage an "events" resource over HTTP using JSON.

Initial Setup
-------------

1. install jruby
2. run "gem install bundler"
3. run "bundle install"
4. run "puma config.ru" -p 8999

### REST Calls

#### POST /events     
curl -X POST "http://localhost:8999/events" -H "Content-Type: application/json" -d '{"data":"NAME is now at LATITUDE/LONGITUDE"}'
##### Results - Creates a new event
200: status code if success
400: status code if failure with the following json

```javascript
{
   "status": "failure",
   "errors": ["collection of errors"]
   "data": null
}
```

***

#### GET /events 
curl "http://localhost:8999/events"
#####Results - Creates a new event

200: status code if success with the following json
```javascript
{
   "status": "success",
   "errors": null
   "data":  [
               {"id":1, "data":"NAME is now at LATITUDE/LONGITUDE"}
               {"id":2, "data":"NAME is now at LATITUDE/LONGITUDE"}
            ]
}
```

***

#### DELETE /events 
curl -X DELETE "http://localhost:8999/events"
#####Results - Deletes all events

200: status code if success with the following json
500: status code if failure

***

#### GET /events/id 
curl "http://localhost:8999/events/2"
#####Results - Gets event with id of 2

200: status code if success with the following json
```javascript
{
   "status": "success",
   "errors": null
   "data":  {"id":1, "data":"NAME is now at LATITUDE/LONGITUDE"}
}
```
400: status code if failure with the following json

```javascript
{
   "status": "failure",
   "errors": ["collection of errors"]
   "data": null
}
```

***

#### PUT /events/id 
curl -X PUT "http://localhost:8999/events/2" -H "Content-Type: application/json" -d '{"data":"NAME is now at LATITUDE/LONGITUDE"}'
#####Results - Updates event with id of 2

200: status code if success
400: status code if failure with the following json

```javascript
{
   "status": "failure",
   "errors": ["collection of errors"]
   "data": null
}
```

***

#### DELETE /events/id 
curl -X DELETE "http://localhost:8999/events/2"
#####Results - Deletes event with id of 2

200: status code if success
400: status code if failure with the following json

```javascript
{
   "status": "failure",
   "errors": ["collection of errors"]
   "data": null
}
```