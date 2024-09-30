import { Hono } from 'hono'

const app = new Hono()

// ボタンを含むHTMLを返す
app.get('/', (c) => {
  const html = `
    <html>
      <body>
        <h1>Hello, Hono!</h1>
        <form action="/clicked" method="POST">
          <button type="submit">Click me!</button>
        </form>
      </body>
    </html>
  `
  return c.html(html)
})

// ボタンがクリックされた時の処理
app.post('/clicked', (c) => {
  return c.text('Button was clicked!')
})

export default {
  port: 3000,
  fetch: app.fetch,
}
