class ResponseSetsController < ApplicationController
  before_action :set_response_set, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /surveys
  # GET /surveys.json
  def index
    @responses = ResponseSet.all
    @res = Response.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "result",
               template: 'response_sets/show.pdf.erb'
      end
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @response_set = current_user.response_sets.create
    params[:response_set].each do |question, answer|
      unless(question == "survey_id" || question == "responded")
        response = @response_set.responses.build(question_id: question, answer_id: answer)
        response.save(validate: false)
      end
    end

    redirect_to home_show_path
    # redirect_to response_set_path(@response_set)
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @response_set.destroy
    respond_to do |format|
      format.html { redirect_to response_sets_path, notice: 'Test was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response_set
      @response_set = ResponseSet.find(params[:id])
    end

end
