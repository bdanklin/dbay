defmodule Dbay.Marketplace.Merchant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Dbay.Marketplace.Post

  schema "users" do
    field :avatar, :string
    field :username, :string

    has_many :posts, Post
    timestamps()
  end

  @doc false
  def changeset(merchant, attrs) do
    merchant
    |> cast(attrs, [:username, :avatar])
    |> validate_required([:username, :avatar])
  end
end
