package src;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class TeamProjectPoll {

    private String max(int unique_ID) {
        // MySQL 이름의 unique_ID의 MAX 값을 가져오는 class
        String QUERY = "select max(Unique_ID) " + "from CarSurvey_Uswer ";
        return max(unique_ID);
    }

    public String PollFunction(Statement stmt) throws SQLException{
        
        Scanner scanner = new Scanner(System.in);
        String name = "";

        String str = String.format("%s\n%s\n%s\n%s\n%s\n%s\n"
            ,"1. 매우 만족"
            ,"2. 만족"
            ,"3. 보통"
            ,"4. 불만족"
            ,"5. 매우 불만족"
            ,"답변 : ");

        System.out.println("이름을 입력하세요 : ");
        name = scanner.nextLine();

        System.out.println("설문 1. 이 차의 가격형성에 대해 만족하십니까?");
        System.out.println(str);
        int one = Integer.parseInt(scanner.nextLine());

        System.out.println("설문 2. 디자인에 대해 만족하십니까?");
        System.out.println(str);
        scanner = new Scanner(System.in);
        int two = Integer.parseInt(scanner.nextLine());

        System.out.println("설문 3. 차 내부 사용감에 대해 만족하십니까?");
        System.out.println(str);
        int three = Integer.parseInt(scanner.nextLine());

        System.out.println("설문 4. 쿠션성에 대해 만족하십니까?");
        System.out.println(str);
        int four = Integer.parseInt(scanner.nextLine());

        String QUERY = "select Unique_ID, Name, 1, 2, 3, 4 " + "from CarSurvey_Answer ";
        
        // database 이름 Unique_ID MAX값을 가져와서 query에서 insert할때 +1씩 해주는 코드
        int Unique_ID = 0;
        String QUERY1 = "select max(Unique_ID) " + "from CarSurvey_Answer " + "group by Unique_ID ";
        Unique_ID = Integer.parseInt(max(Unique_ID));

        // insert
        QUERY = "insert into CarSurvey_Answer(Unique_ID, Name, 1, 2, 3, 4) " + 
                "values ( " + (Unique_ID+1) + ", " + name + one + ", " + two + ", " + three + ", " + four + " ) ";
        int val = stmt.executeUpdate(QUERY); 

        // select
        QUERY = "select Unique_ID, Name, 1, 2, 3, 4 " + "from CarSurvey_Answer ";
        ResultSet rs = stmt.executeQuery(QUERY); 
        while (rs.next()) {
            System.out.print("Unique_ID: " + rs.getInt("Unique_ID"));
            System.out.print(", Name: " + rs.getString("Name"));
            System.out.print(", 1: " + rs.getInt("1"));
            System.out.print(", 2: " + rs.getInt("2"));
            System.out.print(", 3: " + rs.getInt("3"));
            System.out.print(", 4: " + rs.getInt("4"));
        }

        return QUERY;
    }
    
}
