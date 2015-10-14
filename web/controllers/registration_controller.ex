defmodule Blog.RegistrationController do
  use Blog.Web, :controller
  alias Blog.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      # save new user and sign them in
      {:ok, user} = Blog.Registration.create(changeset, Blog.Repo)
      conn
      |> put_session(:current_user, user.id)
      |> put_flash(:info, "Your account was created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end
end
