class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :update]

  # GET /uploads/1
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # POST /uploads
  def create
    @upload = Upload.new(post_upload_params)
    if @upload.save
      redirect_to @upload, notice: 'Upload was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /uploads/1
  def update
    if @upload.update(post_upload_params)
      redirect_to @upload, notice: 'Upload attachment was successfully updated.'
    end
  end

  private
    def set_upload
      @upload = Upload.find(params[:id])
    end

    def post_upload_params
      params.require(:upload).permit(:name)
    end
end
