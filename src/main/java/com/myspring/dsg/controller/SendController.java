package com.myspring.dsg.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myspring.dsg.service.CertificationService;

@Controller
public class SendController {

	@Autowired
	CertificationService certificationService;
	
	@RequestMapping("/sms")
	public String sms() {
		return "sms";
	}
	
	@RequestMapping("/sendSms")
    public @ResponseBody Map<String, Object> sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        
        Map<String, Object> pmap = new HashMap<String, Object>();
        
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        
        pmap.put("phoneNumber", phoneNumber);
        pmap.put("numStr", numStr);
        certificationService.certifiedPhoneNumber(phoneNumber,numStr);
        
        return pmap;
    }

}

		

