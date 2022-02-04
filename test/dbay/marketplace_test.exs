defmodule Dbay.MarketplaceTest do
  use Dbay.DataCase

  alias Dbay.Marketplace

  describe "posts" do
    alias Dbay.Marketplace.Post

    import Dbay.MarketplaceFixtures

    @invalid_attrs %{description: nil, name: nil, price: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Marketplace.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Marketplace.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{description: "some description", name: "some name", price: 42}

      assert {:ok, %Post{} = post} = Marketplace.create_post(valid_attrs)
      assert post.description == "some description"
      assert post.name == "some name"
      assert post.price == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Marketplace.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", price: 43}

      assert {:ok, %Post{} = post} = Marketplace.update_post(post, update_attrs)
      assert post.description == "some updated description"
      assert post.name == "some updated name"
      assert post.price == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Marketplace.update_post(post, @invalid_attrs)
      assert post == Marketplace.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Marketplace.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Marketplace.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Marketplace.change_post(post)
    end
  end

  describe "users" do
    alias Dbay.Marketplace.Merchant

    import Dbay.MarketplaceFixtures

    @invalid_attrs %{avatar: nil, username: nil}

    test "list_users/0 returns all users" do
      merchant = merchant_fixture()
      assert Marketplace.list_users() == [merchant]
    end

    test "get_merchant!/1 returns the merchant with given id" do
      merchant = merchant_fixture()
      assert Marketplace.get_merchant!(merchant.id) == merchant
    end

    test "create_merchant/1 with valid data creates a merchant" do
      valid_attrs = %{avatar: "some avatar", username: "some username"}

      assert {:ok, %Merchant{} = merchant} = Marketplace.create_merchant(valid_attrs)
      assert merchant.avatar == "some avatar"
      assert merchant.username == "some username"
    end

    test "create_merchant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Marketplace.create_merchant(@invalid_attrs)
    end

    test "update_merchant/2 with valid data updates the merchant" do
      merchant = merchant_fixture()
      update_attrs = %{avatar: "some updated avatar", username: "some updated username"}

      assert {:ok, %Merchant{} = merchant} = Marketplace.update_merchant(merchant, update_attrs)
      assert merchant.avatar == "some updated avatar"
      assert merchant.username == "some updated username"
    end

    test "update_merchant/2 with invalid data returns error changeset" do
      merchant = merchant_fixture()
      assert {:error, %Ecto.Changeset{}} = Marketplace.update_merchant(merchant, @invalid_attrs)
      assert merchant == Marketplace.get_merchant!(merchant.id)
    end

    test "delete_merchant/1 deletes the merchant" do
      merchant = merchant_fixture()
      assert {:ok, %Merchant{}} = Marketplace.delete_merchant(merchant)
      assert_raise Ecto.NoResultsError, fn -> Marketplace.get_merchant!(merchant.id) end
    end

    test "change_merchant/1 returns a merchant changeset" do
      merchant = merchant_fixture()
      assert %Ecto.Changeset{} = Marketplace.change_merchant(merchant)
    end
  end
end
