package ru.alex.servlet;

import ru.alex.entity.Constant;
import ru.alex.entity.Point;
import ru.alex.entity.Result;
import ru.alex.entity.ResultsListBean;
import com.google.gson.Gson;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Reader;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        long time = System.nanoTime();

        Point point = parsePoint(req.getReader());

        if (point == null || !validate(point)) {
            System.out.println("Er3");
            resp.getWriter().println("Your input is not valid.");
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        List<Result> results = ((ResultsListBean) req.getSession()
                .getAttribute(Constant.ATTRIBUTE_NAME)).getResults();

        results.add(new Result(
                results.size() + 1,
                point, isOnPlot(point),
                LocalDateTime.now(),
                (int) ((System.nanoTime() - time) / 1000)
        ));

        resp.getWriter().println(results.stream()
                .map(Result::toString)
                .collect(Collectors.joining()));

    }

    private Point parsePoint(Reader reader) {
        try {
            return new Gson().fromJson(reader, Point.class);
        } catch (Exception ex) {
            return null;
        }
    }

    private boolean validate(Point point) {
        double x = point.getX(), r = point.getR(), y = point.getY();

        return (point.isClicked() || (r % 1 == 0 && r >= 1 && r <= 5) &&
                (x > -5 && x < 5) &&
                List.of(-2.0, -1.5, -1, -0.5, 0.0 , 0.5, 1.0, 1,5, 2.0).contains(y));
    }

    private boolean isOnPlot(Point point) {
        double x = point.getX(), y = point.getY(), r = point.getR();
        return (x <= 0 && x >= -r && y <= 0 && y >= -r &&   x + y >= -r) || //triangle
                (x <= 0 && x >= (-r)/2 && y >= 0 && y <= r )  ||//rectangle
                (x >= 0 && y <= 0 && Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow((r/2), 2)); //circle
    }
}
