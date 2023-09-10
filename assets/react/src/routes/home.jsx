import React from "react";
import { Form } from "react-router-dom";

export default function Home() {
  return (
    <div>
      <Form action="games/new" method="post">
        <button type="submit">New Game</button>
      </Form>
    </div>
  );
}
