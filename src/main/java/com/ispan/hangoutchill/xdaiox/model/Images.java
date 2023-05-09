package com.ispan.hangoutchill.xdaiox.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="discussionImage")
public class Images {
	
	public Integer getI_id() {
		return i_id;
	}

	public void setI_id(Integer i_id) {
		this.i_id = i_id;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Image_id")
	private Integer i_id;
	
	@Lob
	@Column(name="imageData")
    private byte[] img_data;
	

	public Images() {
	}
    
	public byte[] getImg_data() {
		return img_data;
	}

	public void setImg_data(byte[] img_data) {
		this.img_data = img_data;
	}
}
