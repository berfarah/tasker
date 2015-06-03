class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.limit(50).reverse_order
    @logs = @logs.where(instance: params[:instance_id]) if params[:instance_id]
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:severity, :message, :task_id)
    end
end
