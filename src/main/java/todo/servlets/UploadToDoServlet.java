package todo.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import todo.model.Todo;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/uploadServlet")
public class UploadToDoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext scx = getServletContext();
        Connection dbConnection = (Connection) scx.getAttribute("dbConnection");
        resp.setContentType("text/plain");

        List<Todo> todos = new ArrayList<Todo>();

        try {
            PreparedStatement statement = dbConnection.prepareStatement("SELECT * FROM todos");
            statement.execute();
            ResultSet result = statement.getResultSet();

            while (result.next()){
                Todo todo = new Todo();
                todo.setTitle(result.getString("title"));
                todo.setDescription(result.getString("description"));

                todos.add(todo);
            }

        }catch (SQLException sqlEx){
            sqlEx.printStackTrace();
        }

        ObjectMapper mapper = new ObjectMapper();
        resp.getWriter().print(mapper.writeValueAsString(todos));

    }

    protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ServletContext scx = getServletContext();
        Connection dbConnection = (Connection) scx.getAttribute("dbConnection");

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        try {
            PreparedStatement statement = dbConnection.prepareStatement("insert into todos(title,description) values(?, ?)");
            statement.setString(1, title);
            statement.setString(2, description);
            statement.executeUpdate();

            response.sendRedirect("index.jsp");

        }catch (SQLException sqlEx){
            sqlEx.printStackTrace();
        }

    }


}
