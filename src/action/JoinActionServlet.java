package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.*;


@WebServlet("/JoinActionServlet")
public class JoinActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinActionServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		//현재 세션 상태를 체크함.
				String userID = null;
				HttpSession session = request.getSession(); //session 만들기
				User user = new User();
				if (session.getAttribute("userID") != null) {
					userID = (String) session.getAttribute("userID"); //Attribute는 Object타입으로 String으로 형변환해야한다.
				}
				if (userID != null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 로그인 되어되어있습니다.')");
					script.println("location.href='main.jsp");
					script.println("</script>");
				}

				if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
						|| user.getUserGender() == null || user.getUserEmail() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('빈칸있음')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					UserDAO userDAO = new UserDAO();
					int result = userDAO.join(user);
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('이미 존재하는 아이디입니다.')");
						script.println("history.back()");
						script.println("</script>");
					} else {
						session.setAttribute("userID", user.getUserID());
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('축하드립니다. 아이디가 생성되었습니다.')");
						script.println("location.href = 'main.jsp'");
						script.println("</script>");
					}
				}
	}

}
