enum Method {
  GET,
  POST,
  PUT,
  DELETE
}

type callback = (value?: any) => any;

function request(
  url: string,
  method: Method,
  body?: any,
  success?: callback,
  fail?: callback
) {
  const headers: any = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  const authenticity_token = (document.head.querySelector("[name=csrf-token]") as any).content

  const params: any = {
    credentials: 'include',
    method: Method[method],
    headers,
    authenticity_token
  };

  if (body) {
    params['body'] = JSON.stringify(Object.assign(body, { authenticity_token }));
  }

  fetch(url, params)
    .then((response) => {
      return response.json()
        .then((json) => {
          if (response.ok) {
            success(json);
          } else {
            fail(json);
          }
        });
    });
}

export function GET(url: string, success?: callback, fail?: callback) {
  request(url, Method.GET, undefined, success, fail);
}

export function POST(url: string, body: any, success?: callback, fail?: callback) {
  request(url, Method.POST, body, success, fail);
}
