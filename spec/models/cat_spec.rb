require_relative '../rails_helper'
require 'colorize'

describe 'cat' do
  it 'must have an owner' do
    cat = Cat.create(name: "Johnny", breed: "Tabby", neighborhood: "Wicker Park", price: 100.00)
    expect(cat.valid?).to eq(false)
  end

  it 'must have a name' do
    @owner = User.create(name: "Tim")
    cat = Cat.create(breed: "Tabby", owner_id: @owner.id, neighborhood: "Wicker Park", price: 100.00)
    expect(cat.valid?).to eq(false)
  end
end

