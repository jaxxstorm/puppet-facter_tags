require 'spec_helper'
require 'facter/tags'

describe 'tags', :type => :fact do

  before { Facter.clear }
  after { Facter.clear }

  context 'default' do
    it 'by default should be nil' do
      expect(Facter.fact(:tags).value).to be_nil
    end
  end
end
