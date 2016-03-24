# == Definition facter_tags::value
#
# This definition creates a facter_tags entry
define facter_tags::value (
  $ensure => present,
  $value_hash,
){

  $value_hash = {
    template => [delete_undef_values($template_hash)]
  }
  file { "/etc/tags/${title}.json":
    ensure  => $ensure,
    content => tag_sorted_json($value_hash, $consul::pretty_config, $consul::pretty_config_indent),
  }

}
