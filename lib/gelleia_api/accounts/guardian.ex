defmodule GelleiaApi.Accounts.Guardian do
  use Guardian, otp_app: :gelleia_api
  alias GelleiaApi.Accounts

  def subject_for_token(user, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    sub = to_string(user  .id)
    {:ok, sub}
  end
  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
   user = claims["sub"]
   |> Accounts.get_user!()
   {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end