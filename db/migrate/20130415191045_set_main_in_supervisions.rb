class SetMainInSupervisions < ActiveRecord::Migration
  def up
    Supervision.all.each do |supervision|
      if supervision.status == "Co"
        supervision.main = false
        supervision.save
      end
    end
  end

  def down
    Supervision.all.each do |supervision|
      supervision.status = supervision.main ? "Main" : "Co"
      supervision.save
    end
  end
end
