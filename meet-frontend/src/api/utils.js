export function get(path) {
  return fetch(`http://localhost:4000/api/${path}`, {
    method: 'GET',
    mode: 'cors',
    cache: 'no-cache',
    headers: { 'Content-Type': 'application/json' }
  }).then(res => {
    if (res.ok) {
      return res.json();
    } else {
      throw new Error(res);
    }
  });
}
