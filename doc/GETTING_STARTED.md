## Getting Started

### Development Tools
Before you get started, there are a few steps you will need to take depending
on your operating system.

#### Windows
Although there are tools that allow you to work on Ruby projects natively
on Windows, a lot of the tool chain tends to assume Linux-like behaviour, so
we find it easier to prepare a Linux VM to run your app, allowing you to
edit code and view the results in your native OS.

1. ##### Install VirtualBox and Vagrant
   
   You will need to download and install [VirtualBox][virtualbox-download] and [Vagrant][vagrant-download]

2. ##### Create and start the virtual machine

   With these installed, you can start up the virtual machine using PowerShell, like so:

   ```
   cd /path/to/simple-transaction-service
   vagrant up
   ```

   The first time you run this command, it will take some time as it needs to
   download the base disk image for the VM.

3. ##### Logging in and finding the code

   The username and password for the Virtual Machine are both set to 'vagrant'.

   Once you have logged in, you will be able to find the project code like so:

   ```
   cd simple-transaction-service
   ```

   You are now ready to work!

   The [instructions below](#starting-the-app) give you the commands you need to
   run to start up Rails.
   
4. ##### Managing the virtual machine
   You can start, stop and clean up the virtual machine using `vagrant` subcommands

   - Stopping: `vagrant halt`
   - Restarting: `vagrant up`
   - Destroying: `vagrant destroy`

   Destroying will completely remove the virtual machine and delete all disk images
   involved.
   
#### Linux
We recommend installing [RVM][rvm] over using or upgrading the system version of Ruby
in order to avoid compatibility issues. To install, run the following line:

`curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.1`

RVM will select the correct version and prepare a gem set for your project
automatically:

```
$ cd /path/to/simple-transaction-service
> ruby-2.1.1 - #gemset created /Users/barry/.rvm/gems/ruby-2.1.1@simple-transaction-service
> ruby-2.1.1 - #generating simple-transaction-service wrappers - please wait
```

#### Mac
On OSX, you have the option of using native tools or the Vagrantfile provided.

##### Native Install
You will need to install [Homebrew][brew] if you haven't already:

`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

And then RVM (See the Linux guide [above](#linux) )

`curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.1`

##### Vagrant
See the Windows guide [above](#windows)

### Starting the App

1. Install the gems:

   ```
   cd /path/to/simple-transaction-service
   bundle install
   ```

2. Prepare the sqlite database:

   `bundle exec rake db:migrate`

3. Start rails:

   `bundle exec rails s`

4. Visit `http://localhost:3000` in your browser

   __Note:__ We have configured Vagrant to forward port 3000 on the host to the
   virtual machine, so the behaviour will be the same regardless of your setup.

### Running the Tests
We have set the app up to use [RSpec][rspec], one of the most popular Ruby
testing frameworks. You can find the test files in `spec/`, we will add more
to get you started at the event.

1. Prepare the test database

   `bundle exec rake db:test:prepare`

2. Run the specs

   `bundle exec rake spec`

You can read some best practice on writing specs at [Better Specs][betterspecs]

[rvm]: http://rvm.io
[brew]: http://brew.sh
[virtualbox-download]: https://www.virtualbox.org/wiki/Downloads
[vagrant-download]: http://www.vagrantup.com/downloads.html

[rspec]: http://rspec.info
[betterspecs]: http://betterspecs.org
