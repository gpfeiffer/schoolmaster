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

      can [:destroy, :accept], Proposal do |proposal| 
        proposal.academic == user.academic
      end
    end

    # director of graduate studies
    if user.role? "DoGS"
      can :manage, [Student, Supervision, Committee, Room]
    end

    # manage projects
    if user.role? "Project Manager"
      can :manage, [Author, Project, Direction, Examination, Venue, Slot, Booking, Enrolment, Proposal]
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

# comment out these 2 lines to hide project reports
#      can :read, Direction
#      can :show, Examination
    end

    # manage courses
    if user.role? :supervisor
      can [:read, :edit, :update, :create], Course
    else
      can :read, Course
    end    

    # manage lecture loads
    if user.role? :supervisor
      can :read, [Atom, Load, Molecule, Bond, Cohort, Instance]
    else
      can :read, Cohort
    end

    # support staff can read 
    if user.role? :support
      can :read, [Academic, Student, Author, Room, Venue]
      can :manage, [Load, Instance, Bond, Cohort, Molecule, Atom]
    end
  end
end
