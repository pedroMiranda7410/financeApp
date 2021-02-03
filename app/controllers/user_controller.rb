class UserController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                format.html { redirect_to login_path }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
        @user = User.find(session[:user_id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
        params.require(:user).permit(
                                    :individual,
                                    :name,
                                    :cpf, 
                                    :email,
                                    :phone,
                                    :birthdate,
                                    :password, 
                                    :password_confirmation
                                    )
        end
end
