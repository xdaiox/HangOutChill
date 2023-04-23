package com.ispan.hangoutchill.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.shop.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
