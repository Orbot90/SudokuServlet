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

@WebServlet("/SudokuServ")
public class SudokuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] ans = {"Вы не ввели судоку для решения."};
        req.setAttribute("answer", ans);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/answer.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String temp = req.getParameter("sudoku");
        temp = temp.replaceAll("\t", "");
        String SudString[] = temp.split("\r\n");

        resp.setContentType("text/html");


//        PrintWriter pw = resp.getWriter();

        int count = 0;
        int[][] sudoku = new int[9][9];

        while(count < 9) {
            String s = "";
            try {
                s = SudString[count];
            } catch (Exception e) {
                resp.sendRedirect("/SudokuServlet/error.html");
                return;
            }
            String[] sArr = s.split(" ");

            for(int i = 0; i < 9; i++) {
                try {
                    sudoku[count][i] = Integer.parseInt(sArr[i]);
                } catch (Exception e) {
                    resp.sendRedirect("/error.html");
                    return;
                }
            }
            count++;
        }

        String[] ans = null;

        try {
            ans =  WiseSolver.doSolve(sudoku);
        } catch (Exception e) {
            resp.sendRedirect("/error.html");
            return;
        }


        req.setAttribute("answer", ans);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/answer.jsp");
        rd.forward(req, resp);
        return;

 /*       pw.println("<html><body>");
        pw.println("The answer is: <br /> <br />");
        pw.println("<code>");
        for(String s : answer) {
            pw.println(s + "<br />");
        }
        pw.println("</code>");
        pw.println("</body></html>");
        pw.close(); */
    }
}
