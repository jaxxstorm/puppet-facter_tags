# Creates a structured fact, tags, from all the JSON files in
# the directory /etc/tags

tags = Dir['/etc/tags/*.json'].map { |f| JSON.parse File.read(f) }.flatten

Facter.add(:tags) do
  setcode do
    tags
  end
end
