defmodule MeetApi.AccountsTest do
    use MeetApiWeb.ConnCase
    use MeetApi.Neo4jConnCase

    alias MeetApi.Accounts
    alias MeetApi.Accounts.User

    @valid_attrs %{email: "some email", lastname: "some lastname", name: "some name", password: "some password"}
    @invalid_attrs %{email: nil, lastname: nil, name: nil, password: nil}

    test "list_users/0 returns all users", %{bolt_sips_conn: bolt_sips_conn} do
        {:ok, users} = Accounts.list_users(bolt_sips_conn)
        assert users == []
    end

    test "create_user/1 with valid data creates a user", %{bolt_sips_conn: bolt_sips_conn} do
        assert {:ok, %User{} = user} = Accounts.create_user(bolt_sips_conn, @valid_attrs)
        assert user.email == "some email"
        assert user.lastname == "some lastname"
        assert user.name == "some name"
        assert Bcrypt.verify_pass("some password", user.password)
    end

    test "create_user/1 with invalid data returns error changeset", %{bolt_sips_conn: bolt_sips_conn} do
        assert {:error, "Invalid user"} = Accounts.create_user(bolt_sips_conn, @invalid_attrs)
    end

    test "get_user/1 returns the user with given id", %{bolt_sips_conn: bolt_sips_conn} do
        {:ok, user} = Accounts.create_user(bolt_sips_conn, @valid_attrs)
        {:ok, user2} = Accounts.get_user(bolt_sips_conn, user.id)
        assert user == user2
    end

    test "authenticate_user/2 authenticates valid user credentials", %{bolt_sips_conn: bolt_sips_conn} do
        {:ok, _} = Accounts.create_user(bolt_sips_conn, @valid_attrs)
        assert {:ok, _} = Accounts.authenticate_user(bolt_sips_conn, @valid_attrs.email, @valid_attrs.password)
    end

    test "authenticate_user/2 refuses invalid user credentials", %{bolt_sips_conn: bolt_sips_conn} do
        {:ok, _} = Accounts.create_user(bolt_sips_conn, @valid_attrs)
        assert :error = Accounts.authenticate_user(bolt_sips_conn, @valid_attrs.email, "")
    end
end