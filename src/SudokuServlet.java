import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * Created by IntelliJ IDEA.
 * User: Юрий
 * Date: 07.02.15
 * Time: 2:37
 * To change this template use File | Settings | File Templates.
 */

@WebServlet("/answer")
public class SudokuServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String temp = req.getParameter("sudoku");
        temp = temp.replaceAll("\t", "");
        String SudString[] = temp.split("\r\n");

        resp.setContentType("text/plain");


        PrintWriter pw = resp.getWriter();

        int count = 0;
        int[][] sudoku = new int[9][9];

        while(count < 9) {
            String s = "";
            s = SudString[count];
            String[] sArr = s.split(" ");

            for(int i = 0; i < 9; i++) {
                sudoku[count][i] = Integer.parseInt(sArr[i]);
            }
            count++;
        }

        String ans = "";

        try {
            ans =  WiseSolver.doSolve(sudoku);
        } catch (Exception e) {
            ans = "999";
        }


        req.setAttribute("answer", ans);

        pw.println(ans);

        pw.close();
    }
}
