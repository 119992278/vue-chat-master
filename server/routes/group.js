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

router.delete('/exit_group', verify, async (ctx) => {
  await groupModel.exitGroup(ctx.user_id, ctx.query.group_id)
  ctx.body = {
    success: true
  }
})
router.post('/group_chat_relation', verify, async (ctx) => {
  const userId = ctx.user_id
  const groupId = ctx.request.body.groupId
  await groupModel.addGroupUserRelation(userId, groupId)
  let RowDataPacket = await groupModel.getGroupMember(groupId)
  let groupMember = JSON.parse(JSON.stringify(RowDataPacket))
  let newGroupMember = []
  groupMember.forEach(element => {
    newGroupMember.push(element.group_member_id) 
  })
  ctx.body = {
    success: true,
    data: {
      groupMember: newGroupMember
    }
  }
  console.log('添加群成员成功')
})

router.get('/is_in_group', verify, async (ctx) => {
  const group_user = await groupModel.isInGroup(
    ctx.user_id,
    ctx.query.group_id
  )
  // const group_user = JSON.parse(JSON.stringify(RowDataPacket))
  ctx.body = {
    success: true,
    data: {
      group_user
    }
  }
})

router.post('/group_chat_msg', verify, async (ctx) => {
  const userId = ctx.user_id
  const groupId = ctx.request.body.groupId
  const message = ctx.request.body.message
  const name = ctx.request.body.name
  const time = ctx.request.body.time
  let result = await groupModel.saveGroupMsg(userId, groupId, message, name, time)
  if (result) {
    ctx.body = {
      success: true
    }
    console.log('保存群消息成功')
  }
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

router.get('/group_chat', verify, async (ctx) => {
  try {
    let groupId = ctx.query.groupId
    let groupMsg = await groupModel.getGroupMsg(groupId)
    let groupInfo = await groupModel.getGroupInfo(groupId, null)
    let groupMembers = await groupModel.getGroupMember(groupId)
    let groupMember = []
    groupMembers = JSON.parse(JSON.stringify(groupMembers))
    groupMembers.map(function (value, key, arr) {
      groupMember.push(value.group_member_id)
    })
    ctx.body = {
      success: true,
      data: {
        groupMsg,
        groupInfo,
        groupMember
      }
    }
  } catch (error) {
    console.log(error)
  }
})
module.exports = router
