module DashboardsHelper
  def total_income
    Transaction.where(category: "Income").sum(:amount)
  end

  def total_expenses
    Transaction.where(category: "Expense").sum(:amount)
  end

  def net_income
  	total_income - total_expenses
  end
end
