package dao;

import entity.Bank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BankMapper {
    List<Bank> findAll();
    void insert(Bank bank);
    void update(Bank bank);
    void delete(int id);
    Bank selectByPK(int id);
    List<Bank> selectByTeaNo(String tno);

    int getBankNum();

    List<Bank> findByCourseID(String cid);
}
