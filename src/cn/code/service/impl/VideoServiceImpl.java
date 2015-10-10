package cn.code.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.Video;
import cn.code.service.VideoService;

@Service
@Transactional
public class VideoServiceImpl extends BaseDaoImpl<Video> implements
    VideoService {

}
