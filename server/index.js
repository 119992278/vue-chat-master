const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const cors = require('koa2-cors')
const sequelize = require('./utils/db2')
const userModel = require('./models/useModel')
const koaRouter = require('koa-router')
const user = require('./routes/user.js')
const message = require('./routes/message.js')
const group = require('./routes/group.js')
const router = koaRouter()
const app = new Koa()
const server = require('http').createServer(app.callback())
const io = require('socket.io')(server)
app.use(cors())
app.use(bodyParser())
router.prefix(`/${'api/v1'}`)
router.use('', user.routes())
router.use('', message.routes())
router.use('', group.routes())
app.use(router.routes());
(async () => {
  try {
    await sequelize.authenticate().then(() => {
      console.log('==============数据库连接成功==============')
      server.listen(3000)
      console.log('服务器已启动,端口3000')
      io.on('connection', socket => {
        const socketId = socket.id
        socket.on('login', async userId => { // 登录
          await userModel.saveUserSocketId(userId, socketId)
        })
        socket.on('update', async userId => { // 更新soketId
          await userModel.saveUserSocketId(userId, socketId)
        })
        socket.on('sendPrivateMsg', async data => { // 私聊
          const result = await userModel.getUserSocketId(data.to_user)
          io.to(result.socketid).emit('getPrivateMsg', data)
        })
        socket.on('sendGroupMsg', async data => { // 群聊
          io.sockets.emit('getGroupMsg', data)
        })
        socket.on('sendRequest', async data => { // 加好友请求
          console.log('sendRequest', data)
          const arr = await userModel.getUserSocketId(data.to_user)
          const RowDataPacket = arr[0]
          const socketid = JSON.parse(JSON.stringify(RowDataPacket)).socketid
          console.log('给谁的socketid', socketid)
          io.to(socketid).emit('getresponse', data)
        })
        socket.on('disconnect', data => {
          console.log('disconnect', data)
        })
      })
    }).catch(err => {
      console.error('无法连接数据库连接错误', err)
    })
  } catch (err) {
    console.error(err)
  }
})()
