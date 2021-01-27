defmodule Darwin.Accounts.UserAdmin do

    def popular?(p) do
      if (p.popular), do: "✅", else: "❌"
    end
  
    def index(_) do
      [
        login_name: nil,
        is_active: nil,
        is_deleted: nil
      ]
    end
  end