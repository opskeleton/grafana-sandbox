require 'spec_helper'

describe package('influxdb') do
  it { should be_installed }
end

describe service('influxdb') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8086) do
  it { should be_listening }
end

describe command("curl 'http://localhost:8086/db?u=root&p=vagrant'") do
   its(:stdout) { should match /metrics/ }
end
