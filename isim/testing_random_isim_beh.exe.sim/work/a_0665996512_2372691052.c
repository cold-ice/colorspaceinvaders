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
static const char *ng0 = "C:/Users/korisnik/Documents/CA ASSIGNMENT/game_new_june/testing_random.vhd";
extern char *IEEE_P_3972351953;

double ieee_p_3972351953_sub_28498392_2984157535(char *, double );
void ieee_p_3972351953_sub_3007962107_2984157535(char *, char *, char *, char *, char *);


static void work_a_0665996512_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    double t11;
    double t12;
    int t13;
    unsigned char t14;
    unsigned char t15;
    double t16;
    double t17;

LAB0:    t1 = (t0 + 4552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 4360);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4360);
    t3 = (t0 + 3208U);
    t6 = *((char **)t3);
    t3 = (t6 + 0);
    t7 = (t0 + 3328U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    t9 = (t0 + 3448U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    ieee_p_3972351953_sub_3007962107_2984157535(IEEE_P_3972351953, t2, t3, t7, t9);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t11 = *((double *)t3);
    t12 = (t11 * 2.9900000000000002);
    t2 = (t0 + 3448U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((double *)t2) = t12;
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t11 = *((double *)t3);
    t12 = ieee_p_3972351953_sub_28498392_2984157535(IEEE_P_3972351953, t11);
    t14 = (t12 >= 0);
    if (t14 == 1)
        goto LAB8;

LAB9:    t17 = (t12 - 0.50000000000000000);
    t13 = ((int)(t17));

LAB10:    t2 = (t0 + 3568U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((int *)t2) = t13;
    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t15 = (t12 >= 2147483647);
    if (t15 == 1)
        goto LAB11;

LAB12:    t16 = (t12 + 0.50000000000000000);
    t13 = ((int)(t16));
    goto LAB10;

LAB11:    t13 = 2147483647;
    goto LAB10;

}


extern void work_a_0665996512_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0665996512_2372691052_p_0};
	xsi_register_didat("work_a_0665996512_2372691052", "isim/testing_random_isim_beh.exe.sim/work/a_0665996512_2372691052.didat");
	xsi_register_executes(pe);
}
