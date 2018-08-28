/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('group_info', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    group_id: {
      type: DataTypes.CHAR(100),
      allowNull: false
    },
    group_name: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: '交流群'
    },
    group_notice: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: '欢迎大家入群交流~'
    },
    group_avator: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: 'http://ooytyiziz.bkt.clouddn.com/peoples1.jpg'
    },
    group_creater: {
      type: DataTypes.STRING(10),
      allowNull: false,
      defaultValue: ''
    },
    creater_time: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    }
  }, {
    tableName: 'group_info'
  });
};
