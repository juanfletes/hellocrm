require 'rails_helper'

RSpec.describe Customer, type: :model do
    describe 'base validations' do
    it 'is valid' do
      expect(build(:customer)).to be_valid
    end
    it 'create' do
      expect { create(:customer) }.to change { Customer.count }.from(0).to(1)
    end
    it 'update' do
      var_factory = create(:customer)
      var_factory.name = 'other customer name'
      var_factory.save!
      expect(var_factory.name).to eq 'other customer name'
    end
    it 'delete' do
      create(:customer)
      expect { Customer.last.destroy }.to change { Customer.count }.from(1).to(0)
    end
  end
  describe 'attributes validations' do
    describe 'presence' do
      it { is_expected.to validate_presence_of(:name) }
    end
    describe 'uniqueness' do
      subject { build(:customer) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end
    describe 'format' do
      it { is_expected.to allow_value('name of test customer').for(:name) }
      it { is_expected.to_not allow_value('not a good name is as$%@r').for(:name) }
    end
    describe 'length' do
      it { is_expected.to validate_length_of(:name).is_at_most(1000) }
      it { is_expected.to validate_length_of(:direction).is_at_most(5000) }
      it { is_expected.to validate_length_of(:observation).is_at_most(5000) }
    end
  end
end
