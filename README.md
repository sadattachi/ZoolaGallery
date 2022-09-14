# Task Management API

### Ruby Version 3.1.2
To install ruby run:
```
rvm install "ruby-3.1.2"
```

### Gem Installation
Install all necessary gems by running:
```
bundle install
```

### Database Setup
For this API to work you need to create postgres user:
```
psql -d postgres -c "create role zoola_gallery with createdb login password 'zoola_gallery';"
```
After creating user run:
```
rails db:setup --trace
```
To initialize database with basic data from `db/seeds.rb` you may want to run:
```
rails db:seed
```