package dao;

import entity.Info;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InfoMapper {
    void insert(Info info);
    List<Info> selectByTeaNo(String teaNo);
    Info selectByPK(int iID);

    void rejectCheck(int rID);

    void handleCheck(int iid);

    List<Info> selectByStu(String no);
}
