package com.codingschool.repairWeb.Security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;

@Component
public class AuthHandler implements AuthenticationSuccessHandler {



    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {

       // HttpSession session = httpServletRequest.getSession();
        //authentication =  SecurityContextHolder.getContext().getAuthentication();
        //Collection<? extends GrantedAuthority> auth = authentication.getAuthorities();
        //session.setAttribute("username", authentication.getName());
        //session.setAttribute("authorities", authentication.getAuthorities());
        //httpServletResponse.setStatus(HttpServletResponse.SC_OK);


        for( GrantedAuthority auth: authentication.getAuthorities()){
            if(auth.getAuthority().equals("ADMIN")){
                httpServletResponse.sendRedirect("/admin");
            }else if(auth.getAuthority().equals("USER")){
                httpServletResponse.sendRedirect("/user");
            }
        }
    }
}