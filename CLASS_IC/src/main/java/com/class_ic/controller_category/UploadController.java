package com.class_ic.controller_category;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.class_ic.service.BoardService;
import com.class_ic.util.MediaUtils;
import com.class_ic.util.UploadFileUtils;



@Controller
public class UploadController {
	
	
	  @Autowired
	  private BoardService service;
	  
	
	
  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

  @Resource(name = "uploadPath")
  private String uploadPath;
  
  @RequestMapping(value = "board/uploadForm.htm", method = RequestMethod.GET)
  public void uploadForm() {
  }

  @RequestMapping(value = "board/uploadForm.htm", method = RequestMethod.POST)
  public String uploadForm(MultipartFile file, Model model) throws Exception {

    logger.info("originalName: " + file.getOriginalFilename());
    logger.info("size: " + file.getSize());
    logger.info("contentType: " + file.getContentType());

    String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

    model.addAttribute("savedName", savedName);

    return "uploadResult";
  }

  @RequestMapping(value = "board/uploadAjax.htm", method = RequestMethod.GET)
  public void uploadAjax() {
	  System.out.println("upload AJAX");
  }
  
  private String uploadFile(String originalName, byte[] fileData) throws Exception {

    UUID uid = UUID.randomUUID();

    String savedName = uid.toString() + "_" + originalName;

    File target = new File(uploadPath, savedName);

    FileCopyUtils.copy(fileData, target);

    return savedName;

  }
  
  @ResponseBody
  @RequestMapping(value ="board/uploadAjax.htm", method=RequestMethod.POST, 
                  produces = "text/plain;charset=UTF-8")
  public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
    System.out.println("AJAXUpLOAD 접속!!!!!");
    logger.info("originalName: " + file.getOriginalFilename());
    
    
    
    
    return 
      new ResponseEntity<String>(
          UploadFileUtils.uploadFile(uploadPath, 
                file.getOriginalFilename(), 
                file.getBytes()), 
          HttpStatus.CREATED);
  }
  
  
  @ResponseBody
  @RequestMapping("board/displayFile.htm")
  public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{
    
    InputStream in = null; 
    ResponseEntity<byte[]> entity = null;
    
    logger.info("FILE NAME: " + fileName);
    
    try{
      
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
      MediaType mType = MediaUtils.getMediaType(formatName);
      
      HttpHeaders headers = new HttpHeaders();
      
      in = new FileInputStream(uploadPath+fileName);
      
      if(mType != null){
        headers.setContentType(mType);
      }else{
        
        fileName = fileName.substring(fileName.indexOf("_")+1);       
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition", "attachment; filename=\""+ 
          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
      }

        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
          headers, 
          HttpStatus.CREATED);
    }catch(Exception e){
      e.printStackTrace();
      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
    }finally{
      in.close();
    }
      return entity;    
  }
    
  @ResponseBody
  @RequestMapping(value="board/deleteFile.htm", method=RequestMethod.POST)
  public ResponseEntity<String> deleteFile(String fileName){
    
    logger.info("delete file: "+ fileName);
    
    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
    
    MediaType mType = MediaUtils.getMediaType(formatName);
    
    if(mType != null){      
      
      String front = fileName.substring(0,12);
      String end = fileName.substring(14);
      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
    }
    
    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
    
    
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }  
  
  @ResponseBody
  @RequestMapping(value="board/deleteAllFiles.htm", method=RequestMethod.POST)
  public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
    
    logger.info("delete all files: "+ files);
    
    if(files == null || files.length == 0) {
      return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    
    for (String fileName : files) {
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
      MediaType mType = MediaUtils.getMediaType(formatName);
      
      if(mType != null){      
        
        String front = fileName.substring(0,12);
        String end = fileName.substring(14);
        new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
      }
      
      new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
      
    }
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }  
  
  //HttpServletRequest request, HttpServletResponse response
  //subcate AJAX
  
  @RequestMapping
  (value="board/cate_option.htm", method=RequestMethod.POST)
  public String subcateAJAX(Model model,String temp) throws Exception{
	
	  System.out.println("★컨트롤러 접속 : subcateAJAX");
	  System.out.println(temp);
	  System.out.println(service.getSubCateList(temp));
	  
	  model.addAttribute("subCateList", service.getSubCateList(temp));
	  
	  return "common/AjaxTemp_cate_option";
	  
  }  
}
//  @ResponseBody
//  @RequestMapping(value = "/uploadAjax", 
//                 method = RequestMethod.POST, 
//                 produces = "text/plain;charset=UTF-8")
//  public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
//
//    logger.info("originalName: " + file.getOriginalFilename());
//    logger.info("size: " + file.getSize());
//    logger.info("contentType: " + file.getContentType());
//
//    return 
//        new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
//  }

// @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
// public void uploadForm(MultipartFile file, Model model) throws Exception {
//
// logger.info("originalName: " + file.getOriginalFilename());
// logger.info("size: " + file.getSize());
// logger.info("contentType: " + file.getContentType());
//
// String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//
// model.addAttribute("savedName", savedName);
//
// }
//
// private String uploadFile(String originalName, byte[] fileData)throws
// Exception{
//
// UUID uid = UUID.randomUUID();
//
// String savedName = uid.toString() + "_"+ originalName;
//
// File target = new File(uploadPath,savedName);
//
// FileCopyUtils.copy(fileData, target);
//
// return savedName;
//
// }