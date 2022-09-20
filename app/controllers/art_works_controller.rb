class ArtWorksController < ApplicationController
  before_action :authenticate_user!, only: %i[new update edit destroy]
  before_action :set_art_work, only: %i[update edit destroy check_user]
  before_action :check_user, only: %i[update edit destroy]

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

  def edit; end

  def update
    if @art_work.update(art_work_params)
      redirect_to artist_art_works_path(current_user), notice: 'Artwork was successfully updated!'
    else
      redirect_to artist_art_works_path(current_user), alert: 'Unexpected error occurred!'
    end
  end

  def destroy
    return unless current_user.id == @art_work.user_id

    @art_work.destroy
    redirect_to artist_art_works_path(current_user), notice: 'Artwork was successfully deleted!'
  end

  private

  def set_art_work
    @art_work = ArtWork.find(params[:id])
  end

  def art_work_params
    params.require(:art_work).permit(:title, :user_id, :attachment)
  end

  def check_user
    return if current_user.id == @art_work.user_id

    redirect_to root_path, alert: "Cannot update or delete other user's artwork"
  end
end
