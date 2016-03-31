# Creates a structured fact, tags, from all the JSON files in
# the directory /etc/tags
require 'pp'
module Tags
  def self.valid_json?(json)
    begin
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
    end
  end

  # Read all json files from directory
  def self.tag_files
    return Dir['/etc/tags/*.json']
  end

  def self.tags
    # loop through through all those files
    values = Tags.tag_files.map do |f|
      file = File.read(f)
      # Quick check for valid JSON
      if Tags.valid_json?(file)
        JSON.parse(file)
      end
    end
  end

  def self.final_tags
    clean_tags = self.tags.flatten!
    clean_tags.compact!
    clean_tags.uniq!
    return clean_tags
  end

  def self.add_facts
    Facter.add(:tags) do
      confine :kernel => 'Linux'
      setcode do
        Tags.final_tags unless Tags.final_tags.empty?
      end
    end
  end

end

# Add the facts!
Tags.add_facts


