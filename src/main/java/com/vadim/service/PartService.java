package com.vadim.service;

import com.vadim.entity.Part;
import com.vadim.exception.ResourceNotFoundException;
import org.springframework.data.domain.Page;

public interface PartService {

    Page<Part> getParts(int page, int filter);

    void savePart(Part part);

    Part getPart(int id) throws ResourceNotFoundException;

    void deletePart(int id);

    int getMinCountTruePart();

    Page<Part> getSearchPart(String name);
}
