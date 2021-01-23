defmodule DarwinOms.Stores.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :is_active, :boolean, default: false
    field :is_deleted, :boolean, default: false
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:username, :password, :is_active, :is_deleted])
    |> unique_constraint(:username)
    |> validate_required([:username, :password, :is_active, :is_deleted])
  end
end
