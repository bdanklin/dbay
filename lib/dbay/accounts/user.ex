defmodule Dbay.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :accent_color, :integer
    field :age, :integer
    field :avatar, :string
    field :discriminator, :integer
    field :email, :string
    field :name, :string
    field :token, :string
    field :username, :string
    field :verified, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :email, :token, :username, :discriminator, :accent_color, :verified, :avatar])
    |> validate_required([:name, :age, :email, :token, :username, :discriminator, :accent_color, :verified, :avatar])
  end
end
