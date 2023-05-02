package com.ispan.hangoutchill.member.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

@Entity
@Table(name="token")
public class SecuredToken {

    private static final int EXPIRATION = 60;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "token")
    private String token;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "expiration_date")
    private Date expirartionDate;

    @OneToOne(cascade= {CascadeType.PERSIST },fetch = FetchType.EAGER)
    @JoinColumn(name="FK_member_id", foreignKey=@ForeignKey(name = "member_id"))
    private NormalMember normalMember;




    public SecuredToken(NormalMember normalMember, String token) {
        this.normalMember = normalMember;
        this.token = token;
        this.expirartionDate = calculateExpirationDate(EXPIRATION);
    }

    public SecuredToken() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpirartionDate() {
        return expirartionDate;
    }

    public void setExpirartionDate(Date expirartionDate) {
        this.expirartionDate = expirartionDate;
    }

    public NormalMember getNormalMember() {
        return normalMember;
    }

    public void setNormalMember(NormalMember normalMember) {
        this.normalMember = normalMember;
    }

    private Date calculateExpirationDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance();
        Date time = cal.getTime();
        cal.setTime(new Timestamp(time.getTime()));
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        return new Date(cal.getTime().getTime());
    }
}
