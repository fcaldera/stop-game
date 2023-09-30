import React from "react";
import { redirect, Form } from "react-router-dom";
import { createGame } from "../api/games";

export default function Home() {
  return (
    <div>
      <Form method="post">
        <button type="submit">New Game</button>
      </Form>
    </div>
  );
}

export async function action() {
  const game = await createGame();
  return redirect(`/react/games/${game.id}`);
}
