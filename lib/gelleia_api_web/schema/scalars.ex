defmodule GelleiaApiWeb.Schema.Types.Scalars do

  ## from https://github.com/absinthe-graphql/absinthe/wiki/Scalar-Recipes
  @moduledoc """
  The UUID4 scalar type allows UUID4 compliant strings to be passed in and out.
  Requires `{ :ecto, ">= 0.0.0" }` package: https://github.com/elixir-ecto/ecto
  """
  use Absinthe.Schema.Notation

  alias Ecto.UUID

  scalar :uuid4, name: "UUID4" do
    description("""
    The `UUID4` scalar type represents UUID4 compliant string data, represented as UTF-8
    character sequences. The UUID4 type is most often used to represent unique
    human-readable ID strings.
    """)

    serialize(&encode/1)
    parse(&decode/1)
  end

  @spec decode(Absinthe.Blueprint.Input.String.t()) :: {:ok, term()} | :error
  @spec decode(Absinthe.Blueprint.Input.Null.t()) :: {:ok, nil}
  defp decode(%Absinthe.Blueprint.Input.String{value: value}) do
    UUID.cast(value)
  end

  defp decode(%Absinthe.Blueprint.Input.Null{}) do
    {:ok, nil}
  end

  defp decode(_) do
    :error
  end

  defp encode(value), do: value

  scalar :datetime do
    parse fn input ->
      case Timex.parse(input.value, "{ISO:Extended:Z}") do
        {:error, _reason} -> :error
        result -> result
      end
    end
    serialize &Timex.format!(&1, "{ISO:Extended:Z}")
  end
end
