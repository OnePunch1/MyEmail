package Fileload;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.MailDao;
import dao.MailDaoImp;
import entity.Email;

public class FileLoad {
	 // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	public static Email fileLoad(HttpServletRequest req,Email email) {
		MailDao ma=new MailDaoImp();
		Integer sendid=new Integer(0);
		 String filepath="";
		DiskFileItemFactory factory = new DiskFileItemFactory();
	        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
	    factory.setSizeThreshold(MEMORY_THRESHOLD);
	        // 设置临时存储目录
	    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 中文处理
        
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
     /*   req.getRequestURL()*/
        String uploadPath = req.getServletContext().getRealPath("./") +File.separator+"WEB-INF" + File.separator+ UPLOAD_DIRECTORY;
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
      try {
     // 解析请求的内容提取文件数据
        @SuppressWarnings("unchecked")
        List<FileItem> formItems = upload.parseRequest(req);
		 Map<String, String> params = new HashMap<String, String>();   
           for(Object object:formItems){  
               FileItem fileItem = (FileItem) object;   
               if (fileItem.isFormField()) {   
                   params.put(fileItem.getFieldName(), fileItem.getString("utf-8"));//如果你页面编码是utf-8的   
               }  
           }   
           //使用params.get获取参数值
           String title = (String) params.get("title");
           String text=(String)params.get("text");
           String reciever=(String)params.get("reciever");
           // 输出数据
           	Date date=new Date();
			sendid=ma.findMaxId();
			email.setId(++sendid);
			email.setReciever(reciever);
			email.setText(text);
			email.setTitle(title);
			email.setDate(date);
			
        if (formItems != null && formItems.size() > 0) {
            // 迭代表单数据
            for (FileItem item : formItems) {
                // 处理不在表单中的字段
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    filepath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filepath);
                    // 在控制台输出文件的上传路径 
                    // 保存文件到硬盘
                    item.write(storeFile);
                    req.setAttribute("message",
                        "文件上传成功!");
                   
                }
            }
           
        }
        email.setFilePath(filepath);
	}catch(Exception e) {
		e.printStackTrace();
	}
      return email;
	}
}
