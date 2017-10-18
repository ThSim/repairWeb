package com.codingschool.repairWeb.Security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private LoginAuthenticationProvider loginAuthenticationProvider;

    @Autowired
    private AuthHandler authHandler;

    @Autowired
    private LoginFailureHandler loginFailureHandler;

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/imgs/**", "/js/**", "/css/**", "/", "/contact", "/about").permitAll()
                .antMatchers("/admin/**").hasAuthority("ADMIN")
                .antMatchers("/user/**").hasAuthority("USER")
                .anyRequest().fullyAuthenticated()
                //.and().csrf().disable()
                .and()
                .formLogin().successHandler(authHandler)
                .failureHandler(loginFailureHandler)
                .loginPage("/")
                .permitAll()
                .usernameParameter("email")
                .passwordParameter("pass")
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                //.logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .permitAll();

       /* http
                .authorizeRequests()
                .antMatchers("/", "/about").permitAll()
                .antMatchers("/admin", "/user").hasAnyRole("ADMIN","USER")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/")
                .permitAll()
                .and()
                .logout()
                .permitAll();*/

//        http.csrf().requireCsrfProtectionMatcher(new AntPathRequestMatcher("**/"))
//                .and().formLogin().defaultSuccessUrl("/add")
//                .loginPage("/");

//        http.csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/", "/contact", "/about").permitAll()
//                .antMatchers("/admin/**").hasAnyRole("ADMIN")
//                .antMatchers("/user/**").access("hasRole('USER')")
//                .antMatchers("/add").authenticated()
//                .anyRequest().authenticated()
//                .and()
//                .formLogin()
//                .loginPage("/")
//                .defaultSuccessUrl("/add")
//                .permitAll()
//                .and()
//                .logout()
//                .permitAll();
//                .and()
//                .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
    }


    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        //auth.userDetailsService(userDetailsService);
        auth.authenticationProvider(loginAuthenticationProvider);
    }

    //SSL configuration (Redirect http to https)
}
