class BatchImportsController < ApplicationController
  before_action :set_batch_import, only: [:show]

  # GET /batch_imports
  def index
    @batch_imports = BatchImport.all

    render json: @batch_imports
  end

  # GET /batch_imports/1
  def show
    return head :not_found unless @batch_import

    render json: @batch_import
  end

  # POST /batch_imports
  def create
    @batch_import = BatchImport.new(batch_import_params)

    if @batch_import.save
      render json: @batch_import, status: :created, location: @batch_import
    else
      render json: @batch_import.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_batch_import
    @batch_import = BatchImport.find_by(id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def batch_import_params
    params.require(:batch_import).permit(:name, :owner_name)
  end
end
