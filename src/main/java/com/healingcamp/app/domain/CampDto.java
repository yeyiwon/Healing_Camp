package com.healingcamp.app.domain;

public class CampDto {
        private int C_ID;
        private String C_name;
        private String C_map_x;
        private String C_map_y;
        private String C_region;
        private String C_region_do;
        private String C_region_si;
        private int C_Price;
        private String C_phone;
        private float C_score;
        private int C_like_count;
        private int C_review_count;
        private String C_F_image;
        private String C_intro;
        private boolean C_Res_poss;
        private int C_category;
        private int C_area;
        private String C_startDate;
        private String C_endDate;
        private String reserveYn;
        public int getC_ID() {return C_ID;}

        public void setC_ID(int c_ID) {C_ID = c_ID;}

        public String getC_name() {return C_name;}

        public void setC_name(String c_name) {C_name = c_name;}

        public String getC_map_x() {return C_map_x;}

        public void setC_map_x(String c_map_x) {C_map_x = c_map_x;}

        public String getC_map_y() {return C_map_y;}

        public void setC_map_y(String c_map_y) {C_map_y = c_map_y;}

        public String getC_region() {return C_region;}

        public void setC_region(String c_region) {C_region = c_region;}

        public String getC_region_do() {return C_region_do;}

        public void setC_region_do(String c_region_do) {C_region_do = c_region_do;}

        public String getC_region_si() {return C_region_si;}

        public void setC_region_si(String c_region_si) {C_region_si = c_region_si;}

        public int getC_Price() {return C_Price;}

        public void setC_Price(int c_Price) {C_Price = c_Price;}

        public String getC_phone() {return C_phone;}

        public void setC_phone(String c_phone) {C_phone = c_phone;}

        public float getC_score() {return C_score;}

        public void setC_score(float c_score) {C_score = c_score;}

        public int getC_like_chk() {return C_like_count;}

        public void setC_like_chk(int c_like_chk) {C_like_count = c_like_chk;}

        public int getC_review_count() {return C_review_count;}

        public void setC_review_count(int c_review_count) {C_review_count = c_review_count;}

        public int getC_like_count() {
                return C_like_count;
        }

        public void setC_like_count(int c_like_count) {
                C_like_count = c_like_count;
        }

        public String getC_F_image() {
                return C_F_image;
        }

        public void setC_F_image(String c_F_image) {
                C_F_image = c_F_image;
        }

        public String getC_intro() {return C_intro;}

        public void setC_intro(String c_intro) {C_intro = c_intro;}

        public boolean isC_Res_poss() {return C_Res_poss;}

        public void setC_Res_poss(boolean c_Res_poss) {C_Res_poss = c_Res_poss;}

        public int getC_category() {return C_category;}

        public void setC_category(int c_category) {C_category = c_category;}

        public int getC_area() {return C_area;}

        public void setC_area(int c_area) {C_area = c_area;
        }

        public boolean isC_likeBtn() {return C_likeBtn;}

        public void setC_likeBtn(boolean c_likeBtn) {C_likeBtn = c_likeBtn;}

        private boolean C_likeBtn;

        public String getC_startDate() {
                return C_startDate;
        }

        public void setC_startDate(String c_startDate) {
                C_startDate = c_startDate;
        }

        public String getC_endDate() {
                return C_endDate;
        }

        public void setC_endDate(String c_endDate) {
                C_endDate = c_endDate;
        }

        public String getReserveYn() {
                return reserveYn;
        }

        public void setReserveYn(String reserveYn) {
                this.reserveYn = reserveYn;
        }

        public CampDto() {}

        @Override
        public String toString() {
                return "CampDto{" +
                        "C_ID=" + C_ID +
                        ", C_name='" + C_name + '\'' +
                        ", C_map_x='" + C_map_x + '\'' +
                        ", C_map_y='" + C_map_y + '\'' +
                        ", C_region='" + C_region + '\'' +
                        ", C_region_do='" + C_region_do + '\'' +
                        ", C_region_si='" + C_region_si + '\'' +
                        ", C_Price=" + C_Price +
                        ", C_phone='" + C_phone + '\'' +
                        ", C_score=" + C_score +
                        ", C_like_count=" + C_like_count +
                        ", C_review_count=" + C_review_count +
                        ", C_F_image='" + C_F_image + '\'' +
                        ", C_intro='" + C_intro + '\'' +
                        ", C_Res_poss=" + C_Res_poss +
                        ", C_category=" + C_category +
                        ", C_area=" + C_area +
                        ", C_startDate='" + C_startDate + '\'' +
                        ", C_endDate='" + C_endDate + '\'' +
                        ", reserveYn='" + reserveYn + '\'' +
                        ", C_likeBtn=" + C_likeBtn +
                        '}';
        }
}
