class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: 'Resource was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  def teacher_backdoor
    @user = User.find_by(
      # from dev:prime data
      id_from_tc: "bd815e718b9d924bdd6ceb708bc2c6eb4ab0754b",
    )
    set_back_door_attributes

    redirect_to resource_url(@resource)
  end

  def student_backdoor
    @user = User.find_by(
      # from dev:prime data
      id_from_tc: "03bdb94e0a8fc857ef71280eaf0919199a841bc0",
    )
    set_back_door_attributes

    redirect_to resource_url(@resource)
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:resource).permit(:id_from_tc, :title, :context_id)
  end

  def set_back_door_attributes
    reset_session
    # from seed data
    @context = Context.find_by(
      # from seed data
      id_from_tc: "4a91e348a7026222b98bd2af87be0aeee085eb0f",
    )
    # from seed data
    @resource = Resource.find_by(
      # from seed data
      id_from_tc: "fa070692257fc1b67ce7461e18cecd418a5286d5",
    )
    @enrollment = Enrollment.find_by(context: @context, user: @user)

    @submission = Submission.find_by(
      enrollment: @enrollment,
      resource: @resource,
    )

    session[:enrollment_id] = @enrollment.id
    session[:launch_id] = @enrollment.launches.last.id
    session[:resource_id] = @resource.id
    session[:submission_id] = @submission.try(:id)
  end
end
