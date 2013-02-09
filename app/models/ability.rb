class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :supervisor
      can :read, [Academic, Student, Room, Author, Project]

      can :update, Academic do |academic|
        academic == user.academic
      end

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

      can :update, Direction do |direction|
        direction.academic == user.academic
      end

      can :update, Examination do |examination|
        examination.academic == user.academic
      end
    else
      can :read, [Academic, Student, Author]
    end
    if user.role? "Project Manager"
      can :manage, [Author, Project, Direction, Examination]
    end
  end
end
