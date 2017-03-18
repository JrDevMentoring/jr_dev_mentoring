## Junior Developer Mentoring [![Circle CI](https://circleci.com/gh/kmcrayton7/jr_dev_mentoring.svg?style=svg&circle-token=5626595a0b63b1dedbee04a8e40883709b91a3cf)](https://circleci.com/gh/kmcrayton7/jr_dev_mentoring) 

Harnessing the power of mentorship to build a community of work ready Jr. Devs.

__Note: Usage of all/any Jr Dev Mentoring space signifies agreement to conform to the [code of conduct](http://bit.ly/2mMILU1)__

### Getting Started

###### Dependencies:

1. Ruby 2.3
2. Rails 4
3. Postgres DB

###### Installations steps:

1. Clone the app
2. Install bundles
3. Get a valid `application.yml` file for env vars.
4. Create and Migrate database
5. Start up the local server
6. Create a default admin user => `$ rake db:seed`
Visit the homepage at: `http://localhost:3000`, or Admin homepage at `http://localhost:3000/admin`

### Running the tests

The Continous Integration testing has CI-status has shown above. However, to run these test on the development environment we are using Rspec => from inside the root folder of the project, run `$ rspec`

### Contributing

Please read the [Contribution Guide](https://github.com/kmcrayton7/jr_dev_mentoring/blob/master/CONTRIBUTING.md) for details on the process for submitting pull requests to us.

### License

This project is licensed under the [MIT open source license](https://opensource.org/licenses/MIT)

### On the media

Twitter: @JrDevMentoring
