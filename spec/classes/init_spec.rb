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
        'path'    => '/etc/tags',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0755',
        'purge'   => false,
        'recurse' => false,
      )
    }
  end

  context 'purge config dirs' do
    let(:params) {{
      :purge_tag_dir => true,
    }}
    it { should contain_file('tag directory') \
      .with(
        'ensure'  => 'directory',
        'purge'   => true,
        'recurse' => true,
      )
    }
  end
 

end
