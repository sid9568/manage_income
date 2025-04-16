class TransactionsController < ApplicationController
before_action :set_transaction, only: [:edit, :update, :destroy]

  def index
    @transactions = Transaction.all.order(updated_at: :desc, date: :desc)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_path
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:title, :amount, :category, :date, :description)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

end
