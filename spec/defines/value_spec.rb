require 'spec_helper'

describe 'facter_tags::value' do
  let(:title) { 'example' }

  context 'when values are omitted' do
    # no params
    it { expect { should compile }.to raise_error(/values/) }
  end

  context 'when values is an empty string' do
    let(:params) {{
      :values => ''
    }}
    it { is_expected.to compile.and_raise_error(/Values must not be empty/) }
    #it { expect { should compile }.to raise_error(/Values must not be empty/) }
  end

  context 'by default should include init' do
    let(:params) {{
      :values => 'a tag'
    }}
    it { should contain_class('facter_tags') }
  end

  context 'tags directory should exist' do
    let(:params) {{
      :values => 'a tag'
    }}
    it { should contain_file('tag directory') \
      .with_ensure('directory') \
      .with_path('/etc/tags')
    }
  end

  context 'when passing a string' do
    let(:params) {{
      :values => 'a tag'
    }}
    it { should contain_file('/etc/tags/example.json') \
      .with_content(/["a tag"]/)
    }
  end

  context 'when passing an array' do
    let(:params) {{
      :values => ["infra"]
    }}
    it { should contain_file('/etc/tags/example.json') \
      .with_content(/"infra"/)
    }     
  end

  context 'when passing a simple hash' do
    let(:params) {{
      :values => { 'key' => 'value' }
    }}
    it { should contain_file('/etc/tags/example.json') \
      .with_content(/"key": "value"/)
    }
  end

end
