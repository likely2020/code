package cn.code.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.VideoCategory;
import cn.code.service.VideoCategoryService;

@Service
@Transactional
public class VideoCategoryServiceImpl extends BaseDaoImpl<VideoCategory>
    implements VideoCategoryService {

}
