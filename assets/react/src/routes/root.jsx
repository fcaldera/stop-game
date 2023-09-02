import React from "react";
import { Outlet } from "react-router-dom";

export default function Root() {
  return (
    <main>
      <h1>Stop Game!</h1>
      <Outlet />
    </main>
  );
}
