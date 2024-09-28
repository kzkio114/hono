import { Hono } from 'hono'

const app = new Hono()
app.get('/', (c) => c.text('honoをbunでdevサーバーを立ててます！dockerでやってます。'))

export default {
  port: 3000,
  fetch: app.fetch,
}