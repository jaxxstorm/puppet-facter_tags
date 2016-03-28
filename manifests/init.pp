# == Class :facter_tags 
# Sets up the directory which tags will be placed in
#
# == Parameters
#
# [*purge_tag_dir*]
#   Purge tag files not managed by Puppet
class facter_tags (
  $user  = 'root',
  $group = 'root',
  $mode  = '0755',
  $purge_tag_dir = false,
)
{

  validate_bool($purge_tag_dir)

  # The tags path is hard coded
  # This is because the facter value reads from it
  # if anyone has a way of passing params
  # I'm all ears!
  file { 'tag directory':
    ensure   => directory,
    path     => '/etc/tags',
    owner    => $user,
    group    => $group,
    mode     => $mode,
    purge    => $purge_tag_dir,
    recurse  => $purge_tag_dir,
  }

}
