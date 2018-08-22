package com.db.jobportal.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.db.jobportal.model.RegisterUserDocuments;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.GetLoggedInUserUtil;

@Controller
public class ManageProfileController {
	
	@Autowired
	private RegisterUserServiceImpl registeredUserService;
	GetLoggedInUserUtil gliu = new GetLoggedInUserUtil();
	@RequestMapping("/manageprofile")
	public ModelAndView manageProfile()
	{
		String message = "";  
        return new ModelAndView("manageprofile", "message", message);  
	}
	
	
	private static final String UPLOAD_DIRECTORY ="/images";  
    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB  
      
    @RequestMapping("uploadform")  
    public String uploadForm(@ModelAttribute RegisterUserDocuments registerUserDocuments, BindingResult result,HttpServletRequest request,Map<String, Object> map) throws Exception  
    {  RegisterUserDocuments rud = new RegisterUserDocuments();
    	map.put("RegisterUserDocuments", rud);
		map.put("registeredUserDocumentList", registeredUserService.listAll(gliu.getTheLoggedInUser().getUsername()));
		return "uploadform";
    }  
    
    @RequestMapping(value = {"download-document-{registeredUserDocumentEmail}-{registeredUserDocumentId}"}, method = RequestMethod.GET)
    public void downloadDocument(@PathVariable String  registeredUserDocumentEmail, @PathVariable Integer registeredUserDocumentId, HttpServletResponse response) throws IOException {
       
    	RegisterUserDocuments ruds = registeredUserService.findById(registeredUserDocumentEmail,registeredUserDocumentId);
    	response.setContentType(ruds.getType());
    	response.setContentLength(ruds.getFilecont().length);
    	response.setHeader("Content-Disposition", "attachment; filename=\"" + ruds.getFilename() +"\"");
    	FileCopyUtils.copy(ruds.getFilecont(), response.getOutputStream());
    	
    	
    }
    
    @RequestMapping(value = { "/delete-document-{registeredUserDocumentEmail}-{registeredUserDocumentId}" }, method = RequestMethod.GET)
    public String deleteDocument(@ModelAttribute RegisterUserDocuments registerUserDocuments,@PathVariable String registeredUserDocumentEmail, @PathVariable int registeredUserDocumentId,Map<String, Object> map) {
    	registeredUserService.deleteRegisterUserDocuments(registeredUserDocumentEmail, registeredUserDocumentId);
    	RegisterUserDocuments rud = new RegisterUserDocuments();
    	map.put("RegisterUserDocuments", rud);
		map.put("registeredUserDocumentList", registeredUserService.listAll(gliu.getTheLoggedInUser().getUsername()));
		return "uploadform";
       
    }
    
      
    @RequestMapping(value="savefile",method=RequestMethod.POST)  
    public String  saveimage(@ModelAttribute RegisterUserDocuments registerUserDocuments, BindingResult result,@RequestParam CommonsMultipartFile file,HttpServletRequest request,Map<String, Object> map) throws Exception  
    {  

    	
    	if(file.getSize() > 5112337)
    	{
    		return  "MoredocSizeMsg";
    		
    	}
    	RegisterUserDocuments rud = new RegisterUserDocuments();
    	rud.setId(getRandomUid());
    	rud.setFilecont(file.getBytes());
    	
    	System.out.println(file.getBytes().toString()+"just testing................"+file.getSize());//5112337
    	rud.setFilename(file.getOriginalFilename());
    	rud.setEmail(gliu.getTheLoggedInUser().getUsername());
    	rud.setDescription(request.getParameter("description"));
    	rud.setType(file.getOriginalFilename().substring(file.getOriginalFilename().indexOf('.')+1,file.getOriginalFilename().length()));
    	registeredUserService.saveRegisterUserDocuments(rud);

	
		
	
		
		map.put("RegisterUserDocuments", rud);
		map.put("registeredUserDocumentList", registeredUserService.listAll(gliu.getTheLoggedInUser().getUsername()));
		return "uploadform";
    	
    	
    	
    	
    }  
    public static Integer getRandomUid(){
		Random r =new Random();
		int i = r.nextInt(12548);
		ArrayList<Integer> list = new ArrayList<Integer>();
		  for (int i1=i; i1<18729; i1++) {
		        list.add(new Integer(i));
		    }
		  Collections.shuffle(list);
		  
		  int j = r.nextInt(10);
		  return list.get(j);
		
		
		
		
		
	}
	

}
