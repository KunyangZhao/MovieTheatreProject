package dao;

import entity.MovieComment;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by EYlee on 11/26/15.
 */
public class MovieCommentDao {
    public boolean saveComment(MovieComment comment) {

        Connection con = DBUtil.getConnection();
        String sql = "insert into F15_MOVIECOMMENT values (comment_id.NEXTVAL," + comment.getThreadid() + "," + comment.getUserid() + ",'" + comment.getCommenttext() + "',sysdate)";
        System.out.println(sql);
        Statement st = null;
//        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            st = con.createStatement();
            int isOK = st.executeUpdate(sql);
//

            if (isOK > 0) {
                return !flag;
            } else {
                return flag;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public List<MovieComment> getCommentDetail(int userid, int threadid) {
        Connection con = DBUtil.getConnection();
        String sql = "select * from f15_moviecomment c where c.reviewid=" + threadid+"and c.userid="+userid;// 编写sql语句，第一个字段不需要插入，是自动增加的
        System.out.println(sql);
        Statement st = null;
        List<MovieComment> commentList = new ArrayList<MovieComment>();
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            // 判断是否为空

            while (rs.next()) {// 将信息迭代到list中
                MovieComment comment = new MovieComment();
                comment.setCommentid(rs.getInt("id"));
                comment.setCommenttext(rs.getString("content"));
                comment.setCommenttime(rs.getString("time"));
                comment.setUserid(rs.getInt("userid"));
                comment.setThreadid(rs.getInt("reviewid"));

                commentList.add(comment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DBUtil.close(con);
        return commentList;
    }
}
