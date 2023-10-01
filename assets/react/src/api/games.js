import { getJSON, postJSON } from "./util";

export async function createGame() {
  return postJSON("/api/games", {});
}

export function getGame(id) {
  return getJSON(`/api/games/${id}`);
}

export async function joinGame(id, userId) {
  return postJSON(`/api/games/${id}/player`, { userId });
}
