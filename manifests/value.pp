# == Definition facter_tags::value
#
# This definition creates a facter_tags entry
define facter_tags::value (
  $values,
  $ensure = present,
){
  # Ensure we populate the /etc/tags dir
  require facter_tags

  # first make sure we're not empty
  if !empty($values) {
    file { "/etc/tags/${title}.json":
      ensure  => $ensure,
      content => tags_sorted_json($values, true, 4),
    }
  } else {
    fail('Values must not be empty')
  }
}
