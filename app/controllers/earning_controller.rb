class EarningController < ApplicationController

    def create 
        @value = params['earning']['value'].to_s.gsub(/\./,"").gsub(/\,/,".").to_f
        @earning = Earning.new(earning_params)
        @earning.value = @value
        
        respond_to do |format|
            if @earning.value > 0 && @earning.save
                format.html { redirect_to root_path }
            else
                flash.now[:alert] = "Valores inválidos"
                format.json { render json: @earning.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        def earning_params
            params.require(:earning).permit(
                                            :title,
                                            :date,   
                                            :value,
                                            :description,
                                            :movement_type_id,
                                            :sub_type_id,
                                            :user_id
                                            )
        end
end
