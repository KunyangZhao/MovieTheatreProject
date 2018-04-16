package dao;

import entity.MovieThread;
import entity.Theater;
import util.DBUtil;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;

/**
 * Created by EYlee on 11/26/15.
 */
public class MovieThreadDao {
    public boolean saveThread(MovieThread mt) {
        Connection con = DBUtil.getConnection();

        String sql = "insert into f15_moviereview values(thread_id.NEXTVAL," + mt.getMovieID() + "," + mt.getRating() + ",'" + mt.getContent() + "',sysdate," + mt.getUid() + ")";
        System.out.println(sql);
        try {

            Statement st = con.createStatement();
            int isok = st.executeUpdate(sql);
            if (isok > 0) {
                return true;
            } else {
                return false;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(con);
        }

        return true;
    }

    public List<MovieThread> findAll() {
        Connection con = DBUtil.getConnection();
        String sql = "select * from f15_moviereview";

        Statement st = null;

        List<MovieThread> threadList = new ArrayList<MovieThread>();

        try {
            st = con.createStatement();
            ResultSet res = st.executeQuery(sql);
            while (res.next()) {
                String id = res.getString("id");
                String movieid = res.getString("movieid");
                String rate = res.getString("rating");
                String content = res.getString("content");
                Time time = res.getTime("time");
                String userid = res.getString("userid");
                System.out.println(time);
                //change time format to string
                SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
                String time1 = sdf.format(time);
                System.out.println(time1);

                MovieThread mt = new MovieThread();

                mt.setId(Integer.parseInt(id));
                mt.setMovieID(Integer.parseInt(movieid));
                mt.setRating(Integer.parseInt(rate));
                mt.setContent(content);
                mt.setTime(time1);
                mt.setUid(Integer.parseInt(userid));

                threadList.add(mt);


            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return threadList;
    }
}
