# frozen_string_literal: true

class LoansController < ApplicationController
  before_action :set_loan, only: [:update, :destroy]

  def index
    @loans = Loan.all

    render json: @loans
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  def update
    if @loan.update(loan_params)
      head :no_content
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @loan.destroy

    head :no_content
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end
  private :set_loan

  def loan_params
    params.require(:loan).permit(:borrower_id, :book_id, :due_on)
  end
  private :loan_params
end
