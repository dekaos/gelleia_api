defmodule GelleiaApiWeb.Schema.Types.PaymentType do
  use Absinthe.Schema.Notation

  object :payment_type do
    field(:id, :id)
    field(:transaction_id, :string)
    field(:user_id, :string)
    field(:status, :string)
    field(:value, :string)
  end
end
