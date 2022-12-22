package com.ezdev.sfy;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezdev.sfy.dto.EmailDTO;
import com.ezdev.sfy.service.EmailService;
 
 
@Controller // 컨트롤러 어노테이션 선언
public class EmailController {
 
    @Inject
    EmailService emailService; // 서비스를 호출하기위한 의존성 주입
 
    @RequestMapping("/write.do") // 이메일 쓰기를 누르면 이 메소드로 맵핑되어서
    public String write() {
        return "admin/writeForm"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인 버튼을 누르면 send.do로 넘어감
    }
 
    @RequestMapping("/send.do") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
    public String send(@ModelAttribute EmailDTO dto, HttpServletRequest req) {
        try {
        	System.out.println(dto);
        	
            emailService.sendMail(dto); // dto (메일관련 정보)를 sendMail에 저장함
            req.setAttribute("msg", "메일전송완료");
            req.setAttribute("url", "index.do");
            
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "메일전송실패");
            req.setAttribute("url", "index.do");
        }
        return "message"; // 실패했으므로 다시 write jsp 페이지로 이동함
    }
}
