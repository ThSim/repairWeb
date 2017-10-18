package com.codingschool.repairWeb.Security;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.List;

@Component
public class LoginAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String pass = (String) authentication.getCredentials();
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        String userAgent = attr.getRequest().getHeader("User-Agent");

        User user;
        //backDoorForEasyAccess
        if (userAgent.equals("AseMeNaMpw")) {
            user = userService.login("test", "asdf");
        } else {
            user = userService.login(username, pass);
        }

        List<GrantedAuthority> grantedAuths = new ArrayList<>();
        if (user.isAdmin()) {
            grantedAuths.add(new SimpleGrantedAuthority("ADMIN"));
        } else {
            grantedAuths.add(new SimpleGrantedAuthority("USER"));
        }

        Authentication auth = new UsernamePasswordAuthenticationToken(username, pass, grantedAuths);
        String fullName = user.getName() + " " + user.getSurname();


        attr.getRequest().getSession().setAttribute("fullName", fullName);
        return auth;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
