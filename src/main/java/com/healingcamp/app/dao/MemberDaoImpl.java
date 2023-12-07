package com.healingcamp.app.dao;

import com.healingcamp.app.domain.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class MemberDaoImpl implements MemberDao {

    @Autowired
    DataSource ds;

    @Autowired
    MemberDao MemberDao;

    @Autowired
    SqlSession session;
    String namespace="com.healingcamp.app.dao.MemberMapper.";

    @Override
    public void deleteAll() throws SQLException {
        // 1. 데이터베이스 연결
        Connection conn = ds.getConnection();
        // 2. sql문 생성
        String sql = "delete from Member";
        // 3. sql문 실행
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        // 4. 리소스 반납( close )
        pstmt.close();
        conn.close();
    }

    @Override
    public int insertMember(MemberDto memberDto) {

        return session.insert(namespace + "insertMember", memberDto);
    }

    @Override
    public MemberDto selectMemberIdChk(String uid) throws Exception {
        return session.selectOne(namespace + "selectMemberIdChk", uid);
    }
    @Override
    public int updateMember(MemberDto user) throws Exception {
        String sql="update user_info set U_id=?, U_pw=?, U_name=?, U_phone=?, U_birth=?, U_gender=?, U_email, U_filel where U_num=?";
        try(
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){

            pstmt.setString(1, user.getU_id());
            pstmt.setString(2, user.getU_pw());
            pstmt.setString(3, user.getU_name());
            pstmt.setString(4, user.getU_phone());
            pstmt.setString(5, user.getU_birth());
            pstmt.setString(6, user.getU_gender());
            pstmt.setString(7, user.getU_email());
            pstmt.setString(8, user.getU_field());
            pstmt.setInt(9, user.getU_num());

            int rowCount = pstmt.executeUpdate();
            return rowCount;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public int deleteMember(String U_id) throws SQLException {
        Connection conn = ds.getConnection();
        String sql = "delete from Member where U_id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, U_id);
        int rowCount = pstmt.executeUpdate();
        pstmt.close();

        return rowCount;
    }

    // 가변인자. 매개변수로 몇개가 올진 모르겠지만 그 속성들을 배열처럼 받아서 저장
    private void close(AutoCloseable... acs) {
        for(AutoCloseable ac : acs) { // pstmt, conn
            try {
                if(ac != null) ac.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }
}
