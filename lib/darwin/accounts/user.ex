defmodule Darwin.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :is_active, :boolean, default: false
    field :is_deleted, :boolean, default: false
    field :login_name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:login_name, :password, :is_active, :is_deleted])
    |> validate_required([:login_name, :password, :is_active, :is_deleted])
  end
end
