package com.project.springboot.board;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.project.springboot.member.User;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Table(name= "freeboard")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FreeboardDTO {
    
    @Id
    @SequenceGenerator(
       name = "SEQ_FREEBOARD",
       sequenceName = "SEQ_FREEBOARD_NO",
       initialValue = 1,
       allocationSize = 1
    )
    @GeneratedValue(generator = "SEQ_FREEBOARD")
    private Long no;
    private String title;
    private String content;
    private Date createdate;
    @ManyToOne
    @JoinColumn(name="members_no")
    private User members;
    
    public User getMembers() {
        return members;
    }

    public void setMembers(User members) {
        this.members = members;
    }
}
