class ChangeOpenedDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :business_hours, :opened, from: nil, to: true
  end
end
