const jwt = require('jsonwebtoken')
const sequelize = require('../utils/db2')
const request = require('request-promise')
const koaRouter = require('koa-router')
const msgModel = require('../models/msgModel')
const privateChatModel = require('../models/privateChatModel')
const friendsModel = require('../models/friendsModel')
const verify = require('../middlewares/verify')
const router = koaRouter()
router.get('/robot', verify, async (ctx) => {
  const auth = ctx.get('Authorization')
  const token = auth.split(' ')[1]
  const payload = jwt.verify(token, 'secret')
  const date = {
    key: '92febb91673740c2814911a6c16dbcc5',
    info: '' + ctx.query.message,
    userid: '' + payload.id
  }

  const options = {
    method: 'POST',
    uri: 'http://www.tuling123.com/openapi/api',
    body: date,
    json: true // Automatically stringifies the body to JSON
  }

  const response = await request(options)
  console.log(response)
  ctx.body = {
    data: response
  }
})

router.get('/get_newfriends', verify, async (ctx) => {
  const newFriends = await sequelize.query('SELECT n.from_user , n.to_user , n.content, n.status , n.time , u.avator ,u.sex ,u.name FROM (select * from new_friends order by time desc) as n  inner join  user_info as u on n.from_user = u.id  WHERE  n.to_user = ' + ctx.user_id + ' group by  n.from_user', { type: sequelize.QueryTypes.SELECT })
  ctx.body = {
    success: true,
    data: {
      newFriends
    }
  }
})

router.get('/message', verify, async (ctx) => {
  try {
    const res1 = await msgModel.getPrivateList(ctx.user_id)
    const res2 = await msgModel.getGroupList(ctx.user_id)
    ctx.body = {
      success: true,
      data: {
        privateList: res1,
        groupList: res2
      }
    }
  } catch (error) {
    console.log(error)
  }
})

router.post('/private_save_msg', verify, async (ctx) => {
  const from_user = ctx.user_id
  const to_user = ctx.request.body.to_user
  const message = ctx.request.body.message
  const name = ctx.request.body.name
  const time = ctx.request.body.time
  let result = await privateChatModel.savePrivateMsg(from_user, to_user, message, name, time)
  if (result) {
    ctx.body = {
      success: true
    }
  }
})

router.get('/private_detail', verify, async (ctx) => {
  const to_user = ctx.query.to_user
  const from_user = ctx.user_id
  const privateDetail = await privateChatModel.getPrivateDetail(from_user, to_user)
  ctx.body = {
    success: true,
    data: {
      privateDetail
    }
  }
})
module.exports = router
