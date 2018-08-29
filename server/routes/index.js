  const router = require('koa-router')()
  const baseApi = require('../config').baseApi
  const register = require('../controllers/register')
  const login = require('../controllers/login')
  const verify = require('../middlewares/verify')
  const robot = require('../controllers/robot')
  const message = require('../controllers/message')
  const groupChat = require('../controllers/groupChat.js')
  const privateChat = require('../controllers/privateChat.js')
  const userInfo = require('../controllers/userInfo.js')
  const newFriends = require('../controllers/newFriends.js')
  const groupInfo = require('../controllers/groupInfo.js')
  router.prefix(`/${baseApi}`)
  router.post('/register', register) // 注册 ok
.post('/login', login) // 登录 ok
.get('/robot', verify, robot) // 机器人交流 ok
.get('/message', verify, message) // 获取首页列表信息 ok
.get('/private_detail', verify, privateChat.getprivateDetail) // 获取私聊相关内容 ok
.post('/private_save_msg', verify, privateChat.savePrivateMsg) // 保存私聊信息 ok
.get('/user_info', verify, userInfo.getUserInfo) // 获取用户资料 ok
.get('/is_friend', verify, userInfo.isFriend) // 是否是好友 ok
.post('/be_friend', verify, userInfo.agreeBeFriend) // 加为好友 ok
.put('/update_newfriends', verify, newFriends.updateNewFriends) // 更新 新好友状态  是否已被同意加好友 ok
.put('/editor_info', verify, userInfo.editorInfo) // 修改我的信息 ok
.delete('/del_friend', verify, userInfo.delFriend) // 删除好友 ok
.put('/shield_friend', verify, userInfo.shieldFriend) // 屏蔽好友
.put('/editor_remark', verify, userInfo.editorRemark) // 修改备注 ok
.get('/find_people', verify, userInfo.findUIByName) // 通过用户名搜索加人，此接口返回用户信息 ok
.get('/get_newfriends', verify, newFriends.getnewFriends) // 获取新朋友通知 ok
.post('/insert_newfriends', verify, newFriends.insertNewFriends) // 添加我的新好友通知 ok
.get('/get_group_info', verify, groupChat.getGroupInfo) // 获取群资料 ok
.get('/group_chat', verify, groupChat.getGroupDetail) // 获取群相关内容 ok
.post('/group_chat_msg', verify, groupChat.saveGroupMsg) // 保存群信息 ok
.post('/group_chat_relation', verify, groupChat.addGroupUserRelation) // 群添加成员并返回群成员 ok
.post('/create_group', verify, groupInfo.createGroup) // 建群 ok
.post('/join_group', verify, groupInfo.joinGroup) // 加入群 ok
.get('/is_in_group', verify, groupInfo.isInGroup) // 看某个用户是否在某个群中(根据返回的数组长度是不是为零就知道) ok
.delete('/exit_group', verify, groupInfo.exitGroup) // 退群 ok
  console.log('router')

  module.exports = router
