package dao;

import entity.Major;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MajorMapper {
    List<Major> selectAll();
    Major selectById(int id);
    void insert(Major major);
    void update(Major major);
    void deleteByPK(int id);
}
