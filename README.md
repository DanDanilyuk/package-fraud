<h1 align="center">
  <br>
  <a href="http://guides.rubyonrails.org/"><img src="https://raw.githubusercontent.com/dandanilyuk/package_fraud/master/public/img/package_red.png" alt="Package Fraud API" width="400"></a>
  <br>
  :gift: Pakcage Fraud API :airplane:
  <br>
</h1>

<h4 align="center">A API that returns the estimated risk of a package.</h4>
<h6 align="center">Built with <a href="http://guides.rubyonrails.org/" target="_blank">Ruby-On-Rails</a>.</h6>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#download">Download</a> •
  <a href="#technologies_used">Technologies Used</a> •
  <a href="#license">License</a>
</p>

<div align="center">
  [![Coverage Status](https://img.shields.io/coveralls/aterris/simplecov-shield.svg)](https://coveralls.io/r/aterris/simplecov-shield?branch=master) [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
  <br>
</div>
![screenshot](https://raw.githubusercontent.com/dandanilyuk/package_fraud/master/public/img/Package_Fraud_API.gif)


## Key Features :key:

* Addresses - Adds address to database if its new.
 - Validates that the address doesn't already exist.
 - Tracks number of times the address was checked.
* Reports - Creates a report for an address.
 - If address exists add report to that address and analyze risk.
 - If address doesn't exists add address then add report to that address and analyze risk.
* API call is returned in JSON format
* Readable API call messages that give user good feedback
* [BCrypt](https://github.com/codahale/bcrypt-ruby) authentication via API-Key for posting Reviews

## How To Use :wrench:

### Call Hosted API

##### API hosted on https://package-fraud-api.herokuapp.com/

You can call our hosted api with curl or in any language
```bash
# Curl call for address/check
$ curl -X POST \
  'https://package-fraud-api.herokuapp.com/check' \
  -d street=123 Test Rd \
  -d city=Portland \
  -d state=OR \
  -d zip=97206

# Curl call for report
$ curl -X POST \
  'https://package-fraud-api.herokuapp.com/report' \
  -d street=123 Test Rd \
  -d city=Portland \
  -d state=OR \
  -d zip=97206 \
  -d name=Chuck Norris \
  -d date=12.17.2017 \
  -d carrier=USPS \
  -d notes=Buyer Claims Package was never received \
  -d code=1 \
  -d price=199.99


# open postman and make a sample address post call to
https://package-fraud-api.herokuapp.com/check
# paramaters required for address create/check are street, city, state, and zip
# Read the JSON output

# open postman and make a sample report post call to
https://package-fraud-api.herokuapp.com/report
# paramaters required for report create are street, city, state, and zip, name, date, carrier, notes, code, price
# Read the JSON output
```

### Run Local API

To clone and run this application, you'll need [Git](https://git-scm.com) and [Ruby](http://ruby-doc.org/) (which comes with [rails](http://guides.rubyonrails.org/)) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/DanDanilyuk/package_fraud

# Go into the repository
$ cd package_fraud

# Install dependencies
$ bundle

# Run the app
$ rails s

# Open postman and make a sample address post call to
http://localhost:3000/check
# paramaters required for address create/check are street, city, state, and zip
# Read the JSON output

# Open postman and make a sample report post call to
http://localhost:3000/report
# paramaters required for report create are street, city, state, and zip, name, date, carrier, notes, code, price
# Read the JSON output
```

Note: If you get any errors please report them and they will be fixed asap.


## Download :arrow_down:

You can [download](https://www.getpostman.com/) latest installable version of Postman.

## Technologies Used :computer:

This software uses code from several open source packages.

- [Ruby](http://ruby-doc.org/)
- [Rails](http://guides.rubyonrails.org/)
- [Faker](https://github.com/stympy/faker)
- [BCrypt](https://github.com/codahale/bcrypt-ruby)
- [Rspec](https://github.com/rspec/rspec-rails)
- [Simplecov](https://github.com/colszowka/simplecov)
- Emojis are taken from [here](https://github.com/arvida/emoji-cheat-sheet.com)
- [PostMan](https://www.getpostman.com/)

---

> GitHub [@DanDanilyuk](https://github.com/dandanilyuk) &nbsp;&middot;&nbsp;
> LinkedIn [/dandanilyuk](https://www.linkedin.com/in/dandanilyuk/)
<div align="center">
  <img src="https://avatars2.githubusercontent.com/u/25314425?s=460&v=4" width="100px;"/><br /><sub>Dan Danilyuk</sub>
</div>



## License

[MIT](https://opensource.org/licenses/MIT)
