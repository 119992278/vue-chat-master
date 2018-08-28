const Sequelize = require('sequelize')
const config = {host: 'localhost', database: 'airchat', username: 'root', password: '123456', port: '3308'} // 数据库信息
const sequelize = new Sequelize(config.database, config.username, config.password, {
  dialect: 'mysql',
  port: config.port,
  pool: { max: 5, min: 0, idle: 30000 },
  define: { timestamps: false }
  // logging: false // 关闭SQL日志
})
module.exports = sequelize
