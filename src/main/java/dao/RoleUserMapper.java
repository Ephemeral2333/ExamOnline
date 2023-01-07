package dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoleUserMapper {
    void insert(int rid, String uid);
    int selectRoleNameByUid(String uid);
    void deleteByPK(Integer rid, String uid);
}
