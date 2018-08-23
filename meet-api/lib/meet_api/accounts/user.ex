defmodule MeetApi.Accounts.User do
    use Ecto.Schema
    import Ecto.Changeset

    schema "users" do
        field :email, :string
        field :lastname, :string
        field :name, :string
        field :password, :string
    end 

    def row_to_struct(%Bolt.Sips.Types.Node{id: id, labels: _, properties: props}) do
        props = Enum.map(props, fn {k, v} -> {String.to_atom(k), v} end)
        struct(__MODULE__, props ++ [id: id])
    end

    @doc false
    def changeset(user, attrs) do
        user
        |> cast(attrs, [:email, :name, :lastname, :password])
        |> validate_required([:email, :name, :lastname, :password])
        |> put_password_hash()
    end

    defp put_password_hash(
                %Ecto.Changeset{
                valid?: true, changes: %{password: password}
                } = changeset
            ) do
        change(changeset, password: Bcrypt.hash_pwd_salt(password))
    end

    defp put_password_hash(changeset) do
        changeset
    end
end
