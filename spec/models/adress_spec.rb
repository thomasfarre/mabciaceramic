require 'rails_helper'

RSpec.describe Adress, type: :model do
  subject { Adress.new(street: '104 rue des Abricots', zipcode: 42_100, city: 'La Ricamarie', name: 'Toto') }

  before { subject.save }

  it 'street should be present' do
    subject.street = nil
    expect(subject).to_not be_valid
  end

  it 'zipcode should be present' do
    subject.zipcode = nil
    expect(subject).to_not be_valid
  end

  it 'zipcode should have 5 digit' do
    subject.zipcode = 4200
    expect(subject).to_not be_valid
  end

  it 'city should be present' do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 40
    expect(subject).to_not be_valid
  end

  it 'country should be present' do
    subject.country = nil
    expect(subject).to_not be_valid
  end
end
