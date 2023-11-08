package com.project.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FreeBoardService {

    private final FreeBoardRepository freeboardRepository;

    @Autowired
    public FreeBoardService(FreeBoardRepository freeboardRepository) {
        this.freeboardRepository = freeboardRepository;
    }

    @Transactional
    public  List<FreeboardDTO> getAllFreeboardPosts() {
        return freeboardRepository.findAll();
    }

    @Transactional
    public FreeboardDTO getFreeboardPostById(Long no) {
        return freeboardRepository.findById(no).orElse(null);
    }

    @Transactional
    public FreeboardDTO createFreeboardPost(FreeboardDTO post) {
        return freeboardRepository.save(post);
    }

    @Transactional
    public FreeboardDTO updateFreeboardPost(FreeboardDTO post) {
        return freeboardRepository.save(post);
    }

    @Transactional
    public void deleteFreeboardPost(Long no) {
        freeboardRepository.deleteById(no);
    }

    @Transactional
    public FreeboardDTO save(FreeboardDTO post) {
        return freeboardRepository.save(post);
    }

    public Page<FreeboardDTO> list(int page) {
        return freeboardRepository.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "no")));
    }
}
