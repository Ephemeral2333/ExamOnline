package dao;

import entity.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    List<Department> getAllDepartments();

    void deleteByPK(Integer id);
    void insert(Department department);
    void update(Department department);
    Department selectByPK(Integer id);
}
