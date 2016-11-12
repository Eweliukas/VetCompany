require 'spec_helper'

describe HealthCard do
  let(:health_card) { described_class.new(1, 'operation') }
  it 'sets the status field after initialization' do
    expect(health_card.status).to equal(:healthy)
  end
  it 'set the status field to died' do
    # (:health_card) { HealthCard.death
    health_card.death
    expect(health_card.status).to equal(:died)
  end
  it 'returns true if there is rehabilitation' do
    health_card.check_for_rehabilitation
    expect(health_card.rehabilitation).to eq(true)
  end
end
