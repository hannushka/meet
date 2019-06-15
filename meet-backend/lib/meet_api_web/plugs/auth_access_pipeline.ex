defmodule MeetApiWeb.Plugs.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :meet_api

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource, ensure: true)
end
