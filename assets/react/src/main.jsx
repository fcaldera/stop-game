import React from "react";
import { createRoot } from "react-dom/client";
import {
  createBrowserRouter,
  RouterProvider,
  redirect,
} from "react-router-dom";
import Root from "./routes/root";
import Home from "./routes/home";
import Game, { loader as gameLoader } from "./routes/game";
import ErrorPage from "./error-page";
import { createGame, getGame } from "./api";

const router = createBrowserRouter([
  {
    path: "/react",
    element: <Root />,
    errorElement: <ErrorPage />,
    children: [
      { index: true, element: <Home /> },
      {
        path: "games/new",
        action: async () => {
          const newGame = await createGame();
          return redirect(`/react/games/${newGame.id}`);
        },
      },
      {
        path: "games/join",
        action: async ({ request }) => {
          // TODO: read game code from hidden form field
          // TODO: send join action
        },
      },
      {
        path: "games/:id",
        element: <Game />,
        loader: gameLoader,
      },
    ],
  },
]);

const root = createRoot(document.getElementById("react-app"));

root.render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
