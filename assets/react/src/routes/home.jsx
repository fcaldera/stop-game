import React from "react";

export default function Home() {
  const handleNewGameClick = async () => {
    const response = await fetch("/api/games", {
      method: "POST",
      headers: {
        "Content-Type": "applicaiton/json",
      },
    });

    const result = await response.json();
  };

  return (
    <div>
      <button onClick={handleNewGameClick}>New Game</button>
    </div>
  );
}
