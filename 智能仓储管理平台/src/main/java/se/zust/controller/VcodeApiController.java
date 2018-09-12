package se.zust.controller;

import io.swagger.annotations.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/ssm")
@Api(description = "验证码接口")
public class VcodeApiController {

    public static final int WIDTH = 120;
    public static final int HEIGHT = 25;

    @ApiOperation(value = "验证码", notes = "获取验证码")
    @ApiResponses(value = {@ApiResponse(code = 200, message = "获取成功")})
    @RequestMapping(value = "/doGetVcode", method = RequestMethod.GET)
    @ResponseBody
    public void doGetVcode(HttpServletRequest request, HttpServletResponse response)throws IOException {
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

        Graphics g = image.getGraphics();

        //1、设置背景色
        setBackGround(g);

        //2、设置边框
//        setBorder(g);

        //3、画干扰线
        drawRandomLine(g);

        //4、写随机数
        String vcode = drawRandomNum((Graphics2D) g);
        request.getSession().setAttribute("vcode",vcode);

        //5、控制游览器不缓存图片
        response.setDateHeader("expries", -1);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");

        //6、图形写给游览器
        response.setContentType("image/jpeg");
        ImageIO.write(image, "jpg", response.getOutputStream());

    }

    private void setBackGround(Graphics g) {
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, WIDTH, HEIGHT);
    }

    private void setBorder(Graphics g) {
        g.setColor(Color.BLUE);
        g.drawRect(0, 0, WIDTH, HEIGHT);
    }

    private void drawRandomLine(Graphics g) {
        g.setColor(Color.GREEN);
        for (int i = 0; i < 5; i++) {
            int x1 = new Random().nextInt(WIDTH);
            int y1 = new Random().nextInt(HEIGHT);

            int x2 = new Random().nextInt(WIDTH);
            int y2 = new Random().nextInt(HEIGHT);

            g.drawLine(x1, y1, x2, y2);
        }
    }

    private String drawRandomNum(Graphics2D g) {
        g.setColor(Color.RED);
        g.setFont(new Font("宋体", Font.BOLD, 20));

        int x = 10;
        StringBuffer buffer = new StringBuffer();
        int base[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
        for (int i = 0; i < 4; i++) {
            //旋转
            int degree = new Random().nextInt() % 30;
            int in = base[new Random().nextInt(10)];
            String ch = in + "";
            buffer.append(ch);
            g.rotate(degree * Math.PI / 180, x, 20);
            g.drawString(ch, x, 20);
            g.rotate(-degree * Math.PI / 180, x, 20);
            x += 30;
        }
        return buffer.toString();
    }
}