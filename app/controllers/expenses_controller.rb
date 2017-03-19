class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @expense.build_price
  end

  # GET /expenses/1/edit
  def edit
    @expense.build_price if @expense.price.nil?
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.price.total =  expense_params[:price_attributes][:total].to_f * 1000
    @expense.price.dolar_price =  expense_params[:price_attributes][:dolar_price].to_f * 1000
    #raise @expense.price.inspect.to_yaml
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    a = expense_params
    a[:price_attributes][:total] = expense_params[:price_attributes][:total].to_f * 1000
    a[:price_attributes][:dolar_price] = expense_params[:price_attributes][:dolar_price].to_f * 1000
    #raise a[:price_attributes].to_yaml
    respond_to do |format|
      if @expense.update(a)
        #raise @expense.price.inspect.to_yaml
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:name, :expense_type_id, :pay_type, :date_create, :hour_create, price_attributes: [:money, :total, :dolar_price])
    end
end
