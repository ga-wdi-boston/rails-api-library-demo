class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all

    render json: @loans
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    render json: @loan
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    @loan = Loan.find(params[:id])

    if @loan.update(loan_params)
      head :no_content
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy

    head :no_content
  end

  private

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:author_id, :book_id, :date)
    end
end
