require 'spec_helper'

describe 'facter_tags' do

  RSpec.configure do |c|
    c.default_facts = {
      :architecture               => 'x86_64',
    }
  end

  context 'by default, should create tags directory' do
    it { should contain_file('tag directory') \
      .with(
        'ensure'  => 'directory',
        'path'    => '/etc/tags'
      )
    }
  end
 

end
