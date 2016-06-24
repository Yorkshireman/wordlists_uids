[![Stories in Ready](https://badge.waffle.io/Yorkshireman/wordlists_uids.png?label=ready&title=Ready)](https://waffle.io/Yorkshireman/wordlists_uids)
# MyWordList with UUIDs for Primary Keys  
  
Using the book, ["Frontend-friendly Rails"](http://blog.arkency.com/frontend-friendly-rails/) as a reference, I'm planning to build a backend Rails API that is only loosely coupled with a JS framework frontend. To achieve this the app will:  
  
* use client-generated uuids, when creating resources, as primary keys in an activerecord database,  
* the Rails (4.2.6) API will provide JSON endpoints for a frontend framework to consume (probably React).  
  
  
## Running locally  
  
* install postgresql  
* `bundle install`  
* start a local postgres server: `postgres`  
* start a local rails server: `rails s`  
* navigate to [localhost: 3000](http://localhost:3000)  
  
  
## Tests  
`bundle exec rspec`  
