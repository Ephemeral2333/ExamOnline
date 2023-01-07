package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Answer {
    private int aID;
    private String stuID;
    private int paperID;
    private int qID;
    private String content;
    private int score;
    private String note;
    private int rID;
}
