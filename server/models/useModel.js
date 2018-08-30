const sequelize = require('../utils/db2')
const UserSchema = sequelize.import('../schema/user_info.js')
const UserRelationSchema = sequelize.import('../schema/user_user_relation.js')
// UserSchema.hasOne(UserRelationSchema)
// UserRelationSchema.belongsTo(UserSchema, {
//   as: 'relation'
// })
class Schema {
  static async insertData (user) {
    await UserSchema.create({
      'name': user.name,
      'password': user.password
    })
    return true
  }
  static async findUserByName (name) {
    const userInfo = await UserSchema.findOne({
      where: {
        name
      },
      attributes: ['id', 'name', 'sex', 'avator', 'place', 'github']
    })
    return userInfo
  }
  static async searchUserByName (name) {
    const userInfo = await UserSchema.findAll({
      where: {
        name
      },
      logging: true,
      attributes: ['id', 'name', 'sex', 'avator', 'place', 'github']
    })
    return userInfo
  }
  static async createUser (user) {
    await UserSchema.create({
      'user_name': user.user_name,
      'password': user.password
    }, {
      logging: true
    })
    return true
  }
  static async editorInfo (data) {
    await UserSchema.update({
      'github': data.github,
      'place': data.place,
      'sex': data.sex,
      'website': data.website
    }, {
      where: {
        'id': data.user_id
      },
      logging: true
    })
    return true
  }
  static async getUserInfo (id, myId) {
    const userInfo = await sequelize.query('SELECT u.id,u.name,u.sex,u.avator,u.place,u.website,u.github,u.intro,r.remark FROM `user_info` AS u join user_user_relation AS r WHERE u.`id` = ' + id + ' AND r.user_id = ' + myId + ' ANd r.other_user_id = ' + id + '', {
      type: sequelize.QueryTypes.SELECT,
      logging: true
    })
    // let userInfo = await UserSchema.findOne({where: {id}})
    return userInfo[0]
  }
  static async saveUserSocketId (id, socketid) {
    const userInfo = await UserSchema.update({
      socketid
    }, {
      where: {
        id
      }
    })
    return userInfo
  }
  static async getUserSocketId (id) {
    const userInfo = await UserSchema.findOne({
      where: {
        id
      },
      attributes: ['socketid']
    })
    return userInfo
  }
}
module.exports = Schema
