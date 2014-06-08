class CopyWeeksFromAtomToLoad < ActiveRecord::Migration
  def up
    Load.all.each do |load|
      load.update_attribute(:weeks, load.atom.weeks)
    end
  end

  def down
  end
end
