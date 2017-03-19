json.extract! expense, :id, :name, :expense_type_id, :date_create, :hour_create, :created_at, :updated_at
json.url expense_url(expense, format: :json)
