package emp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DAO;
public class EmpDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void isertEmpPorc(Employee emp) {//데이터추가
		conn =DAO.getConnect();
		String sql ="{call add_new_member(?,?,?,?,?,?)}";
		try {
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, emp.getFirstName());
			cstmt.setString(2, emp.getLastName());
			cstmt.setInt(3, emp.getSalary());
			cstmt.setString(4, emp.getJobId());
			cstmt.setString(5,emp.getHireDate());
			cstmt.setString(6, emp.getEmail());
			cstmt.execute();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void insertEmp(Employee emp) { //삽입
		conn =DAO.getConnect();
		String sql = "insert into employees(employee_id,"
				+ "first_name,last_name,email," + 
				"job_id,hire_date," + 
				"salary) values (?,?,?,?,?,?,?)";
		int rCnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++rCnt, emp.getEmployeeId());
			pstmt.setString(++rCnt, emp.getFirstName());
			pstmt.setString(++rCnt, emp.getLastName());
			pstmt.setString(++rCnt, emp.getEmail());
			pstmt.setString(++rCnt, emp.getJobId());
			pstmt.setString(++rCnt, emp.getHireDate());
			pstmt.setInt(++rCnt, emp.getSalary());
			int r =pstmt.executeUpdate();
			System.out.println(r+ " 건이 입력되었습니다.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public Employee getEmployee(int empNo) {
		conn =DAO.getConnect();
		Employee emp=null;
		
		String sql = "select * from emp_temp where employee_id= ?";
		
		String sql1= "{ ? = call GET_DEPT_NAME(?)}";
		
		try {
			pstmt = conn.prepareStatement(sql); //select문 사용할때이용
			pstmt.setInt(1, empNo);
			rs = pstmt.executeQuery();
			
			CallableStatement cstmt =  conn.prepareCall(sql1); //함수,프로시저 호출이용 사용
			cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
			cstmt.setInt(2, empNo);
			cstmt.execute();
			
			String deptName = cstmt.getString(1);
			
			if(rs.next()) {
				emp=new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setHireDate(rs.getString("hire_date"));
				emp.setEmail(rs.getString("email"));
				emp.setSalary(rs.getInt("salary"));
				emp.setJobId(rs.getString("job_id"));
				emp.setDeptName(deptName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return emp;
	}
	
	public List<Employee> getEmpList(){ //전체조회 
		List<Employee> list = new ArrayList<>();
		
		conn = DAO.getConnect();
		String sql = "select * from emp_temp order by 1 desc";
		Employee emp = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				emp= new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setHireDate(rs.getString("hire_date"));
				emp.setEmail(rs.getString("email"));
				emp.setSalary(rs.getInt("salary"));
				emp.setJobId(rs.getString("job_id"));
				
				list.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;

	}
	
	public void deleteEmployee(int empNo) {
		conn =DAO.getConnect();
		String sql = "delete from emp_temp where employee_id = ?";
		int rCnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++rCnt,empNo);
			
			pstmt.executeUpdate();
			//System.out.println("employee_id: "+empNo+ "  삭제되었습니다.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
