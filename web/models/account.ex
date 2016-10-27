defmodule CanvasAPI.Account do
  @moduledoc """
  A user account, representing one or more Slack users.
  """

  use CanvasAPI.Web, :model

  schema "accounts" do
    many_to_many :teams, CanvasAPI.Team, join_through: "users"
    has_many :oauth_tokens, CanvasAPI.OAuthToken
    has_many :users, CanvasAPI.User
    has_many :canvases, through: [:users, :canvases]

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
  end
end
