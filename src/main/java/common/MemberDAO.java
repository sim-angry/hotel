package common;

public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM hotel_member_tbl_02 WHERE custid=? AND custpw=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행
            psmt = con.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, uid);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            psmt.setString(2, upass);  // 쿼리문의 두 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
            	dto.setCustno(rs.getString("custno"));
            	dto.setCustid(rs.getString("custid"));
            	dto.setCustpw(rs.getString("custpw"));
            	dto.setCustname(rs.getString("custname"));
            	dto.setPhone(rs.getString("phone"));
            	dto.setAddress(rs.getString("address"));
            	dto.setJoindate(rs.getString("joindate"));
            	dto.setGrade(rs.getString("grade"));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return dto;  // DTO 객체 반환
    }
}