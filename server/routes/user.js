const jwt = require('jsonwebtoken')
const koaRouter = require('koa-router')
const userModel = require('../models/useModel')
const friendsModel = require('../models/friendsModel')
const verify = require('../middlewares/verify')
let md5 = require('md5')
const router = koaRouter()
router.post('/register', async (ctx) => {
  var user = {
    name: ctx.request.body.name,
    password: md5(ctx.request.body.password)
  }
  let name = ctx.request.body.name || ''
  let result = await userModel.findUserByName(name)
  if (result) {
    ctx.body = {
      success: false,
      message: '用户名已存在'
    }
  } else {
    let result = await userModel.insertData(user)
    ctx.body = {
      success: true,
      message: '注册成功！'
    }
  }
})
router.post('/login', async (ctx) => {
  let name = ctx.request.body.name || ''
  await userModel.findUserByName(name).then(async (result) => {
    if (result) {
      const payload = { // payload
        name,
        id: result['id']
      }
      const token = jwt.sign(payload, 'secret', {
        expiresIn: Math.floor(Date.now() / 1000) + 24 * 60 * 60 // 一天
      })
      ctx.body = {
        success: true,
        message: '登录成功',
        token: token,
        userInfo: {
          name: result['name'],
          user_id: result['id'],
          sex: result['sex'],
          website: result['website'],
          github: result['github'],
          intro: result['intro'],
          avator: result['avator'],
          place: result['place'],
          socketId: result['socketid']
        }
      }
    } else {
      ctx.body = {
        success: false,
        info: '用户不存在！'
      }
    }
  })
})
router.put('/editor_info', verify, async (ctx) => {
  const data = {
    github: ctx.request.body.github,
    website: ctx.request.body.website,
    place: ctx.request.body.place,
    sex: ctx.request.body.sex,
    user_id: ctx.user_id
  }
  await userModel.editorInfo(data).then(result => {
    if (result) {
      ctx.body = {
        success: true
      }
      console.log('修改个人信息成功')
    }
  })
})

router.get('/user_info', verify, async (ctx) => {
  const userInfo = await userModel.getUserInfo(ctx.query.user_id, ctx.user_id)
  ctx.body = {
    success: true,
    data: { userInfo }
  }
})

router.get('/is_friend', verify, async (ctx) => {
  const isMyFriend = await friendsModel.isFriend(
    ctx.user_id,
    ctx.query.other_user_id
  )
  const isHisFriend = await friendsModel.isFriend(
    ctx.query.other_user_id,
    ctx.user_id
  )
  ctx.body = {
    success: true,
    data: {
      isMyFriend: isMyFriend,
      isHisFriend: isHisFriend
    }
  }
})

router.put('/update_newfriends', verify, async (ctx) => {
  const res1 = await friendsModel.updateNewFriends(ctx.request.body.from_user, ctx.user_id)
  ctx.body = {
    success: true
  }
})
router.put('/editor_remark', verify, async (ctx) => {
  await friendsModel.editorRemark(
    ctx.request.body.remark,
    ctx.user_id,
    ctx.request.body.other_user_id
  ).then(result => {
    console.log('editorRemark', result)
    if (result) {
      ctx.body = {
        success: true
      }
      // console.log('修改备注成功')
    }
  })
  .catch(err => {
    console.log(err)
  })
})

router.post('/insert_newfriends', verify, async (ctx) => {
  await friendsModel.insertNewFriends(ctx.user_id, ctx.request.body.to_user, ctx.request.body.content, ctx.request.body.time, ctx.request.body.status).then(result => {
    ctx.body = {
      success: true
    }
  }).catch(err => {
    console.log(err)
  })
})

router.get('/find_people', verify, async (ctx) => {
  const userInfo = await userModel.searchUserByName(ctx.query.name)
  ctx.body = {
    success: true,
    data: {
      userInfo
    }
  }
})

router.delete('/del_friend', verify, async (ctx) => {
  let result = await friendsModel.delFriend(ctx.user_id, ctx.query.other_user_id)
  if (result) {
    ctx.body = {
      success: true
    }
  }
})

router.post('/be_friend', verify, async (ctx) => {
  const isMyFriend = await friendsModel.isFriend(ctx.user_id, ctx.request.body.other_user_id)
  const isHisFriend = await friendsModel.isFriend(ctx.request.body.other_user_id, ctx.user_id)
// 变成本机用户的朋友
  if (!isMyFriend) {
    await friendsModel.addAsFriend(
    ctx.user_id,
    ctx.request.body.other_user_id,
    ctx.request.body.time
  )
  }
// 本机用户变成ta的朋友
  if (!isHisFriend) {
    await friendsModel.addAsFriend(
    ctx.request.body.other_user_id,
    ctx.user_id,
    ctx.request.body.time
  )
  }
  ctx.body = {
    success: true
  }
  console.log('添加好友成功')
})
module.exports = router
