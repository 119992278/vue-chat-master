/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('group_msg', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    from_user: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    to_group: {
      type: DataTypes.CHAR(100),
      allowNull: false,
      defaultValue: ''
    },
    message: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    time: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    }
  }, {
    tableName: 'group_msg'
  });
};
