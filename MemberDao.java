package pet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pet.bean.Member;

public class MemberDao extends SuperDao {

	public int InsertData(Member bean) {
		System.out.println( bean.toString() ); 
		String sql = " insert into member(id, name, nickname, password, email, phone, zipcode, address1, address2,   pet) " ; 
		sql += " values(                    ?,   ?,    ?,          ?,     ?,     ?,       ?,         ?,        ?,     ?) " ;
		
		//System.out.println("ok");
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			System.out.println("ok");
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getNickname());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getPhone());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress1());
			pstmt.setString(9, bean.getAddress2());
			//pstmt.setString(10, bean.getCreated_at());
			pstmt.setString(10, bean.getPet());
			
			cnt = pstmt.executeUpdate() ; 
			conn.commit(); 
			
		} catch (Exception e) {
			SQLException err = (SQLException)e ;
			
			cnt = - err.getErrorCode() ;			
			e.printStackTrace();
			try {
				conn.rollback(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally{
			try {
				if( pstmt != null ){ pstmt.close(); }
				if(conn != null){conn.close();} 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
		
	}

	public Member SelectDataByPk(String id) {
		Member bean = null ;
		
		String sql = " select * from member where id = ? ";
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, id);			
						
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) { //해당 사용자 발견됨
				bean = new Member();
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setEmail(rs.getString("email"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setNickname(rs.getString("nickname"));
				bean.setPassword(rs.getString("password"));
				bean.setZipcode(rs.getString("zipcode"));
				//bean.setCreated_at(rs.getString("created_at"));
				bean.setPhone(rs.getString("phone"));
				bean.setPet(rs.getString("pet"));
				
				//bean.setMlevel(rs.getInt("mlevel"));
				//bean.setStatus(rs.getInt("status"));
				//bean.setMpoint(rs.getInt("mpoint"));
				
			}
			System.out.println("ok");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean  ;
	}

	public Member SelectDataByNn(String nickname) {
		Member bean = null ;
		
		String sql = " select * from member where nickname = ? ";
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, nickname);			
						
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) { //해당 사용자 발견됨
				bean = new Member();
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setEmail(rs.getString("email"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setNickname(rs.getString("nickname"));
				bean.setPassword(rs.getString("password"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setPhone(rs.getString("phone"));
				//bean.setCreated_at(rs.getString("created_at"));
				bean.setPet(rs.getString("pet"));
				
				//숫자 
				//bean.setMlevel(rs.getInt("mlevel"));
				//bean.setStatus(rs.getInt("status"));
				//bean.setMpoint(rs.getInt("mpoint"));
				
			}
			System.out.println("ok");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean  ;
	}
}