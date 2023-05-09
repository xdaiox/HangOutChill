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

    @OneToMany(mappedBy = "role")
    private Collection<LocationMember> locationMembers;
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



}
