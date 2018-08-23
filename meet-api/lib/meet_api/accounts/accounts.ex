defmodule MeetApi.Accounts do
  alias MeetApi.Repo
  alias MeetApi.Accounts.User

  defmacro type, do: "User"

  def list_users do
    Repo.get_nodes(Bolt.Sips.conn, type())
  end
 
  def get_user(id) do
    Repo.get_node(Bolt.Sips.conn, type(), id)
  end

  def create_user(attrs \\ %{}) do
    changeset = User.changeset(%User{}, attrs)
    if changeset.valid? do
      user = Ecto.Changeset.apply_changes(changeset)
      Repo.create_node(Bolt.Sips.conn, type(), user)
    else
      :error
    end
  end

  # @doc """
  # Updates a user.

  # ## Examples

  #     iex> update_user(user, %{field: new_value})
  #     {:ok, %User{}}

  #     iex> update_user(user, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_user(%User{} = user, attrs) do
  #   user
  #   |> User.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a User.

  # ## Examples

  #     iex> delete_user(user)
  #     {:ok, %User{}}

  #     iex> delete_user(user)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_user(%User{} = user) do
  #   Repo.delete(user)
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking user changes.

  # ## Examples

  #     iex> change_user(user)
  #     %Ecto.Changeset{source: %User{}}

  # """
  # def change_user(%User{} = user) do
  #   User.changeset(user, %{})
  # end
end
