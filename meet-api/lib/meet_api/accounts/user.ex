defmodule MeetApi.Accounts.User do
  use Ecto.Schema
#   import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :lastname, :string
    field :name, :string
    field :is_active, :boolean, default: false
    field :password_hash, :string
    field :password, :string, virtual: true
  end

def row_to_struct(node = %Bolt.Sips.Types.Node{id: id, labels: [type | _], properties: props}) do
    props = Enum.map(props, fn {k, v} -> {String.to_atom(k), v} end)
    struct(__MODULE__, props)
end

#   @doc false
#   def changeset(user, attrs) do
#     user
#     |> cast(attrs, [:email, :name, :lastname, :is_active, :password])
#     |> validate_required([:email, :name, :lastname, :is_active, :password])
#     |> unique_constraint(:email)
#     |> put_password_hash()
#   end

#   defp put_password_hash(
#          %Ecto.Changeset{
#            valid?: true, changes: %{password: password}
#          } = changeset
#        ) do
#     change(changeset, password_hash: Bcrypt.hash_pwd_salt(password))
#   end

#   defp put_password_hash(changeset) do
#     changeset
#   end
end
