package com.gdj43.kberp.batch.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class BatchComponent {

	// 초 분 시 일 월 요일
	@Scheduled(cron = "0 0 0 1 1 *")
	public void batchSample() {
		System.out.println("batchSample");
	}

}
