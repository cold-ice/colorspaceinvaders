/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/korisnik/Documents/CA ASSIGNMENT/game_new_june/pix_gen_new.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_0896897876;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
void work_p_0896897876_sub_2735179791_443810978(char *, char *, char *, unsigned int , unsigned int , char *, char *, unsigned int , unsigned int , char *, unsigned int , unsigned int , char *, unsigned int , unsigned int , char *, unsigned int , unsigned int , char *, unsigned int , unsigned int );


static void work_a_0723826792_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2592U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4840);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 4080);
    t4 = (t0 + 2912U);
    t5 = (t0 + 4952);
    t6 = (t0 + 1312U);
    t7 = (t0 + 1472U);
    t8 = (t0 + 1632U);
    t9 = (t0 + 1792U);
    t10 = (t0 + 2752U);
    work_p_0896897876_sub_2735179791_443810978(WORK_P_0896897876, t3, t4, 0U, 0U, t5, t6, 0U, 0U, t7, 0U, 0U, t8, 0U, 0U, t9, 0U, 0U, t10, 0U, 0U);
    goto LAB3;

}

static void work_a_0723826792_3212880686_p_1(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    unsigned int t8;
    int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    unsigned int t15;
    int t16;
    int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    char *t22;
    unsigned int t23;
    int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((int *)t5);
    t4 = (t0 + 2952U);
    t7 = *((char **)t4);
    t8 = (0 + 0U);
    t4 = (t7 + t8);
    t9 = *((int *)t4);
    t10 = (t6 >= t9);
    if (t10 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(71, ng0);
    t4 = (t0 + 5016);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t4, 14U, 1, 0LL);

LAB3:    xsi_set_current_line(73, ng0);
    t4 = (t0 + 2952U);
    t5 = *((char **)t4);
    t8 = (0 + 20U);
    t4 = (t5 + t8);
    t1 = *((unsigned char *)t4);
    t2 = (t1 == (unsigned char)3);
    if (t2 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(78, ng0);
    t4 = (t0 + 8124);
    t7 = (t0 + 5080);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t4, 4U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(79, ng0);
    t4 = (t0 + 8128);
    t7 = (t0 + 5144);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t4, 4U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(80, ng0);
    t4 = (t0 + 8132);
    t7 = (t0 + 5208);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t4, 4U);
    xsi_driver_first_trans_fast_port(t7);

LAB15:    t4 = (t0 + 4872);
    *((int *)t4) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(69, ng0);
    t34 = (t0 + 5016);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    *((unsigned char *)t38) = (unsigned char)3;
    xsi_driver_first_trans_delta(t34, 14U, 1, 0LL);
    goto LAB3;

LAB5:    t26 = (t0 + 1192U);
    t27 = *((char **)t26);
    t28 = *((int *)t27);
    t26 = (t0 + 2952U);
    t29 = *((char **)t26);
    t30 = (0 + 4U);
    t26 = (t29 + t30);
    t31 = *((int *)t26);
    t32 = (t31 + 20);
    t33 = (t28 <= t32);
    t1 = t33;
    goto LAB7;

LAB8:    t19 = (t0 + 1192U);
    t20 = *((char **)t19);
    t21 = *((int *)t20);
    t19 = (t0 + 2952U);
    t22 = *((char **)t19);
    t23 = (0 + 4U);
    t19 = (t22 + t23);
    t24 = *((int *)t19);
    t25 = (t21 >= t24);
    t2 = t25;
    goto LAB10;

LAB11:    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t13 = *((int *)t12);
    t11 = (t0 + 2952U);
    t14 = *((char **)t11);
    t15 = (0 + 0U);
    t11 = (t14 + t15);
    t16 = *((int *)t11);
    t17 = (t16 + 20);
    t18 = (t13 <= t17);
    t3 = t18;
    goto LAB13;

LAB14:    xsi_set_current_line(74, ng0);
    t7 = (t0 + 2952U);
    t11 = *((char **)t7);
    t15 = (0 + 8U);
    t7 = (t11 + t15);
    t12 = (t0 + 5080);
    t14 = (t12 + 56U);
    t19 = *((char **)t14);
    t20 = (t19 + 56U);
    t22 = *((char **)t20);
    memcpy(t22, t7, 4U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(75, ng0);
    t4 = (t0 + 2952U);
    t5 = *((char **)t4);
    t8 = (0 + 12U);
    t4 = (t5 + t8);
    t7 = (t0 + 5144);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t4, 4U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(76, ng0);
    t4 = (t0 + 2952U);
    t5 = *((char **)t4);
    t8 = (0 + 16U);
    t4 = (t5 + t8);
    t7 = (t0 + 5208);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t4, 4U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB15;

}


extern void work_a_0723826792_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0723826792_3212880686_p_0,(void *)work_a_0723826792_3212880686_p_1};
	xsi_register_didat("work_a_0723826792_3212880686", "isim/testing_random_isim_beh.exe.sim/work/a_0723826792_3212880686.didat");
	xsi_register_executes(pe);
}
