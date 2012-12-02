class AddVivaDateToStudent < ActiveRecord::Migration
  def change
    add_column :students, :viva_date, :date
  end
end
