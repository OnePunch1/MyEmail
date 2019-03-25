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
	 // �ϴ��ļ��洢Ŀ¼
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // �ϴ�����
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	public static Email fileLoad(HttpServletRequest req,Email email) {
		MailDao ma=new MailDaoImp();
		Integer sendid=new Integer(0);
		 String filepath="";
		DiskFileItemFactory factory = new DiskFileItemFactory();
	        // �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
	    factory.setSizeThreshold(MEMORY_THRESHOLD);
	        // ������ʱ�洢Ŀ¼
	    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    // ��������ļ��ϴ�ֵ
        upload.setFileSizeMax(MAX_FILE_SIZE);
        // �����������ֵ (�����ļ��ͱ�����)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // ���Ĵ���
        
        upload.setHeaderEncoding("UTF-8"); 

        // ������ʱ·�����洢�ϴ����ļ�
        // ���·����Ե�ǰӦ�õ�Ŀ¼
     /*   req.getRequestURL()*/
        String uploadPath = req.getServletContext().getRealPath("./") +File.separator+"WEB-INF" + File.separator+ UPLOAD_DIRECTORY;
        // ���Ŀ¼�������򴴽�
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
      try {
     // ���������������ȡ�ļ�����
        @SuppressWarnings("unchecked")
        List<FileItem> formItems = upload.parseRequest(req);
		 Map<String, String> params = new HashMap<String, String>();   
           for(Object object:formItems){  
               FileItem fileItem = (FileItem) object;   
               if (fileItem.isFormField()) {   
                   params.put(fileItem.getFieldName(), fileItem.getString("utf-8"));//�����ҳ�������utf-8��   
               }  
           }   
           //ʹ��params.get��ȡ����ֵ
           String title = (String) params.get("title");
           String text=(String)params.get("text");
           String reciever=(String)params.get("reciever");
           // �������
           	Date date=new Date();
			sendid=ma.findMaxId();
			email.setId(++sendid);
			email.setReciever(reciever);
			email.setText(text);
			email.setTitle(title);
			email.setDate(date);
			
        if (formItems != null && formItems.size() > 0) {
            // ����������
            for (FileItem item : formItems) {
                // �����ڱ��е��ֶ�
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    filepath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filepath);
                    // �ڿ���̨����ļ����ϴ�·�� 
                    // �����ļ���Ӳ��
                    item.write(storeFile);
                    req.setAttribute("message",
                        "�ļ��ϴ��ɹ�!");
                   
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
