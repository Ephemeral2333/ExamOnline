package dao;

import entity.Option;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OptionMapper {
    Option selectByPK(int questionID);
}
