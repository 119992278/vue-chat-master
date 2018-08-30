const sequelize = require('../utils/db2')
const UserSchema = sequelize.import('../schema/private__msg.js')
class Schema {
  static async getPrivateList (user_id) {
    return sequelize.query(` SELECT r.other_user_id,r.remark ,i.name , i.avator , r.time as be_friend_time,(SELECT p.message  FROM private__msg AS p WHERE (p.to_user = r.other_user_id and p.from_user = r.user_id) or  (p.from_user = r.other_user_id and p.to_user = r.user_id)  ORDER BY p.time DESC   LIMIT 1 )  AS message ,(SELECT p.time  FROM private__msg AS p  WHERE  (p.to_user = r.other_user_id and p.from_user = r.user_id) or  (p.from_user = r.other_user_id and p.to_user = r.user_id)   ORDER BY p.time DESC   LIMIT 1 )  AS time FROM  user_user_relation AS r  inner join user_info AS i on r.other_user_id  = i.id   WHERE r.user_id = ${user_id}  `, { type: sequelize.QueryTypes.SELECT, logging: true })
  }
  static async getGroupList (user_id) {
    return sequelize.query(`SELECT r.group_id ,i.group_name , i.creater_time, i.group_avator ,(SELECT g.message  FROM group_msg AS g  WHERE g.to_group = r.group_id  ORDER BY TIME DESC   LIMIT 1 )  AS message ,(SELECT g.time  FROM group_msg AS g  WHERE g.to_group = r.group_id  ORDER BY TIME DESC   LIMIT 1 )  AS time FROM  group_user_relation AS r  inner join group_info AS i on r.group_id = i.group_id   WHERE r.user_id = ${user_id} `, { type: sequelize.QueryTypes.SELECT })
  }
}
module.exports = Schema
