package com.ispan.hangoutchill.member;


import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailServiceImpl implements UserDetailsService {


    @Autowired
    NormalMemberRepository nMemberRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        NormalMember normalMembers = nMemberRepository.findNormalMembersByAccount(username);
        if(normalMembers == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return new UserDetail(normalMembers);
    }

//    private List<GrantedAuthority> getGrantedAuthority (Role role){
//        List<GrantedAuthority> authorities = new ArrayList<>();
//        authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
//       System.out.println(authorities);
//        return  authorities;
//    }


}
