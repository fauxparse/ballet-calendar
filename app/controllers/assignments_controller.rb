class AssignmentsController < ApplicationController
  def create
    teacher_id = assignment_params[:teacher_id] || current_user.id
    assignment = day.assignments.create!(teacher_id: teacher_id)
    respond_to do |format|
      format.json { render json: serialized_teacher(assignment.teacher) }
    end
  end

  def destroy
    assignment = day.assignments.find_by(teacher_id: params[:id])
    assignment&.destroy
    head :ok
  end

  private

  def day
    @day ||= Day.find_or_create_by!(date: params[:day_id])
  end

  def assignment_params
    return {} unless params[:assignment].present?
    params.require(:assignment).permit(:teacher_id)
  end

  def serialized_teacher(teacher)
    TeacherSerializer.new(teacher, current_user).call
  end
end
