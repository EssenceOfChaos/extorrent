defmodule Extorrent.Cache do
  @moduledoc """
  Behaviour specification for Extorrent Client cache implementations
  """
  @type reason :: String.t()
  @type key :: tuple()
  @type cache_ref :: atom() | String.t() | pid()

  @doc """
  Creates a new cache
  """
  @callback new(cache_ref, [any()]) :: {:ok, pid} | {:error, reason}

  @doc """
  Retrieves value for a given key from cache,
  returns error if the given key does not exist
  """
  @callback get(cache_ref, key) :: {:ok, any()} | {:error, :not_found}

  @doc """
  Sets value for a given key,
  returns error if the given key could not be set
  """
  @callback set(cache_ref, key, value :: any()) :: :ok | {:error, reason}

  @doc """
  Returns all the contents of the given cache
  """
  @callback get_all(cache_ref) :: {:ok, [tuple()]} | {:error, reason}

  @doc """
  Deletes given key from cache
  """
  @callback delete(cache_ref, key) :: :ok

  @doc """
  Returns configuration of cache
  """
  @callback get_configuration(cache_ref) :: {:ok, any()} | {:error, reason}
end
