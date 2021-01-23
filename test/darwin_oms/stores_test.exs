defmodule DarwinOms.StoresTest do
  use DarwinOms.DataCase

  alias DarwinOms.Stores

  describe "accounts" do
    alias DarwinOms.Stores.Account

    @valid_attrs %{is_active: true, is_deleted: true, password: "some password", username: "some username"}
    @update_attrs %{is_active: false, is_deleted: false, password: "some updated password", username: "some updated username"}
    @invalid_attrs %{is_active: nil, is_deleted: nil, password: nil, username: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stores.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Stores.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Stores.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Stores.create_account(@valid_attrs)
      assert account.is_active == true
      assert account.is_deleted == true
      assert account.password == "some password"
      assert account.username == "some username"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stores.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Stores.update_account(account, @update_attrs)
      assert account.is_active == false
      assert account.is_deleted == false
      assert account.password == "some updated password"
      assert account.username == "some updated username"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Stores.update_account(account, @invalid_attrs)
      assert account == Stores.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Stores.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Stores.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Stores.change_account(account)
    end
  end
end
