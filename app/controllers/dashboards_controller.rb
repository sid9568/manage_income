class DashboardsController < ApplicationController
  def index
    @income_data = Transaction.where(category: "Income").group_by_day(:created_at).sum(:amount)
    @expense_data = Transaction.where(category: "Expense").group_by_day(:created_at).sum(:amount)
  end

end
