package com.unmatched.vo;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;

public class Topic implements Serializable{
    private static final long serialVersionUID = 865820164933461389L;
    private Integer tid;
    private Integer tuid;
    private Integer treplyCount;
    private String ttopic;
    private String tcontents;
    private String timage;
    private MultipartFile file;
    private Date ttime;
    private Integer tclickcount;
    private Date tlastclickt;
    private String author;

    public String getTimage() {
        return timage;
    }

    public Topic setTimage(String timage) {
        this.timage = timage;
        return this;
    }

    public MultipartFile getFile() {
        return file;
    }

    public Topic setFile(MultipartFile file) {
        this.file = file;
        return this;
    }

    public Integer getTid() {
        return tid;
    }

    public Topic setTid(Integer tid) {
        this.tid = tid;
        return this;
    }

    public Integer getTuid() {
        return tuid;
    }

    public Topic setTuid(Integer tuid) {
        this.tuid = tuid;
        return this;
    }

    public Integer getTreplyCount() {
        return treplyCount;
    }

    public Topic setTreplyCount(Integer treplyCount) {
        this.treplyCount = treplyCount;
        return this;
    }

    public String getTtopic() {
        return ttopic;
    }

    public Topic setTtopic(String ttopic) {
        this.ttopic = ttopic;
        return this;
    }

    public String getTcontents() {
        return tcontents;
    }

    public Topic setTcontents(String tcontents) {
        this.tcontents = tcontents;
        return this;
    }

    public Date getTtime() {
        return ttime;
    }

    public Topic setTtime(Date ttime) {
        this.ttime = ttime;
        return this;
    }

    public Integer getTclickcount() {
        return tclickcount;
    }

    public Topic setTclickcount(Integer tclickcount) {
        this.tclickcount = tclickcount;
        return this;
    }

    public Date getTlastclickt() {
        return tlastclickt;
    }

    public Topic setTlastclickt(Date tlastclickt) {
        this.tlastclickt = tlastclickt;
        return this;
    }

    public String getAuthor() {
        return author;
    }

    public Topic setAuthor(String author) {
        this.author = author;
        return this;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "tid=" + tid +
                ", tuid=" + tuid +
                ", treplyCount=" + treplyCount +
                ", ttopic='" + ttopic + '\'' +
                ", tcontents='" + tcontents + '\'' +
                ", image='" + timage + '\'' +
                ", file=" + file +
                ", ttime=" + ttime +
                ", tclickcount=" + tclickcount +
                ", tlastclickt=" + tlastclickt +
                ", author='" + author + '\'' +
                '}';
    }
}
