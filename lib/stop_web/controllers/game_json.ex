defmodule StopWeb.GameJSON do
  alias Stop.Games.Game

  @doc """
  Renders a list of games.
  """
  def index(%{games: games}) do
    %{data: for(game <- games, do: data(game))}
  end

  @doc """
  Renders a single game.
  """
  def show(%{game: game}) do
    %{data: data(game)}
  end

  defp data(%Game{} = game) do
    s =
      Hashids.new(
        salt: "sg2023",
        min_len: 5
      )

    %{
      id: game.id,
      code: Hashids.encode(s, game.id),
      max_rounds: game.max_rounds
    }
  end
end
