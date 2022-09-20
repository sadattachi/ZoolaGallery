class ArtWorkController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  before_action :set_art_work, only: %i[destroy]

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

  def destroy
    if current_user.id == @art_work.user_id
      @art_work.destroy
      redirect_to artist_art_works_path(current_user), notice: 'Artwork was successfully deleted!'
    end
  end

  private

  def set_art_work
    @art_work = ArtWork.find(params[:id])
  end

  def art_work_params
    params.require(:art_work).permit(:title, :user_id, :attachment)
  end
end
