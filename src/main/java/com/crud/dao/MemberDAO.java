package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crud.bean.MemberVO;
import com.crud.common.JDBCUtil;


public class MemberDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    
    private final String MEMBER_INSERT = "insert into member(userid, username, password, email, blogurl, photo, detail) values (?,?,?,?,?,?,?)";
    private final String MEMBER_UPDATE = "update member set username = ?, password = ?, email = ?, blogurl = ?, photo = ? , detail = ?";
    private final String MEMBER_DELETE = "delete from member where sid = ?";
    private final String MEMBER_GET = "select * from member where sid = ?";
    private final String MEMBER_LIST = "select * from member order by sid desc";
    
    public int insertMember(MemberVO vo) {
	
	System.out.println("====>JDBC insert");
	
	try {
	    conn = JDBCUtil.getConnection();
	    stmt = conn.prepareStatement(MEMBER_INSERT);
	    stmt.setString(1, vo.getUserid());
	    stmt.setString(2, vo.getUsername());
	    stmt.setString(3, vo.getPassword());
	    stmt.setString(4, vo.getEmail());
	    stmt.setString(5, vo.getBlogurl());
	    stmt.setString(6, vo.getPhoto());
	    stmt.setString(7, vo.getDetail());
	    
	    return stmt.executeUpdate();
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	
	return 0;
    }
    
    public int updateMember(MemberVO vo) {
	System.out.println("=====>JDBC update");
	try {
	    conn = JDBCUtil.getConnection();
	    stmt = conn.prepareStatement(MEMBER_UPDATE);
	    stmt.setString(1, vo.getUsername());
	    stmt.setString(2, vo.getPassword());
	    stmt.setString(3, vo.getEmail());
	    stmt.setString(4, vo.getBlogurl());
	    stmt.setString(5, vo.getPhoto());
	    stmt.setString(6, vo.getDetail());
	    
	    return stmt.executeUpdate(); 
	    
	} catch (Exception e) {
	    // TODO: handle exception
	}
	
	return 0;
    }
    
    public MemberVO getMember(int seq) {
	MemberVO one = new MemberVO();
	System.out.println("===> jdbc로 getboard()");
	
	try {
	    conn = JDBCUtil.getConnection();
	    stmt = conn.prepareStatement(MEMBER_GET);
	    stmt.setInt(1, seq);
	    rs = stmt.executeQuery();
	    if(rs.next()) {
		one.setSid(rs.getInt("sid"));
		one.setUserid(rs.getString("userid"));
		one.setPassword(rs.getString("password"));
		one.setEmail(rs.getString("email"));
		one.setBlogurl(rs.getString("blogurl"));
		one.setPhoto(rs.getString("photo"));
		one.setDetail(rs.getString("detail"));
		one.setTimestamp(rs.getString("timestamp"));
		
	    }
	    rs.close();
	    
	    
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	
	return one;
    }
    
    public int deleteMember(MemberVO vo) {
	System.out.println("===>jdbc로 deleteboard 실행");
	try {
	    conn = JDBCUtil.getConnection();
	    stmt = conn.prepareStatement(MEMBER_DELETE);
	    
	    System.out.println("sid : "+vo.getSid());
	    
	    stmt.setInt(1,vo.getSid());
	    
	    return stmt.executeUpdate();
	    
	    
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	System.out.println("member delete failed");
	return 0;
    }
    
    public List<MemberVO> getBoardList(){
	List<MemberVO> list = new ArrayList<MemberVO>();
	
	System.out.println("====> JDBC로 getboardlist() 기능처리");
	
	try {
	    conn = JDBCUtil.getConnection();
	    stmt = conn.prepareStatement(MEMBER_LIST);
	    rs = stmt.executeQuery();
	    while(rs.next())
	    {
		MemberVO one = new MemberVO();
		one.setSid(rs.getInt("sid"));
		one.setUserid(rs.getString("userid"));
		one.setUsername(rs.getString("username"));
		one.setPassword(rs.getString("password"));
		one.setEmail(rs.getString("email"));
		one.setBlogurl(rs.getString("blogurl"));
		one.setPhoto(rs.getString("photo"));
		one.setDetail(rs.getString("detail"));
		one.setTimestamp(rs.getString("regdate"));
		list.add(one);
	    }
	    rs.close();
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	
	
	
	return list;
    }
    
    public List<MemberVO> getBoardList(int sidValue){
   	List<MemberVO> list = new ArrayList<MemberVO>();
   	
   	System.out.println("====> JDBC로 getboardlist() 기능처리");
   	
   	try {
   	    conn = JDBCUtil.getConnection();
   	    stmt = conn.prepareStatement(MEMBER_LIST);
   	    rs = stmt.executeQuery();
   	    while(rs.next())
   	    {
   		MemberVO one = new MemberVO();
   		one.setSid(rs.getInt("sid"));
   		one.setUserid(rs.getString("userid"));
   		one.setPassword(rs.getString("password"));
   		one.setEmail(rs.getString("email"));
   		one.setBlogurl(rs.getString("blogurl"));
   		one.setPhoto(rs.getString("photo"));
   		one.setDetail(rs.getString("detail"));
   		one.setTimestamp(rs.getString("timestamp"));
   		list.add(one);
   	    }
   	    rs.close();
   	} catch (Exception e) {
   	    // TODO: handle exception
   	    e.printStackTrace();
   	}
   	
   	
   	
   	return list;
       }
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
