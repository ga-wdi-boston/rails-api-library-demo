# frozen_string_literal: true

class BorrowersController < ApplicationController
  before_action :set_borrower, only: [:show, :update, :destroy]

  # GET /borrowers
  def index
    @borrowers = Borrower.all

    render json: @borrowers
  end

  # GET /borrowers/1
  def show
    render json: @borrower
  end

  # POST /borrowers
  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      render json: @borrower, status: :created
    else
      render json: @borrower.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /borrowers/1
  def update
    if @borrower.update(borrower_params)
      head :no_content
    else
      render json: @borrower.errors, status: :unprocessable_entity
    end
  end

  # DELETE /borrowers/1
  def destroy
    @borrower.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_borrower
    @borrower = Borrower.find(params[:id])
  end
  private :set_borrower

  # Only allow a trusted parameter "white list" through.
  def borrower_params
    params.require(:borrower).permit(:given_name, :family_name)
  end
  private :borrower_params
end
