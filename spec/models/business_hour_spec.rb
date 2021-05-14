require 'rails_helper'

RSpec.describe BusinessHour, type: :model do

  context'validation tests'do
    before(:each) do 
      shop = create(:shop)
      business_hour = create(:business_hour)
    end

    it 'ensures business hour day presence' do
      business_hour = build(:business_hour, day:nil)

      expect(business_hour).to_not be_valid
    end
    it 'has a week day number greater than 6' do
      business_hour = build(:business_hour, day:8)
      expect(business_hour).to_not be_valid
    end

    it 'has a week day number between 0 and 6' do
      business_hour = build(:business_hour, day:1)
      expect(business_hour).to be_valid
    end

    it 'should have an opening hour for a working day - not closed' do
      business_hour = build(:business_hour, open:nil)
      expect(business_hour).to_not be_valid
    end

    it 'should have an closing hour for a working day - not closed' do
      business_hour = build(:business_hour, close:nil)
      expect(business_hour).to_not be_valid
    end

    it 'should have a closing hour greater than an opening hour' do
      business_hour = build(:business_hour, open: Time.now + 2.hours, close:Time.now - 2.hours)
      expect(business_hour).to_not be_valid
    end


    it 'should save successfully' do
      business_hour = build(:business_hour)
      expect(business_hour).to be_valid
    end
  end
end

