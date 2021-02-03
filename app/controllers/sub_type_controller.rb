class SubTypeController < ApplicationController

    def create 
        @sub_type = SubType.new(sub_type_params)

        respond_to do |format|
            if @sub_type.save
                format.html { redirect_to root_path }
            else
                flash.now[:alert] = "Valores inválidos"
                format.json { render json: @sub_type.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        def sub_type_params
            params.require(:sub_type).permit(
                                        :title,
                                        :color,
                                        :movement_type_id
                                        )
        end
end
