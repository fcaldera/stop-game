import React from "react";
import { createRoot } from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import ErrorPage from "./error-page";
import Root from "./routes/root";
import Home, { action as homeAction } from "./routes/home";
import Game, {
  loader as gameLoader,
  action as gameAction,
} from "./routes/game";
import Room from "./routes/room";

const router = createBrowserRouter([
  {
    path: "/react",
    element: <Root />,
    errorElement: <ErrorPage />,
    children: [
      {
        index: true,
        element: <Home />,
        action: homeAction,
      },
      {
        path: "games/:id",
        element: <Game />,
        loader: gameLoader,
        action: gameAction,
      },
      {
        path: "games/:id/room",
        element: <Room />,
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
