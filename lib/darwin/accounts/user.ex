defmodule Darwin.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Darwin.Accounts.User
  alias Comeonin.Bcrypt

  schema "users" do
    field :is_active, :boolean, default: false
    field :is_deleted, :boolean, default: false
    field :login_name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:login_name, :password, :is_active, :is_deleted])
    |> unique_constraint(:login_name)
    |> validate_required([:login_name, :password, :is_active, :is_deleted])
    |> update_change(:password, &Bcrypt.hashpwsalt/1)
  end
end
