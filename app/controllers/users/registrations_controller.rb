module Users
  # Manages devise user registration
  class RegistrationsController < Devise::RegistrationsController
    after_action :default_image, only: :create

    private

    def default_image
      if params[:user][:avatar].nil?
        @user.avatar.store!(File.open(File.join(Rails.root, 'public/default.png')))
        @user.save!
      end
    end
  end
end
