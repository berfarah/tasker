class InstancesController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy]

  # GET /instances
  # GET /instances.json
  def index
    @instances = Instance.all.where(task: params[:task_id])
  end

  # GET /instances/1
  # GET /instances/1.json
  def show
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params.require(:instance).permit(:finished_at, :failed, :task_id)
    end
end
