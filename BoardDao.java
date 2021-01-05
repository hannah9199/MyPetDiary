package pet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pet.bean.Board;

public class BoardDao extends SuperDao {

	

	public int SelectTotalCount(String mode, String keyword) {//데이타 세기 
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select count(*) as cnt from boards ";
		if (mode.equalsIgnoreCase("all") == false) {
			//전체 검색이 아니면
			sql += " where " + mode + " like '" + keyword + "' " ;
		}
		
		int cnt = -999999;
		
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//placeholder
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			SQLException err = (SQLException)e;
			cnt = -err.getErrorCode();
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if( rs != null) {rs.close();}
				if( pstmt != null) {pstmt.close();}
				if( conn != null) {conn.close();}  
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public List<Board> SelectDataList(int beginRow, int endRow) {// 파일 데이터 전체 조회 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cnt = -999999;
		
		String sql = " select no, board_type, writer, title, content, file_name, file_path, groupno, orderno, depth, reads_count, likes_count, comments_count, created_at, updated_at, deleted_at "; 
		sql += " from ( ";
		sql += " select no, board_type, writer, title, content, file_name, file_path, groupno, orderno, depth, reads_count, likes_count, comments_count, created_at, updated_at, deleted_at, ";
		sql += "  rank() over(order by created_at desc) as ranking " ;
		sql += " from boards ";
		sql += " ) " ;
		sql += " where ranking between ?  and ?  " ;
		
		List<Board> lists = new ArrayList<Board>();
		
		System.out.println(sql);
		System.out.println(beginRow);
		System.out.println(endRow);
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//placeholder
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board bean = new Board();
				bean.setNo(rs.getInt("no"));
				bean.setTitle(rs.getString("title"));
				bean.setFileName(rs.getString("file_name"));
				bean.setFilePath(rs.getString("file_path"));	
				bean.setContent(rs.getString("content"));
				
				lists.add(bean) ;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lists;
	}

	public int DeleteData(int no) {// 파일 데이터 삭제 
		
		PreparedStatement pstmt = null;
		String sql ;
		
		try {
			sql = "delete boards where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return no;
		
	}

	public Board SelectDataByPk(int no) { // 특정 데이터 조회 
		
		Board bean = null;
		
		String sql = " select * from boards ";
		sql += " where no = ? " ;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//placeholder
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new Board();
				
				bean.setFileName(rs.getString("file_name"));
				bean.setFilePath(rs.getString("file_path"));
				bean.setNo(rs.getInt("no"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setContent(rs.getString("content"));
			
			}
			System.out.println("ok");
			
		} catch (Exception e) {
			SQLException err = (SQLException)e ;
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if (rs != null) {rs.close();}
				if (pstmt != null) {rs.close();}
				if (conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean;
	}

	public int UpdateReadhit(int no) {
		String sql = " update boards set reads_count = reads_count + 1 ";
		sql += " where no = ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//placeholder
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = - err.getErrorCode();
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
		
	}

	public int UpdateData(Board bean) {
		
		String sql = " update boards set ";
		sql += " content=?, updated_at=?, title=?, writer=? ";
		sql += " where order_no =? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getContent());
			pstmt.setString(2, bean.getUpdated_at());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getWriter());
			
			pstmt.setInt(5, bean.getOrder_no());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode();
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			return cnt;
	}

	public int ReplyData(Board bean, int group_no, int order_no) {
		
		String sql = " insert into boards ";
		sql += " ( ";
		sql += " no, board_type, writer, title, content, file_name, file_path, category, group_no, order_no, depth, reads_count, likes_count, comments_count, created_at, updated_at, deleted_at ";
		sql += " ) ";
		sql += " values";
		sql += " ( ";
		sql += " myboard.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, to_date(?, 'yyyy/MM/dd'), ?";
		sql += " ) ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//placeholder
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getUpdated_at());
			pstmt.setInt(5, bean.getGroup_no());
			pstmt.setInt(6, bean.getOrder_no());
			pstmt.setInt(7, bean.getDepth());
			
			cnt = pstmt.executeUpdate();
			
			sql = " update boards set order_no = order_no + 1";
			sql = " where group_no = ? and order_no > ? ";
			
			pstmt = null;
			pstmt= conn.prepareStatement(sql);
			
			cnt = -999999;
			
			pstmt.setInt(1, group_no);
			pstmt.setInt(2, order_no);
			
			cnt = pstmt.executeUpdate();
			
			conn.commit();
			
		} catch (Exception e) {
			SQLException err = (SQLException) e;
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public int upload(Board bean) {
		
		String sql = " insert into boards ";
		sql += " ( ";
		sql += " no, board_type, writer, title, content, file_name, file_path";
		sql += " ) ";
		sql += " values";
		sql += " ( ";
		sql += " petboard.nextval, ?, ?, ?, ?, ?, ?";
		sql += " ) ";
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  bean.getBoard_type());
			pstmt.setString(2,  bean.getWriter());
			pstmt.setString(3,  bean.getTitle());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5,  bean.getFileName());
			pstmt.setString(6,  bean.getFilePath());
	
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
