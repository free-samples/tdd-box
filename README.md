# tdd-box

Basic cookbook that installs nginx and is used to explain Chef's Inspec workflow.

## Supported Platforms

- CentOS 7.3+

## Requirements

-  Vagrant 2.2.7+
-  VirtualBox 6.0+
-  Ruby 2.6.0+

## Development Environment

Though not flawless, the simplest way I've found to install the required applications is by using a Gemfile. We can install the gems with:

```
bundle install
```

Some of the gems may require tweaks in the config, but that will really depend on your own machine, OS, etc.

## Running the Box

Once the gems are installed, we will create the vm or container with kitchen:

```
bundle exec kitchen create
```

This will use vagrant or docker (depending on your .kitchen.yml file) to download the vagrant image or the docker image. The image will be downloaded and a copy will be locally deployed. This will be a bareboned copy.

To run the commands from the cookbook, we will need to converge:

```
bundle exec kitchen converge
```

This should run the commands defined in the cookbook. In this particular cookbook, nginx should be installed, enabled and started.

We have test defined in our cookbook. Once the vm or container has been created and converged, we should now run our tests:

```
bundle exec kitchen verify
```

This will run inspec (https://www.inspec.io/) tests agains our vm or container.

Once our tests have passed, we should destroy our vm or container

```
bundle exec kitchen destroy
```

## Debugging

You may need to debug the execution of the vm or container. We have a couple of tools that we may use for this. We can ssh into the machine:

```
bundle exec kitchen login
```
This will ssh into the box and we may look around within that box.

Inspec is a ruby based DSL so we may use ruby gems within the specs. A useful tool for debugging is pry (https://github.com/pry/pry). Within our inspec test we can add the line

```
binding.pry
```

And when we run kitchen verify, the execution will pause until we exit that debug mode.

And lastly, we may add verbosity to our kitchen commands

```
bundle exec kitchen converge --log-level=debug
```

## License and Authors

The project uses the MIT License. See LICENSE for details.

Author:: Bernardo Pineda