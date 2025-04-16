class Transaction < ApplicationRecord
  scope :recent, -> { order(updated_at: :desc, date: :desc) }
  scope :from_date, ->(start_date) {
    where("date >= ?", start_date) if start_date.present?
  }
  scope :to_date, ->(end_date) {
    where("date <= ?", end_date) if end_date.present?
  }
  scope :by_category, ->(cat) {
    where(category: cat) if cat.present? && cat != "All"
  }
  
end