package com.codingschool.repairWeb.Security;

import com.codingschool.repairWeb.Exceptions.InvalidCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    private static final String ERROR_MSG = "errorMsg";

    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        if (exception instanceof InvalidCredentialsException) {
            request.getSession().setAttribute(ERROR_MSG, "Wrong username or password. Please try again.");
        } else {
            request.getSession().setAttribute(ERROR_MSG, "Login currently not available.Please try later");
        }

        RedirectStrategy redirectStrategy = super.getRedirectStrategy();
        redirectStrategy.sendRedirect(request, response, "/");

    }

}
