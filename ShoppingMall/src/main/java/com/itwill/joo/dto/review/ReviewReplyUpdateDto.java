package com.itwill.joo.dto.review;

import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewReplyUpdateDto {
	
	private long r_id;
	private String review_reply;
	
	public Review toEntity() {
		return Review.builder()
				.id(r_id)
				.rreview_reply(review_reply)
				.build();
	}

}
