class BusinessHour < ApplicationRecord
  belongs_to :shop
  validates :day, presence: true
  validates :day, inclusion: { in: 1..7 }
  validates :open, presence: true, if: :should_validate?
  validates :close, presence: true, if: :should_validate?
  validate :open_hour_before_close_hour?, if: :should_validate?
  validates :open,uniqueness: { scope: [:shop_id, :day], message: "exist already" }, if: :should_validate?
  validates :close,uniqueness: { scope: [:shop_id, :day], message: "exist already" }, if: :should_validate?
  # validate :range_hour_free?, if: :should_validate?

  # def day_of_week
  #   Date::DAYNAMES[self.day)]
  # end
  

  private

  def should_validate?
    self.opened
  end

  def open_hour_before_close_hour?
    self.open < self.close
  end

  def find_business_hours_per_day
    self.shop.business_hours.where(day:self.day).select(:open,:close)
    # BusinessHour.all.where(shop:self.shop, day:self.day).select(:open,:close)
  end

  def range_hour_free?
    puts find_business_hours_per_day.one?{|business_hour| test(business_hour) == false }
    find_business_hours_per_day.one?{|business_hour| test(business_hour) == false }
  end

  def test(business_hour)
    (business_hour.open..business_hour.close).include?(self.open..self.close)
  end
end
