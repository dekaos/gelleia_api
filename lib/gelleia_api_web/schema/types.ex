defmodule GelleiaApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(GelleiaApiWeb.Schema.Types.UserType)
  import_types(GelleiaApiWeb.Schema.Types.TeamType)
  import_types(GelleiaApiWeb.Schema.Types.TaskType)
  import_types(GelleiaApiWeb.Schema.Types.PaymentType)
end
