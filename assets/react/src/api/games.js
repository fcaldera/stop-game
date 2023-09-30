async function getJSON(url) {
  const res = await fetch(url, {
    headers: { "Content-Type": "application/json" },
  });

  if (!res.ok) return null;
  return (await res.json()).data;
}

export async function createGame() {
  const response = await fetch("/api/games", {
    method: "POST",
    headers: {
      "Content-Type": "applicaiton/json",
    },
  });
  const result = await response.json();
  return result.data;
}

export function getGame(id) {
  return getJSON(`/api/games/${id}`);
}

export async function joinGame(id) {
  return { ok: true };
}
