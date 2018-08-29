const sequelize = require('../utils/db2')
const groupInfoSchema = sequelize.import('../schema/group_info.js')
const groupRelationSchema = sequelize.import('../schema/group_user_relation.js')
const groupMsgchema = sequelize.import('../schema/group_msg.js')
class Schema {
  static async createGroup (group_id, group_name, group_notice, group_avator, group_creater, creater_time) {
    await groupInfoSchema.create({
      group_id,
      group_name,
      group_notice,
      group_avator,
      group_creater,
      creater_time
    })
    return true
  }
  static async joinGroup (user_id, group_id) {
    await groupRelationSchema.create({
      user_id,
      group_id
    })
    return true
  }
  static async getGroupInfo (group_id, group_name) {
    let result = await groupInfoSchema.findAll({
      where: {
        $or: [{
          group_id
        }, {
          group_name
        }]
      }
    })
    return result
  }
  static async getGroupMsg (group_id) {
    const result = await sequelize.query('select g.message,g.time,g.from_user,u.avator from group_msg as g JOIN user_info as u ON g.from_user = u.id WHERE g.to_group = "0d5e9a30-a058-11e8-84c1-4d8cded92688" ORDER BY time', {
      type: sequelize.QueryTypes.SELECT
    })
    return result
  }
  static async getGroupMember (group_id) {
    let result = await groupRelationSchema.findAll({
      where: {
        group_id
      },
      attributes: [
        ['user_id', 'group_member_id']
      ]
    })
    return result
  }
  static async addGroupUserRelation (user_id, group_id) {
    let result = await groupRelationSchema.create({group_id, user_id})
    return result
  }
  static async isInGroup (user_id, group_id) {
    let result = await groupRelationSchema.findAll({where: {user_id, group_id}})
    return result
  }
  static async saveGroupMsg (from_user, to_group, message, name, time) {
    let result = await groupMsgchema.create({from_user, to_group, message: `${name} : ${message}`, time})
    return result
  }
  static async exitGroup (user_id, group_id) {
    let result = await groupRelationSchema.destroy({where: {user_id, group_id}})
    return result
  }
}
module.exports = Schema
