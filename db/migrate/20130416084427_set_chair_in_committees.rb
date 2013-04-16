class SetChairInCommittees < ActiveRecord::Migration
  def up
    Committee.all.each do |committee|
      if committee.chair.nil?
        committee.chair = false
        committee.save
      end
    end
  end

  def down
  end
end
