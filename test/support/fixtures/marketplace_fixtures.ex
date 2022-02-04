defmodule Dbay.MarketplaceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dbay.Marketplace` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: 42
      })
      |> Dbay.Marketplace.create_post()

    post
  end

  @doc """
  Generate a merchant.
  """
  def merchant_fixture(attrs \\ %{}) do
    {:ok, merchant} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        username: "some username"
      })
      |> Dbay.Marketplace.create_merchant()

    merchant
  end
end
