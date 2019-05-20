package com.unmatched.pojo;

import java.io.Serializable;

public class Imgs implements Serializable {
    private static final long serialVersionUID = 6305580980740437618L;
    private Integer id;
    private String imge1;
    private String imge2;
    private String imge3;
    private String imge4;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImge1() {
        return imge1;
    }

    public void setImge1(String imge1) {
        this.imge1 = imge1;
    }

    public String getImge2() {
        return imge2;
    }

    public void setImge2(String imge2) {
        this.imge2 = imge2;
    }

    public String getImge3() {
        return imge3;
    }

    public void setImge3(String imge3) {
        this.imge3 = imge3;
    }

    public String getImge4() {
        return imge4;
    }

    public void setImge4(String imge4) {
        this.imge4 = imge4;
    }
}
