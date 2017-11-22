class Admin::SummernoteUploadsController < ApplicationController

  def create
    @upload = SummernoteUpload.new(upload_params)
    @upload.save

    respond_to do |format|
      format.json { render json: { url: @upload.image.url } }
    end
  end

  private
  def upload_params
    params.require(:summernote_upload).permit(:image, :product_id)
  end
end
