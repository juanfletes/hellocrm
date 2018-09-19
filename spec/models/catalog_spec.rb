require 'rails_helper'

RSpec.describe Catalog, type: :model do
  describe 'base validations' do
    it 'is valid' do
      expect(build(:catalog)).to be_valid
    end
    it 'create' do
      expect { create(:catalog) }.to change { Catalog.count }.from(0).to(1)
    end
    it 'update' do
      var_factory = create(:catalog)
      var_factory.name = 'other catalog name'
      var_factory.save!
      expect(var_factory.name).to eq 'other catalog name'
    end
    it 'delete' do
      create(:catalog)
      expect { Catalog.last.destroy }.to change { Catalog.count }.from(1).to(0)
    end
  end
  describe 'attributes validations' do
    describe 'presence' do
      it { is_expected.to validate_presence_of(:code) }
      it { is_expected.to validate_presence_of(:name) }
    end
    describe 'uniqueness' do
      subject { build(:catalog) }
      it { is_expected.to validate_uniqueness_of(:code) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end
    describe 'format' do
      it { is_expected.to allow_value('asd385zdr').for(:code) }
      it { is_expected.to_not allow_value('as$%@r').for(:code) }
      it { is_expected.to allow_value('name of test catalog').for(:name) }
      it { is_expected.to_not allow_value('not a good name is as$%@r').for(:name) }
    end
    describe 'length' do
      it { is_expected.to validate_length_of(:code).is_at_most(10) }
      it { is_expected.to validate_length_of(:parent_code).is_at_most(10) }
      it { is_expected.to validate_length_of(:name).is_at_most(250) }
      it { is_expected.to validate_length_of(:description).is_at_most(500) }
    end
  end
end
