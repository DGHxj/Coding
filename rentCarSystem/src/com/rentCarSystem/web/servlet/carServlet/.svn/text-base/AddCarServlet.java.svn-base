package com.rentCarSystem.web.servlet.carServlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.Car;
import com.rentCarSystem.service.CarManagerImpl;

public class AddCarServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(AddCarServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		ServletContext sc = this.getServletContext();
		String realPath = sc.getRealPath("/fileUpLoad");
		//创建一个做字节，字符内容分离的一个对象
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//实现了。HttpServletRequest和这个DiskFileItemFactory解耦
		ServletFileUpload sfu = new ServletFileUpload(factory);
		Car car = new Car();
		try {
			List<FileItem> list = sfu.parseRequest(request);
			
			for(FileItem item:list){
				//判断是不是表单当中的字符数据
				if(item.isFormField()){
					// 判断是那个字符数据(哪个input节点对象的name)
					if ("carNumber".equals(item.getFieldName())) {
						car.setCarNumber(item.getString("utf-8"));
					} else if ("carType".equals(item.getFieldName())) {
						car.setCarType(item.getString("utf-8"));
					} else if ("color".equals(item.getFieldName())) {
						car.setColor(item.getString("utf-8"));
					} else if ("price".equals(item.getFieldName())) {
						car.setPrice(item.getString("utf-8"));
					} else if ("rentPrice".equals(item.getFieldName())) {
						car.setRentPrice(item.getString("utf-8"));
					} else if ("deposit".equals(item.getFieldName())) {
						car.setDeposit(item.getString("utf-8"));
					} else if ("isRenting".equals(item.getFieldName())) {
						car.setIsRenting(item.getString("utf-8"));
					} else if ("description".equals(item.getFieldName())) {
						car.setDescription(item.getString("utf-8"));
					}
				}else{
					String value = item.getName();
					int start = value.lastIndexOf("\\");
					String fileName = value.substring(start+1);
					String newName = new String(fileName.getBytes(),"utf-8");
					InputStream is = item.getInputStream();
					OutputStream os = new FileOutputStream(new File(realPath,newName));
					byte[] b = new byte[1024];
					int len=0;
					while((len=is.read(b))>0){
						os.write(b, 0, len);
					}
					os.flush();
					os.close();
					is.close();
				}
			}
			if (car.getCarNumber() != null) {
				CarManagerImpl.getInstance().addCar(car);
				request.setAttribute(Constants.MESSAGE_KEY, "添加成功");
				request.getRequestDispatcher("findAllCar.do").forward(request,
						response);
			} else {
				request.setAttribute(Constants.MESSAGE_KEY, "用户不能为空");
				request.getRequestDispatcher("carManager/addCar.jsp").forward(
						request, response);
			}
		} catch (Exception e) {
			if(e.toString().indexOf("SystemError")!=-1){
				log.fatal(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("systemError.jsp").forward(request, response);
			}else{
				log.error(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("failure.jsp").forward(request, response);
			}
			
		}
		

	}

}
