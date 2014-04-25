## Getting Started

Before you get started, there are a few steps you will need to take depending
on your operating system:
  * [Windows](#windows)
  * [Mac](#mac)
  * [Linux](#linux)

Then you can [run your Rails app](#running_rails). 

---
### <a name="windows"></a> Windows setup

While there are tools which let you develop Rails applications on Windows,
the standard development tools tend to assume Linux/OS X, so to make sure
we don't waste time at the Code Smash event just installing tools on your
Windows laptop, we've prepared a Virtual Machine which will give you our
standard development setup.

1. **Install VirtualBox and Vagrant**
   
   You will need to download and install [VirtualBox][virtualbox-download] and [Vagrant][vagrant-download]

2. **Start our virtual machine**

   With these installed, you can start up ShopKeep's virtual machine using PowerShell:

   ```shell
   cd /path/to/simple-transaction-service
   vagrant up
   ```

   The first time you run this command, it will take some time as it needs to
   download the OS.

3. **Logging in**

   The username and password for the virtual machine are both set to 'vagrant'.

   Once you have logged in, you will be able to find the project code like so:

   ```shell
   cd simple-transaction-service
   ```

   You are now ready to work!  The [instructions below](#starting-the-app) give
   you the commands you need to run to start up Rails.
   
4. **Managing the virtual machine**
   You can start, stop and clean up the virtual machine using `vagrant` subcommands

   - Stopping: `vagrant halt`
   - Restarting: `vagrant up`
   - Destroying: `vagrant destroy`

   Destroying will completely remove the virtual machine and delete all disk images
   involved.

---

### <a name="linux"></a> Linux setup

We recommend installing [RVM][rvm] over using or upgrading the system version of Ruby
in order to avoid compatibility issues. To install, run the following line:

`curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.1`

RVM will select the correct Ruby version for your project automatically:

```shell
$ cd /path/to/simple-transaction-service
> ruby-2.1.1 - #gemset created /Users/barry/.rvm/gems/ruby-2.1.1@simple-transaction-service
> ruby-2.1.1 - #generating simple-transaction-service wrappers - please wait
```

Finally, install [Bundler][bundler] to look after the Ruby gems (libraries):

```shell
$ gem install bundler
```

---

### <a name="mac"></a> Mac setup

On OSX, you have the option of using native tools or the Vagrant virtual machine provided.

#### Native Install

You will need to install [Homebrew][brew] if you haven't already:

`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

And then RVM (See the Linux guide [above](#linux) )

`curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.1`

#### Vagrant
See the Windows guide [above](#windows)

---

### <a name="running_rails"></a> Starting your Rails application

1. Install the "gems" (Ruby libraries):

   ```shell
   cd /path/to/simple-transaction-service
   bundle install
   ```

2. Prepare the database:

   ```shell
   bundle exec rake db:migrate
   ```

3. Start a Rails server:

   ```shell
   bundle exec rails server
   ```

4. Visit `http://localhost:3000` in your browser

   __Note:__ We have configured Vagrant to forward port 3000 on the host to the
   virtual machine, so the behaviour will be the same regardless of your setup.

### Running the Tests

We have set the app up to use [RSpec][rspec], one of the most popular Ruby
testing frameworks. You can find the test files in `spec/` ("specifications"),
we will add more to get you started at the event. When the tests all pass, 
you've passed!

1. Prepare the test database

   `bundle exec rake db:test:prepare`

2. Run the specs

   `bundle exec rake spec`

You can read some best practice on writing specs at [Better Specs][betterspecs]

[rvm]: http://rvm.io
[brew]: http://brew.sh
[bundler]: http://bundler.io
[virtualbox-download]: https://www.virtualbox.org/wiki/Downloads
[vagrant-download]: http://www.vagrantup.com/downloads.html

[rspec]: http://rspec.info
[betterspecs]: http://betterspecs.org
