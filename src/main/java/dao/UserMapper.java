package dao;

import entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    String getUserPassword(String uid);
    void addUser(User user);
    User findByUsername(String username);

    User selectUser(String no);

    void updateUser(User user);
}
