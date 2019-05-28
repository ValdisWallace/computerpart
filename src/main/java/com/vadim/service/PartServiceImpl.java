package com.vadim.service;

import com.vadim.entity.Part;
import com.vadim.exception.ResourceNotFoundException;
import com.vadim.repository.PartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PartServiceImpl implements PartService {

    @Autowired
    private PartRepository partRepository;

    @Override
    @Transactional
    public Page<Part> getParts(int page, int filter) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Part> result;

        if (filter == 1)
            result = partRepository.findByNeedTrue(pageable);
        else if (filter == 2)
            result = partRepository.findByNeedFalse(pageable);
        else
            result = partRepository.findAll(pageable);

        return result;
    }

    @Transactional
    public Page<Part> getSearchPart(String name) {
        return partRepository.findByName(PageRequest.of(0, 1), name);
    }

    @Transactional
    public int getMinCountTruePart() {
        final int[] count = {Integer.MAX_VALUE};
        partRepository.findByNeedTrue().forEach(k -> {
            if (k.getCount() < count[0])
                count[0] = k.getCount();
        });

        return count[0];
    }

    @Override
    @Transactional
    public void savePart(Part part) {
        partRepository.save(part);
    }

    @Override
    @Transactional
    public Part getPart(int id) throws ResourceNotFoundException {
        return partRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException(id));
    }

    @Override
    @Transactional
    public void deletePart(int id) {
        partRepository.deleteById(id);
    }
}
