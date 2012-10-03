# -*- coding: undecided -*-
class SetWorkMailForAcademics < ActiveRecord::Migration
  def up
    Academic.all.each do |academic|
      first = academic.first.downcase.sub('ä','ae').sub('ö','oe').sub('ü','ue').sub(' ', '').sub("'", '')
      last = academic.last.downcase.sub('ä','ae').sub('ö','oe').sub('ü','ue').sub(' ', '').sub("'", '')

      work_mail = "#{first}.#{last}"
      academic.update_attribute(:work_mail, work_mail)
    end
  end

  def down
  end
end
