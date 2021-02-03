class StackController < ApplicationController
    before_action :authenticate
    include ActionView::Helpers::NumberHelper
    
    def index
        if current_user.individual == true
            @array = current_user.name.strip.split(/\s+/)
            @user_name = @array.first + ' ' + @array.last
        else
            @user_name = current_user.name
        end

        @annual_earnings = 0.0
        @monthly_earnings = 0.0
        @monthly_expenses = 0.0
        @total_liquido_earnings = 0.0

        if current_user.earnings.length > 0
            current_user.earnings.each do |e|
                if e.date.year == current_date.year
                    @annual_earnings = @annual_earnings + e.value
                    if e.date.month == current_date.month
                        @monthly_earnings = @monthly_earnings + e.value
                    end
                end
            end
        end
        @print_annual_earnings = number_to_currency(@annual_earnings, unit: "", separator: ",", delimiter: ".")
        @print_monthly_earnings = number_to_currency(@monthly_earnings, unit: "", separator: ",", delimiter: ".")

        if current_user.expenses.length > 0
            current_user.expenses.each do |e|
                if e.date.month == current_date.month
                    @monthly_expenses = @monthly_expenses + e.value
                end
            end
        end
        @print_monthly_expenses = number_to_currency(@monthly_expenses, unit: "", separator: ",", delimiter: ".")

        @total_liquido_earnings = @monthly_earnings - @monthly_expenses

        @print_total_liquido_earnings = number_to_currency(@total_liquido_earnings, unit: "", separator: ",", delimiter: ".")

        if @total_liquido_earnings < 0
            @expense_percentage = '100'
        else
            @expense_percentage = '%.2f' % (@monthly_expenses/@monthly_earnings * 100)
        end
    end

    def callback
        @type_id = params[:type_id] != nil ? params[:type_id].to_i : 0
        @type_name = params[:type_name]

        respond_to do |format|
            if params[:sub_type_radio] != "true"
                format.js { render "stack/callback.js.erb", locals: { radioButtonSubType: false, movementTypeId: @type_id , movementTypeTitle: @type_name}}
            else
                format.js { render "stack/callback.js.erb", locals: { radioButtonSubType: true, movementTypeId: @type_id , movementTypeTitle: @type_name}}
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
                                    :name, 
                                    :cpf, 
                                    :email,
                                    :phone,
                                    :birthdate
                                    )
        end
end
