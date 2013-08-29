class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all

    elsif user.role? :supervisor
      can :read, [Academic, Student, Room]

      can :update, Academic do |academic|
        academic == user.academic
      end

      can :update, Student do |student|
        student.academics.include? user.academic
      end

      # FIXME: can only create committee members for own students.
      can :create, Committee

      can [:update, :destroy], Committee do |committee|
        committee.student.academics.include? user.academic
      end
 
      # FIXME: can only create supervision members for own students.
      can :create, Supervision

      can :destroy, Supervision do |supervision|
        supervision.student.academics.include? user.academic
      end
    else
      can :read, [Academic, Student, Author]
    end

    # manage projects
    if user.role? "Project Manager"
      can [:manage, :index], [Author, Project, Direction, Examination, Venue, Slot, Booking]
    elsif user.role? :supervisor
      can :read, [Author, Project, Venue]

      can :show, Direction do |direction|
        direction.academic == user.academic
      end

      can :update, Direction do |direction|
        direction.open? and direction.academic == user.academic
      end

      can :show, Examination do |examination|
        examination.academic == user.academic
      end

      can :update, Examination do |examination|
        examination.open? and examination.academic == user.academic
      end

#      can :read, Direction
#      can :show, Examination
    end

    # manage courses
    if user.role? :supervisor
      can [:read, :edit, :create], Course
    end    

    # support staff can read 
    if user.role? :support
      can :read, [Academic, Student, Author, Room]
    end
  end
end
