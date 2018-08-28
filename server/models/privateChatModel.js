const sequelize = require('../utils/db2')
const privateChatSchema = sequelize.import('../schema/private__msg.js')
class Schema {
  static async getPrivateDetail (from_user, to_user) {
    return sequelize.query(` select p.from_user,p.to_user, p.message ,p.time ,i.avator , i.name ,i.status from private__msg as p  inner join user_info as i on p.from_user = i.id  where (p.from_user = ${from_user} AND p.to_user = ${to_user}) or (p.from_user = ${to_user} AND p.to_user  = ${from_user} )  order by time  `, { type: sequelize.QueryTypes.SELECT })
  }
  static async savePrivateMsg (from_user, to_user, message, name, time) {
    let result = await privateChatSchema.create({from_user, to_user, message: `${name} : ${message}`, time})
    return result
  }
}
module.exports = Schema
