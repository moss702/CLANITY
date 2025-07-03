package mapper.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import domain.en.CategoryStatus;
import domain.en.VisibleLevel;

@MappedTypes(VisibleLevel.class)
@MappedJdbcTypes(JdbcType.VARCHAR)
public class VisibleLevelTypeHandler extends BaseTypeHandler<VisibleLevel>{

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, VisibleLevel parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, parameter.name());
		
	}

	@Override
	public VisibleLevel getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return VisibleLevel.valueOf(rs.getString(columnName));
	}

	@Override
	public VisibleLevel getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return VisibleLevel.valueOf(rs.getString(columnIndex));
	}

	@Override
	public VisibleLevel getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		return VisibleLevel.valueOf(cs.getString(columnIndex));
	}
	
	
}