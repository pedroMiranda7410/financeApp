class ExpenseController < ApplicationController

    def create 
        @value = params['expense']['value'].to_s.gsub!(/\./,"").gsub!(/\,/,".").to_f
        @expense = Expense.new(expense_params)
        @expense.value = @value

        respond_to do |format|
            if @expense.value > 0 && @expense.save
                format.html { redirect_to root_path }
            else
                flash.now[:alert] = "Valores inválidos"
                format.json { render json: @expense.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        def expense_params
            params.require(:expense).permit(
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
