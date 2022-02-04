defmodule Dbay.Marketplace.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Dbay.Marketplace.Merchant

  schema "posts" do
    field :description, :string
    field :name, :string
    field :price, :integer

    belongs_to :merchant, Merchant

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :description, :price, :merchant_id])
    |> validate_required([:name, :description, :price, :merchant_id])
  end
end
