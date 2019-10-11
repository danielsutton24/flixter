class LessonsController < ApplicationController
  before_action :authenticate_user!
  
  def require_authorized_for_current_lesson
    unless current_user.enrolled_in?(current_lesson.section.course)
      redirect_to current_lesson.section.course, alert: 'You must be enrolled to view course content'
    end
  end
  

  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
