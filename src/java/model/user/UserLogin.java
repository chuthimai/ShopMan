/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

/**
 *
 * @author maichu
 */
public class UserLogin {
    final private static UserLogin userLoggin = new UserLogin();
    private User082 user;

    public UserLogin() {
    }

    public User082 getUser() {
        return user;
    }

    public void setUser(User082 user) {
        this.user = user;
    }
    
    public void forgetUser() {
        this.user = null;
    }
    
}
