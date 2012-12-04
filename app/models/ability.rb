class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :supervisor
      can :read, [Academic, Student, Room]
      can :update, Student do |student|
        student.academics.include? user.academic
      end

      # FIXME: can only create committee members for own students.
      can :create, Committee 

      can :destroy, Committee do |committee|
        committee.student.academics.include? user.academic
      end
 
      # FIXME: can only create supervision members for own students.
      can :create, Supervision 

      can :destroy, Supervision do |supervision|
        supervision.student.academics.include? user.academic
      end
    else
      can :read [Academic, Student]
   end
  end
end
