package com.ispan.hangoutchill.member.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "role")
public class Role {

    @Id
    @Column(name = "role_id")
    private Integer roleId;

    @Column(name="role_name")
    private String roleName;

    @OneToMany(mappedBy = "role")

    private Collection<NormalMember> normalMember;

//    @OneToMany(mappedBy = "role")
//    private Collection<Admin> admin;


    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public Collection<NormalMember> getNormalMember() {
        return normalMember;
    }

    public void setNormalMember(Collection<NormalMember> normalMember) {
        this.normalMember = normalMember;
    }
}
