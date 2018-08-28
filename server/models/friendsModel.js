const sequelize = require('../utils/db2')
const newFriendSchema = sequelize.import('../schema/new_friends.js')
const UserRelationSchema = sequelize.import('../schema/user_user_relation.js')
class Schema {
  static async updateNewFriends (from_user, user_id) {
    let result = await newFriendSchema.update({
      status: 1
    }, {
      where: {from_user: from_user, to_user: user_id}
    })
    return result
  }
  static async isFriend (user_id, other_user_id) {
    const result = await UserRelationSchema.findOne({ where: { user_id, other_user_id } })
    return result
  }
  static async editorRemark (remark, user_id, other_user_id) {
    const result = await UserRelationSchema.update({remark: remark}, { where: {user_id, other_user_id} })
    return result
  }
  static async insertNewFriends (from_user, to_user, content, time, status) {
    const result = await newFriendSchema.create({from_user, to_user, content, time, status})
    return result
  }
  static async addAsFriend (user_id, other_user_id, time) {
    const result = await UserRelationSchema.create({'user_id': user_id, other_user_id: other_user_id, time: time})
    return result
  }
  static async delFriend (user_id, other_user_id) {
    const result = await UserRelationSchema.destroy({where: {user_id, other_user_id}})
    return result
  }
}
module.exports = Schema
