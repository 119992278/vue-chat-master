const sequelize = require('../utils/db2')
const uuidv1 = require('uuid/v1')
const koaRouter = require('koa-router')
const groupModel = require('../models/groupModel')
const verify = require('../middlewares/verify')
const router = koaRouter()
router.post('/create_group', verify, async (ctx) => {
  let uuid = uuidv1()
  await groupModel.createGroup(uuid, ctx.request.body.group_name, ctx.request.body.group_notice, ctx.request.body.group_avator, ctx.name, ctx.request.body.creater_time)
  ctx.body = {
    success: true,
    data: {
      group_id: uuid
    }
  }
})
router.post('/join_group', verify, async (ctx) => {
  let result = await groupModel.joinGroup(ctx.user_id, ctx.request.body.group_id)
  ctx.body = {
    success: true,
    result
  }
  console.log('加入群成功')
})

router.get('/get_group_info', verify, async (ctx) => {
  try {
    const groupInfo = await groupModel.getGroupInfo(ctx.query.groupId, ctx.query.groupName)
    ctx.body = {
      success: true,
      data: {
        groupInfo
      }
    }
  } catch (error) {
    console.log(error)
  }
})
module.exports = router
