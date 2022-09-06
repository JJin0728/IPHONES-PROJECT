
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TeamProjectStatistic {

    public String StatisticFunction(Statement stmt) throws SQLException{

        // 이름별
        String QUERY = "Select * " + "from Name_Statistic ";
        ResultSet rs = stmt.executeQuery(QUERY); 
        System.out.println("이름별 답변 \n" + rs);


        // 항목별
        QUERY = 
        "select new.Unique_Q_ID, new.Unique_A_ID " + "from (select Question_Statistic.Unique_Q_ID as Unique_Q_ID, " + 
        "Count(Unique_A_ID) as Unique_A_ID" + "FROM Question_Statistic" + "GROUP BY Unique_Q_ID" + "ORDER BY Unique_Q_ID) new"
        ;
        ResultSet rss = stmt.executeQuery(QUERY); 
        while (rss.next()) {
            System.out.print("Unique_Q_ID: " + rss.getInt("Unique_Q_ID"));
            System.out.print(", COUNT : " + rss.getString("Count(Unique_A_ID"));
        }
        return null;
    }

}