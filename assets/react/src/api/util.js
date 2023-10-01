export async function getJSON(url) {
  const res = await fetch(url, {
    headers: { "Content-Type": "application/json" },
  });

  if (!res.ok) return null;
  return (await res.json()).data;
}

export async function postJSON(url, data) {
  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "applicaiton/json",
    },
    body: JSON.stringify(data),
  });

  const result = await response.json();
  return result.data;
}
