package org.qq.office.service.impl;

import org.qq.office.mapper.OfficeMapper;
import org.qq.office.model.Office;
import org.qq.office.service.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OfficeServerImpl implements OfficeService {
    @Autowired
    private OfficeMapper officeMapper;

    @Override
    public Office selectById(String id) {
        return officeMapper.selectById(id);
    }

    @Override
    public List<Office> selectAll() {
        return officeMapper.selectAll();
    }

    @Override
    public int insertOffice(Office office) {
        return officeMapper.insertOffice(office);
    }
}
