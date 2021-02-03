class SessionController < ApplicationController

    def login
        if current_user
            redirect_to root_path
        end
    end

    def create_session
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Conectado com sucesso!'
        else
          flash.now[:alert] = "E-mail/Senha inválido"
          render "login"
        end
    end

    def logout
        session[:user_id] = nil
  
        redirect_to login_path, notice: "Desconectado com sucesso!"
    end
end
