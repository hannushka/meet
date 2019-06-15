defmodule MeetApi.Accounts do
  alias MeetApi.Repo
  alias MeetApi.Accounts.User

  defmacro type, do: "User"

  def list_users(bolt_sips_conn) do
    Repo.get_nodes(bolt_sips_conn, type())
  end

  def get_user(bolt_sips_conn, id) do
    Repo.get_node_from_id(bolt_sips_conn, type(), id)
  end

  def create_user(bolt_sips_conn, attrs \\ %{}) do
    changeset = User.changeset(%User{}, attrs)

    if changeset.valid? do
      user = Ecto.Changeset.apply_changes(changeset)
      Repo.create_node(bolt_sips_conn, type(), user)
    else
      {:error, "Invalid user"}
    end
  end

  def authenticate_user(bolt_sips_conn, email, password) do
    case Repo.get_node(bolt_sips_conn, type(), %{email: email}) do
      {:ok, user} -> verify_password(user, password)
      :error -> :error
    end
  end

  defp verify_password(user, password) do
    if Bcrypt.verify_pass(password, user.password) do
      {:ok, user}
    else
      :error
    end
  end
end
