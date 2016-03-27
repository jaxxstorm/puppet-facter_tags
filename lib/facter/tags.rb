# Creates a structured fact, tags, from all the JSON files in
# the directory /etc/tags

def valid_json?(json)
  begin
    JSON.parse(json)
    return true
  rescue JSON::ParserError => e
    return false
  end
end

# Read all json files from directory
tag_files = Dir['/etc/tags/*.json']

# loop through through all those files
tags = tag_files.map do |f|
  file = File.read(f)
  # Quick check for valid JSON
  if valid_json?(file)
    JSON.parse(file)
  end
end

# Flatten all the values
tags.flatten!

# Remove all nil values
tags.compact!

# Old method left here for reference
#tags = Dir['/etc/tags/*.json'].map { |f| JSON.parse File.read(f) }.flatten

Facter.add(:tags) do
  confine :linux
  setcode do
    tags unless tags.empty?
  end
end
