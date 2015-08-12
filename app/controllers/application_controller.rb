class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_passing_marks, :set_mark_per_question
  def after_sign_in_path_for(resource)
  	if resource.email == "admin@admin.com"
  		response_sets_path
  	else	
  		home_index_path
  	end
  end

  def set_passing_marks
    @passing_marks = Setting.where(name: "passing_marks").first
  end

  def set_mark_per_question
    @mark_per_question = Setting.where(name: "mark_per_question").first
  end

end
