defmodule GelleiaApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(GelleiaApiWeb.Schema.Types.UserType)
  import_types(GelleiaApiWeb.Schema.Types.TeamType)
end
