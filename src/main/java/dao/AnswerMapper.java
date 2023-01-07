package dao;

import entity.Answer;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnswerMapper {
    void insert(Answer answer);
    int getPaperIDByRID(int rID);
    Answer selectByRIDAndQID(int rID, int qID);

    void update(Answer answer);
}
