package code.controllers;

import code.model.pojo.User;
import code.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by admin on 27.04.2017.
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String doGet() {
        return "register/register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView register(@RequestParam(value = "login", required = false) String login,
                               @RequestParam(value = "password", required = false) String password,
                               @RequestParam(value = "email", required = false) String mail){

        User user =userService.validateUser(login,password,mail);
        boolean error=false;
        ModelAndView mav = new ModelAndView();

        mav.addObject("registerLogin", "");
        mav.addObject("registerPassword", "");
        mav.addObject("registerMail", "");

        if(user.getLogin().equals("@Error1")){
            mav.addObject("registerLogin", "Логин может состоять из латинских символов и цифр, а так же размер не должен быть меньше 2-х символ и не должен превышать 16 символов");
            error=true;
        }
        if(user.getLogin().equals("@Error2")){
            mav.addObject("registerLogin", "Пользователь с таким логином уже существует");
            error=true;
        }
        if(user.getPassword().equals("@Error1")){
            mav.addObject("registerPassword", "Пароль может состоять из латинских символов и цифр, а так же размер не должен быть меньше 8-ми символов и не должен превышать 16 символов");
            error=true;
        }
        if(user.getMail().equals("@Error1")){
            mav.addObject("registerMail", "Mail может состоять из латинских символов, цифр и знаков: \'@\',\'-\',\'.\', а так же размер не должен быть меньше 8-ми символ и не должен превышать 16 символов");
            error=true;
        }
        if(user.getMail().equals("@Error2")){
            mav.addObject("registerMail", "Пользователь с таким emal уже существует");
            error=true;
        }
        if(error){
            mav.setViewName("register/register");
        }
        else {
            userService.addUser(user);
            mav.addObject("mess","Вы успешно зарегистрировались, для входа введите логин и пароль");
            mav.setViewName("redirect:/");
        }
        System.out.println(user);

        return mav;
    }
}
