package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Option {
    private int optID;
    private String optA;
    private String optB;
    private String optC;
    private String optD;
}
