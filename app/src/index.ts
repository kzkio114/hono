import { Hono } from 'hono'

const app = new Hono()
app.get('/', (c) => c.text('Hello, World!'))

export default {
  port: 3000,
  fetch: app.fetch,
}