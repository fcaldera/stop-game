import React from "react";

export default function App() {
  const handleNewGameClick = async () => {
    const response = await fetch("/api/games", {
      method: "POST",
      headers: {
        "Content-Type": "applicaiton/json",
      },
    });

    const result = await response.json();
    console.log(result);
  };

  return (
    <main>
      <h1>Stop Game!</h1>
      <div>
        <button onClick={handleNewGameClick}>New Game</button>
      </div>
    </main>
  );
}
