defmodule Dbay.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :token, :string
      add :username, :string
      add :discriminator, :integer
      add :accent_color, :integer
      add :verified, :boolean, default: false, null: false
      add :avatar, :string

      timestamps()
    end
  end
end
