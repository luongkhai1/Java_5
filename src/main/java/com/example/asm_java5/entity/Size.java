package com.example.asm_java5.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "\"size\"")
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @jakarta.validation.constraints.Size(max = 255)
    @Column(name = "ma_size")
    private String maSize;

    @jakarta.validation.constraints.Size(max = 255)
    @Column(name = "ten_size")
    private String tenSize;

    @jakarta.validation.constraints.Size(max = 50)
    @Column(name = "trang_thai", length = 50)
    private String trangThai;

    @Column(name = "ngay_sua")
    private Instant ngaySua;

    @Column(name = "ngay_tao")
    private Instant ngayTao;

}