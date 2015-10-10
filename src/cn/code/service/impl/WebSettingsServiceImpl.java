package cn.code.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.code.dao.impl.BaseDaoImpl;
import cn.code.domain.WebSettings;
import cn.code.service.WebSettingsService;

@Service
@Transactional
public class WebSettingsServiceImpl extends BaseDaoImpl<WebSettings> implements
    WebSettingsService {
}
