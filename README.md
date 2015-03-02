# Water Quality

This Water Quality web application can be used to compare the water quality
in a given area using different methodologies. This web application allows the
user to construct their own models to assess water_quality and then use that
model along with real data to quantify how good or bad the water quality is in
a given area. This application is seeded with data from the Los Angeles county
area.

## Quick Start

1. Install [rvm](https://rvm.io/rvm/install) or
   [rbenv](https://github.com/sstephenson/rbenv#installation) if one of them is
   not already installed.
2. Install ruby-2.1.5 if it is not already installed.
3. Install bundler with the following command if it is not already installed.

   ```bash
   gem install bundler
   ```
4. After checking out the water_quality github repository into a local directory,
   use bundler to install the required dependencies. Some of the dependencies
   may require the installation of system packages.

   ```bash
   bundle
   ```
5. Setup a mysql database with a water_quality user that can create databases
   and is granted all permissions on water_quality_development and
   water_quality_test. In addition, this user should be able to login with
   the password 'password'. See config/database.yml for more configuration
   details.
6. Run the following commands at the bash prompt to create development and test
   databases, run the migrations, and start the rails server.

   ```bash
   rake db:create
   rake db:migrate
   rake db:seed
   rails g forem:install
   rails s
   ```

   When running `rails g forem:install`, accept the first two default options.
   Then, select `n` for the last question. After running `rails s`, the
   application is ready to use. To utilize forum functionality, create a user
   and then set the forem_admin property to true for that user. Once enabled,
   this user can create new forums.

## Quick Test

Once the Water Quality Web Application is running locally on port 3000, visit the
following url.

http://localhost:3000

Usage information can be found in the 'How It Works' tab.

## Apipie Documentation

To view the Apipie documentation, visit the following url after running the
Water Quality Web Application locally on port 3000.

http://localhost:3000/apipie

## Tests

This section is broken down into a section for running tests and a section for
viewing the test coverage report.

### Running Tests

To run the Rspec tests, run the following command in the root directory of
the Water Quality web application.

```bash
rspec
```

### Viewing Test Coverage Report

To view the test coverage report, which is generated when running rspec, run
the following command after running the rspec tests. These commands should be
run from the root directory of the Boggle web application.

Ubuntu

```bash
firefox coverage/index.html
```

Mac OSX

```bash
open coverage/index.html
```
