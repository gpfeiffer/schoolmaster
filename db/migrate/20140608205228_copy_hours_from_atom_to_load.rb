class CopyHoursFromAtomToLoad < ActiveRecord::Migration
  def up
    Load.all.each do |load|
      load.update_attribute(:hours, load.atom.hours)
    end
  end

  def down
  end
end
