defmodule CrossValidator.Utils do
  require Logger

  def parameters_as_atom_map(args = %{}, parameters) do
    case Map.take(args, parameters) do
      filtered_args = %{} ->
        atomize_keys(filtered_args)

      fallback ->
        fallback
    end
  end

  # Structs don't do enumerable and anyway the keys are already
  # atoms
  def atomize_keys(struct = %{__struct__: _}) do
    struct
  end

  def atomize_keys(map = %{}) do
    map
    |> Enum.map(fn {k, v} -> {atomize_key(k), atomize_keys(v)} end)
    |> Enum.into(%{})
  end

  # Walk the list and atomize the keys of
  # of any map members
  def atomize_keys([head | rest]) do
    [atomize_keys(head) | atomize_keys(rest)]
  end

  def atomize_keys(not_a_map) do
    not_a_map
  end

  defp atomize_key(k) when is_bitstring(k), do: String.to_atom(k)
  defp atomize_key(k), do: k

  def keys_to_atom([k, v]), do: [as_atom(k), v]
  def keys_to_atom({k, v}), do: {as_atom(k), v}
  def keys_to_atom(kv), do: kv

  def as_atom(value) when is_bitstring(value), do: String.to_atom(value)
  def as_atom(value), do: value
end
