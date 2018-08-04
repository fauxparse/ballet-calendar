class TeacherSerializer < Primalize::Single
  attributes(
    id: integer,
    name: string,
    avatar: string,
    current: boolean
  )

  def initialize(teacher, current_user)
    super(teacher)
    @current_user = current_user
  end

  def current
    object.id == @current_user.id
  end
end
