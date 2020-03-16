defmodule GelleiaApiWeb.Schema.Types.CategoryType do
  use Absinthe.Schema.Notation

  object :category_type do
    field(:id, :id)
    field(:name, :string)
  end
end
