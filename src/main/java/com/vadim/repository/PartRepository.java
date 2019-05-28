package com.vadim.repository;

import com.vadim.entity.Part;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("partRepository")
public interface PartRepository extends JpaRepository<Part, Integer> {

    @Query
    Page<Part> findByNeedTrue(Pageable pageable);

    @Query
    List<Part> findByNeedTrue();

    @Query
    Page<Part> findByNeedFalse(Pageable pageable);

    @Query
    Page<Part> findByName(Pageable pageable, String name);
}
