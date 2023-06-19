package com.itwill.joo.dto.review;

import java.time.LocalDateTime;

import com.itwill.joo.domain.ReviewReply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewReplyCreateDto {
	
	private long id;
	
	private int r_id;
	
	private String reply_content;
	
	private LocalDateTime rcreated_time;
	private LocalDateTime rmodified_time;
	
	public ReviewReply toEntity() {
		return ReviewReply.builder()
				.r_id(r_id)
				.reply_content(reply_content)
				.build();
	}

}
