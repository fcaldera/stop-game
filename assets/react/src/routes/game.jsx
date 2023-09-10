import React from "react";
import { useLoaderData, useParams } from "react-router-dom";

export default function Game() {
  const game = useLoaderData();

  return (
    <div>
      <h2>
        <code>{game.id}</code>
      </h2>
      <button>Join</button>
    </div>
  );
}
