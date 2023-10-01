import React from "react";
import { Form, useLoaderData, redirect } from "react-router-dom";
import { getGame, joinGame } from "../api";

export default function Game() {
  const { game } = useLoaderData();

  return (
    <div>
      <Form method="post">
        <h2>
          <code>{game.id}</code>
        </h2>
        <button type="submit">Join</button>
      </Form>
    </div>
  );
}

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

export async function action({ params, request }) {
  //TODO: send the current userId
  const result = await joinGame(params.id, 1);
  return redirect("room");
}
