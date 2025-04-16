class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.order(date: :desc)
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

  def show
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:title, :amount, :category, :date, :description)
  end

end
