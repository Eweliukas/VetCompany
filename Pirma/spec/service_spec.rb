require 'spec_helper'

describe Service do
  let(:service) { described_class.new(1, 'sterilization') }

  it 'sets the status field after initialization' do
    expect(service.status).to eq(:ServiceInProgress)
  end
  it 'sets the rehabilitation_days field after initializations' do
    expect(service.rehabilitation_days).to eq(0)
  end
  it 'sets the status field to healing' do
    service.operation
    expect(service.status).to eq(:healing)
  end
  it 'sets the status field to healing' do
    service.sterilization
    expect(service.status).to eq(:healing)
  end
  it 'sets the status field to died' do
    service.euthanasia
    expect(service.status).to eq(:died)
  end
  it 'sets the status field to healthy' do
    service.health_check
    expect(service.status).to eq(:healthy)
  end
  it 'sets the rehabilitation_days field to 3' do
    service.operation
    expect(service.rehabilitation_days).to eq(3)
  end
  it 'sets the rehabilitation_days field to 4' do
    service.sterilization
    expect(service.rehabilitation_days).to eq(4)
  end
  it 'sets the rehabilitation_days field to 0' do
    service.health_check
    expect(service.rehabilitation_days).to eq(0)
  end
  it 'with parameter service_name = operation function' do
    service = described_class.new(1, 'operation')
    service.health_check
    expect(service.check_rehabilitation).to eq(true)
  end
  it 'with parameter service_name = sterilization function' do
    service = described_class.new(1, 'sterilization')
    service.health_check
    expect(service.check_rehabilitation).to eq(true)
  end
  it 'with parameter service_name = operation funtcion' do
    service = described_class.new(1, 'health_check')
    service.health_check
    expect(service.check_rehabilitation).to eq(false)
  end
end
