class MovementTypeController < ApplicationController

    def create 
        @movement_type = MovementType.new(movement_type_params)

        respond_to do |format|
            if @movement_type.save
                format.html { redirect_to root_path }
            else
                format.html { render :new }
                flash.now[:alert_type] = "Valores inválidos"
                format.json { render json: @movement_type.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        def movement_type_params
            params.require(:movement_type).permit(
                                        :title,
                                        :color,
                                        :pointer_type,
                                        :user_id
                                        )
        end
end
