# Venue Driver v2 API examples

Sample Ruby code that demonstrates how to call the Venue Driver v2 API.

## Running

### Step 1: (Optional) Install RVM

https://rvm.io/rvm/install

You might like to run Ruby in some other way.  Have fun with that.

### Step 2: Install Ruby

I used 2.4 and that's recorded in the .rvmrc file.  Any 2.x version will probably work.  (Older versions might require a Gemfile adjustment to use an older version of HTTParty.)

### Step 3: Install Bundler

    gem install bundler

### Step 4: Install gem bundle

    bundle install

### Step 5: Set up a configuration file

The examples will look for a ```configuration.yml``` file with a format like this:

    api_base_url: http://exmaple.com/api/v2/
    username: username
    password: password
    account_id: 1234
    start_date: 2017-07-01T11:00:00+00:00
    updated_after: 2017-06-20T12:00:00+00:00

You can request a configuration file with useful information from the Hakkasan Group engineering department.

### Step 6: Run a simple example

    ruby examples/list_accounts.rb
