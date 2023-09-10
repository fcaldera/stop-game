import React from "react";
import { useLoaderData, useParams } from "react-router-dom";
import { createGame, getGame } from "../api";

export async function loader({ params }) {
  const game = await getGame(params.id);

  if (!game) {
    throw new Response("", {
      status: 404,
      statusText: "Game Not Found",
    });
  }

  return { game };
}

export default function Game() {
  const { game } = useLoaderData();

  return (
    <div>
      <h2>
        <code>{game.id}</code>
      </h2>
      <button>Join</button>
    </div>
  );
}
