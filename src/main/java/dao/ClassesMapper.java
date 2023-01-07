package dao;

import entity.Classes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClassesMapper {
    List<Classes> findAll();
    Classes selectByPK(Integer id);
    void insert(Classes classes);
    void update(Classes classes);
    void deleteByPK(Integer id);
}
