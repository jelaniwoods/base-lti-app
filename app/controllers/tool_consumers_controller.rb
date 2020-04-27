class ToolConsumersController < ApplicationController
  before_action :set_tool_consumer, only: [:show, :edit, :update, :destroy]

  # GET /tool_consumers
  def index
    @tool_consumers = ToolConsumer.all
  end

  # GET /tool_consumers/1
  def show
  end

  # GET /tool_consumers/new
  def new
    @tool_consumer = ToolConsumer.new
  end

  # GET /tool_consumers/1/edit
  def edit
  end

  # POST /tool_consumers
  def create
    @tool_consumer = ToolConsumer.new(tool_consumer_params)

    if @tool_consumer.save
      redirect_to @tool_consumer, notice: 'Tool consumer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tool_consumers/1
  def update
    if @tool_consumer.update(tool_consumer_params)
      redirect_to @tool_consumer, notice: 'Tool consumer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tool_consumers/1
  def destroy
    @tool_consumer.destroy
    redirect_to tool_consumers_url, notice: 'Tool consumer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool_consumer
      @tool_consumer = ToolConsumer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tool_consumer_params
      params.require(:tool_consumer).permit(:instance_guid, :instance_name, :instance_description, :instance_url, :instance_contact_email)
    end
end
