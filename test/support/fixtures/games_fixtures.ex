defmodule Stop.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Stop.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        code: "some code",
        max_rounds: 42
      })
      |> Stop.Games.create_game()

    game
  end
end
