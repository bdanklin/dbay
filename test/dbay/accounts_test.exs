defmodule Dbay.AccountsTest do
  use Dbay.DataCase

  alias Dbay.Accounts

  describe "users" do
    alias Dbay.Accounts.User

    import Dbay.AccountsFixtures

    @invalid_attrs %{accent_color: nil, age: nil, avatar: nil, discriminator: nil, email: nil, name: nil, token: nil, username: nil, verified: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{accent_color: 42, age: 42, avatar: "some avatar", discriminator: 42, email: "some email", name: "some name", token: "some token", username: "some username", verified: true}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.accent_color == 42
      assert user.age == 42
      assert user.avatar == "some avatar"
      assert user.discriminator == 42
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.token == "some token"
      assert user.username == "some username"
      assert user.verified == true
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{accent_color: 43, age: 43, avatar: "some updated avatar", discriminator: 43, email: "some updated email", name: "some updated name", token: "some updated token", username: "some updated username", verified: false}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.accent_color == 43
      assert user.age == 43
      assert user.avatar == "some updated avatar"
      assert user.discriminator == 43
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.token == "some updated token"
      assert user.username == "some updated username"
      assert user.verified == false
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
