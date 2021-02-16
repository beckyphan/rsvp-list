# README

## rsvp-list database
This rails API application utilized a PostGreSQL database and consists of 2 models: Party & Guests

A user can seed data to populate Parties and associated Guests for search and update fields accordingly.

## database Schema
Currently, a Party has a name, and optionally a 'hoh' or head of household field to aid in instance uniqueness.
```
"parties"
  t.string "name"
  t.string "hoh"
```

Guests belong to a party. Be sure to update the files accordingly to store the fields you need.
```
"guests"
  t.string "fname"
  t.string "lname"
  t.boolean "attending"
  t.boolean "shuttle"
  t.boolean "hotel"
  t.string "notes"
  t.integer "plusones", default: 0
  t.bigint "party_id", null: false
```

Remember to run ```rails db:create``` and ```rails db:migrate```


## Use with frontend & controller actions
Guest search
### GET	/guests/:id(.:format)	guests#show
A get request sending information with ```fname``` '+' ```lname``` will find a Guest by their first and last name in the database and return that guest if they exist.

Otherwise, a get request sending a :id of guest will pull that guest's information

Associated Guests within Party
### GET	/parties/:id(.:format)	parties#show
A get request to parties, identified by an :id will return all guests within that party -- NOT Party information.

Edit controller actions as necessary to fit your case.

## ruby version & gems notes
ruby '3.0.0'
gem 'rails', '~> 6.1.2', '>= 6.1.2.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'jsonapi-serializer' (To serialize data for rendering)
gem 'rack-cors' (Update config > initializers > cors.rb file accordingly)
