defmodule Dbay.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dbay.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        accent_color: 42,
        age: 42,
        avatar: "some avatar",
        discriminator: 42,
        email: "some email",
        name: "some name",
        token: "some token",
        username: "some username",
        verified: true
      })
      |> Dbay.Accounts.create_user()

    user
  end
end
