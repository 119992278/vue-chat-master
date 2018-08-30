/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('private__msg', {
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
    to_user: {
      type: DataTypes.INTEGER(11),
      allowNull: false
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
    tableName: 'private__msg'
  });
};
