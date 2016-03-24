# == Class :facter_tags 
# Sets up the directory which tags will be placed in
#
# == Parameters
#
class facter_tags
{

  # The tags path is hard coded
  # This is because the facter value reads from it
  # if anyone has a way of passing params
  # I'm all ears!
  file { '/etc/tags':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
