package com.niit.nitit_project.service.manage.Impl;

import com.niit.nitit_project.entity.*;
import com.niit.nitit_project.model.dto.BrandDTO;
import com.niit.nitit_project.model.dto.ImageDTO;
import com.niit.nitit_project.model.dto.WatchDTO;
import com.niit.nitit_project.model.mapper.BrandMapper;
import com.niit.nitit_project.model.mapper.ImageMapper;
import com.niit.nitit_project.model.mapper.WatchMapper;
import com.niit.nitit_project.model.response.ResponseNormal;
import com.niit.nitit_project.repository.*;
import com.niit.nitit_project.sercurity.CustomUserDetails;
import com.niit.nitit_project.service.manage.ManageProductService;
import com.niit.nitit_project.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ManageProductServiceImpl implements ManageProductService {
    @Autowired
    private WatchRepository watchRepository;
    @Autowired
    private BrandRepository brandRepository;
    @Autowired
    private ImageRepository imageRepository;
    @Autowired
    private CartWatchRepository cartWatchRepository;
    @Autowired
    private OrderWatchRepository orderWatchRepository;

    private static String UPLOAD_DIR = FileUtils.getResourceBasePath()+ "\\src\\main\\resources\\static\\images\\product";
    @Value("${config.link.image}")
    String LINK_IMG;

    @Override
    public Model loadPage(Model model, WatchDTO watchDTO, Integer page, Integer limit) {
        Pageable pageable = PageRequest.of(page, limit, Sort.by("id").descending());
        if(watchDTO.getName() == null){
            //L???y danh s??ch s???n ph???m
            Page<WatchDTO> pageWatch = watchRepository.findAll(pageable).map(o-> {
                DecimalFormat df = new DecimalFormat("#,###.##");
                WatchDTO w = WatchMapper.toWatchDTO(o);
                w.setBrandName(brandRepository.findById(o.getIdBrand()).get().getName());
                w.setPriceFormat(df.format(w.getPrice()));
                w.setSalePriceFormat(df.format(w.getSalePrice()));
                return w;
            });
            model.addAttribute("listWatch", pageWatch);
        }else{
            Page<WatchDTO> pageWatch = watchRepository.findByKeyWord(watchDTO.getName(), pageable)
                    .map(o->{
                        DecimalFormat df = new DecimalFormat("#,###.##");
                        WatchDTO w = WatchMapper.toWatchDTO(o);
                        w.setBrandName(brandRepository.findById(o.getIdBrand()).get().getName());
                        w.setPriceFormat(df.format(w.getPrice()));
                        w.setSalePriceFormat(df.format(w.getSalePrice()));
                        return w;
                    });
            model.addAttribute("listWatch", pageWatch);
        }
        //L???y danh s??ch th????ng hi???u
        List<BrandDTO> brandDTOList = brandRepository.findAll()
                .stream()
                .map(o-> BrandMapper.toBrandDTO(o))
                .collect(Collectors.toList());
        model.addAttribute("listBrand", brandDTOList);
        return model;
    }

    @Override
    public ResponseNormal<?> findById(Integer id) {
        WatchDTO watchDTO = WatchMapper.toWatchDTO(watchRepository.findById(id).get());
        watchDTO.setBrandName(brandRepository.findById(watchDTO.getIdBrand()).get().getName());
        watchDTO.setImageDTOList(imageRepository.findByIdWatch(id).stream().map(o-> ImageMapper.toImageDTO(o)).collect(Collectors.toList()));
        return new ResponseNormal<>(HttpStatus.OK, "Success!", watchDTO);
    }

    @Override
    public ResponseNormal<?> uploadFile(MultipartFile multipartFile) {
        //T???o th?? m???c ch???a ???nh n???u kh??ng t???n t???i
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        //L???y t??n file v?? ??u??i m??? r???ng c???a file
        String originalFilename = multipartFile.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
        if (originalFilename.length() > 0) {

            //Ki???m tra xem file c?? ????ng ?????nh d???ng kh??ng
            if (!extension.equals("png") && !extension.equals("jpg") && !extension.equals("gif") && !extension.equals("svg") && !extension.equals("jpeg")) {
                return new ResponseNormal( HttpStatus.BAD_REQUEST, "Kh??ng h??? tr??? ?????nh d???ng file n??y!",null);
            }
            try {
                String nameFile = UUID.randomUUID().toString() + "." +extension;
                String linkFile = UPLOAD_DIR + "\\" + nameFile;
                //T???o file
                File file = new File(linkFile);
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
                bos.write(multipartFile.getBytes());
                bos.close();
                //T???o link tr??n server g???i v??? fe
                String linkImg = LINK_IMG + nameFile;
                return new ResponseNormal(HttpStatus.OK, "Upload ???nh th??nh c??ng!", linkImg);

            } catch (Exception e) {
                System.out.println("C?? l???i trong qu?? tr??nh upload file!");
            }
        }
        return new ResponseNormal(HttpStatus.BAD_REQUEST, "Kh??ng upload ???????c file n??y!", null);
    }

    @Override
    public ResponseNormal<?> addProduct(WatchDTO watchDTO) {
        //Ki???m tra m?? code s???n ph???m
        if(this.checkDuplicateCode(watchDTO.getCode())){
            return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "???? t???n t???i m?? s???n ph???m n??y!", null);
        }
        //L??u s???n ph???m
        User user = ((CustomUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal())
                .getUser();
        Watch watch = WatchMapper.toWatch(watchDTO);
        String code = watch.getCode().toUpperCase();
        watch.setCode(code);
        watch.setStatus(1);
        watch.setCreatedDate(Timestamp.valueOf(LocalDateTime.now()));
        watch.setCreatedBy(user.getId());
        Watch newWatch = watchRepository.save(watch);
        //L??u ???nh s???n ph???m
        for(ImageDTO o : watchDTO.getImageDTOList()){
            Image image = ImageMapper.toImage(o);
            image.setIdWatch(newWatch.getId());
            image.setCreatedDate(Timestamp.valueOf(LocalDateTime.now()));
            try{
                imageRepository.save(image);
            }catch (Exception e){
                return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "C?? l???i khi th??m s???n ph???m ", null);
            }
        }
        return new ResponseNormal<>(HttpStatus.OK, "Th??m s???n ph???m th??nh c??ng!", null);
    }

    @Override
    public ResponseNormal<?> deleteProduct(Integer id) {
        //Ki???m tra s???n ph???m trong cart
        List<CartWatch> cartWatches = cartWatchRepository.findByIdWatch(id);
        if(cartWatches.size() > 0){
            return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "V???n c??n s???n ph???m trong gi??? h??ng, kh??ng ???????c x??a!", null);
        }
        //Ki???m tra s???n ph???m trong order
        List<OrderWatch> orderWatchList = orderWatchRepository.findByIdWatch(id);
        if(orderWatchList.size() > 0){
            return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "V???n c??n s???n ph???m trong ????n ?????t h??ng, kh??ng ???????c x??a!", null);
        }
        //X??a c??c ???nh li??n quan
        List<Image> images = imageRepository.findByIdWatch(id);
        for(Image image: images){
            //X??a ???nh tr??n ??? ????a
            FileUtils.deleteFile(UPLOAD_DIR, image.getLink().substring(16));
            //X??a ???nh tr??n db
            try{
                imageRepository.delete(image);
            }catch (Exception e){
                return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "C?? l???i khi x??a ???nh s???n ph???m!", null);
            }
        }
        //X??a s???n ph???m
        try{
            watchRepository.deleteById(id);
        }catch (Exception e){
            return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "C?? l???i khi x??a s???n ph???m!", null);
        }
        return new ResponseNormal<>(HttpStatus.OK, "X??a s???n ph???m th??nh c??ng!", null);
    }

    @Override
    public ResponseNormal<?> updateProduct(WatchDTO watchDTO) {
        Optional<Watch> watchOptional = watchRepository.findByCode(watchDTO.getCode().toUpperCase());
        if(watchOptional.isPresent() && !watchOptional.get().getId().equals(watchDTO.getId())){
            return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "M?? s???n ph???m ???? t???n t???i, vui l??ng nh???p l???i!", null);
        }

        if(watchDTO.getImageDTOList().size() > 0){
            //X??a ???nh c?? l??u l???i ???nh m???i
            List<Image> images = imageRepository.findByIdWatch(watchDTO.getId());
            images.forEach(image -> {
                //X??a ???nh tr??n ??? ????a
                FileUtils.deleteFile(UPLOAD_DIR, image.getLink().substring(16));
                imageRepository.delete(image);
            });
            watchDTO.getImageDTOList().forEach(o -> {
                Image image = ImageMapper.toImage(o);
                image.setCreatedDate(Timestamp.valueOf(LocalDateTime.now()));
                image.setIdWatch(watchDTO.getId());
                imageRepository.save(image);
            });
        }
        User user = ((CustomUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal())
                .getUser();
        Watch watch = WatchMapper.toWatch(watchDTO);
        watch.setModifiedDate(Timestamp.valueOf(LocalDateTime.now()));
        watch.setModifiedBy(user.getId());
        try{
            watchRepository.save(watch);
            return new ResponseNormal<>(HttpStatus.OK, "S???a s???n ph???m th??nh c??ng!", null);
        }catch (Exception e){
            return new ResponseNormal<>(HttpStatus.BAD_REQUEST, "C?? l???i khi s???a s???n ph???m!", null);
        }
    }

    public Boolean checkDuplicateCode(String code){
        Optional<Watch> watch = watchRepository.findByCode(code.toUpperCase());
        if(watch.isPresent()){
            return true;
        }
        return false;
    }
}
