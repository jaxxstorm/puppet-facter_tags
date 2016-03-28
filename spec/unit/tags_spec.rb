require 'spec_helper'
require 'facter/tags'

RSpec.configure do |c|
  c.include PuppetlabsSpec::Files

  c.before :each do
    # Ensure that we don't accidentally cache facts and environment
    # between test cases.
    Facter::Util::Loader.any_instance.stubs(:load_all)
    Facter.clear
    Facter.clear_messages

  end

  c.after :each do
    PuppetlabsSpec::Files.cleanup
  end
end

describe 'tags_fact', :type => :fact do

  context 'by default it should be nil' do
    it "should return the facter value" do
      expect(Facter.fact(:tags).value).to be_nil
    end
  end
end
