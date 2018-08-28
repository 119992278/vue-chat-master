/* jshint indent: 2 */
module.exports = function (sequelize, DataTypes) {
  return sequelize.define('user_info', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: 'NOT NULL'
    },
    password: {
      type: DataTypes.STRING(40),
      allowNull: false,
      defaultValue: 'NOT NULL'
    },
    sex: {
      type: DataTypes.STRING(2),
      allowNull: false,
      defaultValue: '0'
    },
    avator: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: 'http://ooytyiziz.bkt.clouddn.com/people5.jpg'
    },
    place: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    status: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    socketid: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    website: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    github: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    intro: {
      type: DataTypes.STRING(20),
      allowNull: true
    }
  }, {
    tableName: 'user_info'
  })
}
