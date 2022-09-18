class ArtWorkController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def index
    @art_works = ArtWork.where(user_id: params[:id].to_i)
  end

  def new
    @art_work = current_user.art_works.build
  end

  def create
    @art_work = current_user.art_works.build(art_work_params)
    if @art_work.save
      redirect_to root_path, notice: 'Art work was successfully added!'
    else
      redirect_to root_path, alert: 'Unexpected error occurred!'
    end
  end

  private

  def art_work_params
    params.require(:art_work).permit(:title, :user_id, :attachment)
  end
end
