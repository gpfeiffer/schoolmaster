class FindSupervisionPartners < ActiveRecord::Migration
  def up
    Student.all.each do |student|
      student.academics << Academic.find_by_last(student.supervisor.split[1])
      student.supervisions[0].update_attribute(:status, "Main")
      co = student.cosupervisor.split[1]
      if co
        student.academics << Academic.find_by_last(co)
        student.supervisions[-1].update_attribute(:status, "Co")
      end
    end
  end

  def down
    Student.all.each do |student|
      student.supervisions.each do |sv|
        if sv.status == "Main"
          student.supervisor = sv.academic
        elsif sv.status == "Co"
          student.cosupervisor = sv.academic
        end
      end
    end
  end
end
