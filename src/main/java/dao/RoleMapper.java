package dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Set;

@Mapper
public interface RoleMapper {
    Set<String> listRoles(String uid);
}
