# # encoding: utf-8

# Inspec test for recipe tdd-box::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# nodes_dir = '/tmp/kitchen/nodes'
# tk_instance = command("ls #{nodes_dir}").stdout.strip
# node_json = "#{nodes_dir}/#{tk_instance}"
# node = json(node_json).params
# # puts node.inspect

# # # # encoding: utf-8
# describe package('git') do
#   it { should_not be_installed }
# end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('/usr/bin/curl http://127.0.0.1') do
  its('stdout') { should include("Welcome to nginx!") }
end

