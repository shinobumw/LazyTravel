package com.lazytravel.customer.util;

import javax.servlet.http.HttpServletRequest;

public class Utils {
    public static String generateAuthCode() {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 8; i++) {
            int condition = (int) (Math.random() * 3) + 1;
            switch (condition) {
                case 1:
                    char c1 = (char) ((int) (Math.random() * 26) + 65);
                    sb.append(c1);
                    break;
                case 2:
                    char c2 = (char) ((int) (Math.random() * 26) + 97);
                    sb.append(c2);
                    break;
                case 3:
                    sb.append((int) (Math.random() * 10));
            }
        }
        return sb.toString();
    }

    public static String getPath(HttpServletRequest req, String destination) {
        return req.getScheme() +
                "://" +
                req.getServerName() +
                ":" +
                req.getServerPort() +
                "/" +
                req.getContextPath() +
                destination;
    }
}
