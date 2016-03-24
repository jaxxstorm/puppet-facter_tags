# External Tags for Puppet

## Installation

### What this module does

This module creates a directory, `/etc/tags` and allows you to create JSON in this directory to create arbitrary tags in from a variety of sources. It then tags those tags and creates a structured fact with them

It also includes a defined type which allows you to create tags from with Puppet.

You might use this if:

  * You want an external build tool to tag virtual machines/container/hosts
  * You want to extend facter beyond what it does with key value pairs, and want a facter value with a output of `tags`
  * You are already used to the the concept of tagging in AWS, and want the same ability to use tags in physical infrastructure
  * You have a deployment tool which you want to use to tag infrastructure, and you want those tags to be available in facter

## Usage

The basic way of using this module is to include it:

```
include ::facter_tags
```

Once you've included the module, a directory, `/etc/tags` will be created which is a directory which will be read by facter.

You can use any tool you like to create JSON files inside this directory, and these will end up as structured facts.

### Tags from Puppet

There's also a defined type included which allows you to tag hosts from within Puppet. Using this is as simple as this:

```puppet
facter_tags::value { 'puppet':
  values => ['infrastructure', 'operations']
}
```

Your tags will be parsed and then a JSON file will be created inside `/etc/tags` with the title of your defined type, so in this case `/etc/tags/puppet.json`.

Make sure you don't have two tools overriding each others JSON files :)

##Limitations

Depends on the JSON gem, or a modern ruby.