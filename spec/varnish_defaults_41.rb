require 'spec_helper'

describe 'install_varnish::vendor_install' do
  before { stub_resources('4.1') }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: %w(varnish_repo
                                         varnish_default_config
                                         vcl_template
                                         vcl_file
                                         varnish_log)) do |node|
      node_resources(node)
      node.override['varnish']['major_version'] = '4.1'
    end.converge(described_recipe)
  end

  it 'creates the varnish default config' do
    expect(chef_run).to create_template('/etc/default/varnish')
  end

  it 'creates the varnish default config with the user and group settings set' do
    expect(chef_run).to render_file('/etc/default/varnish').with_content(/-j unix,user=varnish/)
  end
end
