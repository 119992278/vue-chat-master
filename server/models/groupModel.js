const sequelize = require('../utils/db2')
const groupInfoSchema = sequelize.import('../schema/group_info.js')
const groupRelationSchema = sequelize.import('../schema/group_user_relation.js')
class Schema {
  static async createGroup (group_id, group_name, group_notice, group_avator, group_creater, creater_time) {
    await groupInfoSchema.create({
      group_id, group_name, group_notice, group_avator, group_creater, creater_time
    })
    return true
  }
  static async joinGroup (user_id, group_id) {
    await groupRelationSchema.create({user_id, group_id})
    return true
  }
  static async getGroupInfo (group_id, group_name) {
    //	let _sql =    ' SELECT group_id , group_name , group_notice ,group_avator ,group_creater ,creater_time FROM group_info  WHERE group_id = ? OR group_name = ? ;';
    let result = await groupInfoSchema.findAll({where: {$or: [{group_id}, {group_name}]}})
    return result
  }
}
module.exports = Schema
