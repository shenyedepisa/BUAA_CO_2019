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
static const char *ng0 = "D:/xilinx_ISE/GRAY/gray.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {3, 0};
static int ng4[] = {2, 0};
static int ng5[] = {6, 0};
static int ng6[] = {7, 0};
static int ng7[] = {5, 0};
static int ng8[] = {4, 0};



static void Initial_28_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(29, ng0);

LAB2:    xsi_set_current_line(30, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 3, 0LL);
    xsi_set_current_line(31, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Always_34_1(char *t0)
{
    char t6[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 3416);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t5) != *((unsigned int *)t4))
        goto LAB8;

LAB6:    t7 = (t5 + 4);
    t8 = (t4 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB8:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t3) != *((unsigned int *)t2))
        goto LAB15;

LAB13:    t4 = (t3 + 4);
    t5 = (t2 + 4);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB15;

LAB14:    *((unsigned int *)t6) = 1;

LAB15:    t7 = (t6 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB16;

LAB17:
LAB18:
LAB11:    goto LAB2;

LAB9:    xsi_set_current_line(37, ng0);

LAB12:    xsi_set_current_line(38, ng0);
    t15 = ((char*)((ng1)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB11;

LAB16:    xsi_set_current_line(42, ng0);

LAB19:    xsi_set_current_line(43, ng0);
    t8 = (t0 + 1768);
    t9 = (t8 + 56U);
    t15 = *((char **)t9);
    t16 = ((char*)((ng1)));
    memset(t17, 0, 8);
    if (*((unsigned int *)t15) != *((unsigned int *)t16))
        goto LAB22;

LAB20:    t18 = (t15 + 4);
    t19 = (t16 + 4);
    if (*((unsigned int *)t18) != *((unsigned int *)t19))
        goto LAB22;

LAB21:    *((unsigned int *)t17) = 1;

LAB22:    t20 = (t17 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t17);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB28;

LAB26:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB28;

LAB27:    *((unsigned int *)t6) = 1;

LAB28:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB34;

LAB32:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB34;

LAB33:    *((unsigned int *)t6) = 1;

LAB34:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB40;

LAB38:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB40;

LAB39:    *((unsigned int *)t6) = 1;

LAB40:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB41;

LAB42:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB46;

LAB44:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB46;

LAB45:    *((unsigned int *)t6) = 1;

LAB46:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB52;

LAB50:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB52;

LAB51:    *((unsigned int *)t6) = 1;

LAB52:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB58;

LAB56:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB58;

LAB57:    *((unsigned int *)t6) = 1;

LAB58:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t6, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB64;

LAB62:    t7 = (t4 + 4);
    t8 = (t5 + 4);
    if (*((unsigned int *)t7) != *((unsigned int *)t8))
        goto LAB64;

LAB63:    *((unsigned int *)t6) = 1;

LAB64:    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t6);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB65;

LAB66:
LAB67:
LAB61:
LAB55:
LAB49:
LAB43:
LAB37:
LAB31:
LAB25:    goto LAB18;

LAB23:    xsi_set_current_line(44, ng0);
    t26 = ((char*)((ng2)));
    t27 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t27, t26, 0, 0, 3, 0LL);
    goto LAB25;

LAB29:    xsi_set_current_line(46, ng0);
    t15 = ((char*)((ng3)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    goto LAB31;

LAB35:    xsi_set_current_line(48, ng0);
    t15 = ((char*)((ng4)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    goto LAB37;

LAB41:    xsi_set_current_line(50, ng0);
    t15 = ((char*)((ng5)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    goto LAB43;

LAB47:    xsi_set_current_line(52, ng0);
    t15 = ((char*)((ng6)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    goto LAB49;

LAB53:    xsi_set_current_line(54, ng0);
    t15 = ((char*)((ng7)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    goto LAB55;

LAB59:    xsi_set_current_line(56, ng0);
    t15 = ((char*)((ng8)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    goto LAB61;

LAB65:    xsi_set_current_line(58, ng0);

LAB68:    xsi_set_current_line(59, ng0);
    t15 = ((char*)((ng1)));
    t16 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 3, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB67;

}


extern void work_m_00000000000851927074_0735672237_init()
{
	static char *pe[] = {(void *)Initial_28_0,(void *)Always_34_1};
	xsi_register_didat("work_m_00000000000851927074_0735672237", "isim/gray1_isim_beh.exe.sim/work/m_00000000000851927074_0735672237.didat");
	xsi_register_executes(pe);
}
