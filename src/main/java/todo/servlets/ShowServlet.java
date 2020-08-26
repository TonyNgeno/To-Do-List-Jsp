package todo.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import todo.model.Todo;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShowServlet extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Map> list =new ArrayList<Map>();//Create a list collection for key-value pairs stored in a map


        ServletContext scx = getServletContext();
        Connection dbConnection = (Connection) scx.getAttribute("dbConnection");
        resp.setContentType("text/plain");

        List<Todo> todos = new ArrayList<Todo>();

        try {
            PreparedStatement statement = dbConnection.prepareStatement("SELECT * FROM todos");
            statement.execute();
            ResultSet result = statement.getResultSet();

            while (result.next()){
              String title = result.getString("title");
              String description = result.getString("description");

              Map map = new HashMap();
              map.put("title", title);
              map.put("description", description);

              list.add(map);

            }

        }catch (SQLException sqlEx){
            sqlEx.printStackTrace();
        }

     /*   ObjectMapper mapper = new ObjectMapper();
        resp.getWriter().print(mapper.writeValueAsString(todos));*/
        req.setAttribute("key_list",list);//Put list collection data into request for sharing
        req.getRequestDispatcher("/todo.jsp").forward(req, resp);
        //Jump to index.jsp page

    }


}
