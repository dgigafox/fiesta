defmodule FiestaWeb.UserSessionControllerTest do
  use FiestaWeb.ConnCase

  describe "new/2" do
    test "displays inputs for email and password", %{conn: conn} do
      conn = get(conn, Routes.login_path(conn, :new))

      assert html_response(conn, 200) =~ "name=\"user[email]\""
      assert html_response(conn, 200) =~ "name=\"user[password]\""
    end
  end

  describe "create/2" do
    setup do
      user = insert(:user)

      {:ok, user: user, params: %{email: user.email, password: user.password}}
    end

    test "redirects to dashboard if successful", %{conn: conn, params: params} do
      conn = post(conn, Routes.login_path(conn, :create), user: params)

      assert redirected_to(conn) == Routes.dashboard_path(conn, :index)
    end

    test "display error flash if not successful", %{conn: conn} do
      conn = post(conn, Routes.login_path(conn, :create), user: %{})

      assert get_flash(conn, :error) == "Invalid email or password"
    end
  end

  describe "delete/2" do
    test "redirects to homepage if successful", %{conn: conn} do
      conn = log_in_user(conn, insert(:user))
      conn = delete(conn, Routes.logout_path(conn, :delete))

      assert get_flash(conn, :info) == "Logged out successfully"
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end
  end
end
