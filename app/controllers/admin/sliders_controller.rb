class Admin::SlidersController < AdminController
  expose :sliders, -> { Slider.order(:position) }
  expose :slider

  before_action :setup, only: [:index]

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    if slider.save
      result = { status: :success, slider: {id: slider.id} }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def edit
  end

  def update
    if slider.update slider_params
      redirect_to edit_admin_slider_path(slider), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    if slider.destroy
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def update_position
    photo_params = params[:slider]
    if sliders.update photo_params.keys, photo_params.values
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  private
  def slider_params
    params.require(:slider).permit(:image, :url, :position)
  end

  def setup
    gon.admin_sliders_path = admin_sliders_path
    gon.update_position_admin_sliders_path = update_position_admin_sliders_path
  end
end
