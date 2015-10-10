package cn.code.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Friends;
import cn.code.service.FriendsService;

@Service
@Transactional
public class FriendsServiceImpl extends BaseDaoImpl<Friends> implements
    FriendsService {

}
