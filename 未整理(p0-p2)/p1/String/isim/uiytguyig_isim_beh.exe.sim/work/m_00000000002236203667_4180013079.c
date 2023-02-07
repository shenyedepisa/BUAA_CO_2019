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
static const char *ng0 = "D:/xilinx_ISE/String/string.v";
static int ng1[] = {0, 0};
static int ng2[] = {48, 0};
static int ng3[] = {57, 0};
static int ng4[] = {1, 0};
static int ng5[] = {3, 0};
static int ng6[] = {42, 0};
static int ng7[] = {43, 0};
static int ng8[] = {2, 0};



static void Always_28_0(char *t0)
{
    char t13[8];
    char t17[8];
    char t21[8];
    char t35[8];
    char t39[8];
    char t47[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    int t71;
    int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB12;

LAB10:    t11 = (t4 + 4);
    t12 = (t5 + 4);
    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB12;

LAB11:    *((unsigned int *)t13) = 1;

LAB12:    t14 = (t13 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB48;

LAB46:    t11 = (t4 + 4);
    t12 = (t5 + 4);
    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB48;

LAB47:    *((unsigned int *)t13) = 1;

LAB48:    t14 = (t13 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB49;

LAB50:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t13, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB80;

LAB78:    t11 = (t4 + 4);
    t12 = (t5 + 4);
    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB80;

LAB79:    *((unsigned int *)t13) = 1;

LAB80:    t14 = (t13 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB81;

LAB82:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t13, 0, 8);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB116;

LAB114:    t11 = (t4 + 4);
    t12 = (t5 + 4);
    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB116;

LAB115:    *((unsigned int *)t13) = 1;

LAB116:    t14 = (t13 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB117;

LAB118:
LAB119:
LAB83:
LAB51:
LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(31, ng0);

LAB9:    xsi_set_current_line(32, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB13:    xsi_set_current_line(36, ng0);

LAB16:    xsi_set_current_line(37, ng0);
    t15 = (t0 + 1368U);
    t16 = *((char **)t15);
    t15 = ((char*)((ng2)));
    memset(t17, 0, 8);
    t18 = (t16 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB18;

LAB17:    t19 = (t15 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB18;

LAB21:    if (*((unsigned int *)t16) < *((unsigned int *)t15))
        goto LAB20;

LAB19:    *((unsigned int *)t17) = 1;

LAB20:    memset(t21, 0, 8);
    t22 = (t17 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t17);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t22) != 0)
        goto LAB24;

LAB25:    t29 = (t21 + 4);
    t30 = *((unsigned int *)t21);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB26;

LAB27:    memcpy(t47, t21, 8);

LAB28:    t79 = (t47 + 4);
    t80 = *((unsigned int *)t79);
    t81 = (~(t80));
    t82 = *((unsigned int *)t47);
    t83 = (t82 & t81);
    t84 = (t83 != 0);
    if (t84 > 0)
        goto LAB41;

LAB42:    xsi_set_current_line(43, ng0);

LAB45:    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB43:    goto LAB15;

LAB18:    t20 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB20;

LAB22:    *((unsigned int *)t21) = 1;
    goto LAB25;

LAB24:    t28 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB25;

LAB26:    t33 = (t0 + 1368U);
    t34 = *((char **)t33);
    t33 = ((char*)((ng3)));
    memset(t35, 0, 8);
    t36 = (t34 + 4);
    if (*((unsigned int *)t36) != 0)
        goto LAB30;

LAB29:    t37 = (t33 + 4);
    if (*((unsigned int *)t37) != 0)
        goto LAB30;

LAB33:    if (*((unsigned int *)t34) > *((unsigned int *)t33))
        goto LAB32;

LAB31:    *((unsigned int *)t35) = 1;

LAB32:    memset(t39, 0, 8);
    t40 = (t35 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t35);
    t44 = (t43 & t42);
    t45 = (t44 & 1U);
    if (t45 != 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t40) != 0)
        goto LAB36;

LAB37:    t48 = *((unsigned int *)t21);
    t49 = *((unsigned int *)t39);
    t50 = (t48 & t49);
    *((unsigned int *)t47) = t50;
    t51 = (t21 + 4);
    t52 = (t39 + 4);
    t53 = (t47 + 4);
    t54 = *((unsigned int *)t51);
    t55 = *((unsigned int *)t52);
    t56 = (t54 | t55);
    *((unsigned int *)t53) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 != 0);
    if (t58 == 1)
        goto LAB38;

LAB39:
LAB40:    goto LAB28;

LAB30:    t38 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB32;

LAB34:    *((unsigned int *)t39) = 1;
    goto LAB37;

LAB36:    t46 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB37;

LAB38:    t59 = *((unsigned int *)t47);
    t60 = *((unsigned int *)t53);
    *((unsigned int *)t47) = (t59 | t60);
    t61 = (t21 + 4);
    t62 = (t39 + 4);
    t63 = *((unsigned int *)t21);
    t64 = (~(t63));
    t65 = *((unsigned int *)t61);
    t66 = (~(t65));
    t67 = *((unsigned int *)t39);
    t68 = (~(t67));
    t69 = *((unsigned int *)t62);
    t70 = (~(t69));
    t71 = (t64 & t66);
    t72 = (t68 & t70);
    t73 = (~(t71));
    t74 = (~(t72));
    t75 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t75 & t73);
    t76 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t76 & t74);
    t77 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t77 & t73);
    t78 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t78 & t74);
    goto LAB40;

LAB41:    xsi_set_current_line(38, ng0);

LAB44:    xsi_set_current_line(39, ng0);
    t85 = ((char*)((ng4)));
    t86 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t86, t85, 0, 0, 2, 0LL);
    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB43;

LAB49:    xsi_set_current_line(49, ng0);

LAB52:    xsi_set_current_line(50, ng0);
    t15 = (t0 + 1368U);
    t16 = *((char **)t15);
    t15 = ((char*)((ng6)));
    memset(t17, 0, 8);
    if (*((unsigned int *)t16) != *((unsigned int *)t15))
        goto LAB55;

LAB53:    t18 = (t16 + 4);
    t19 = (t15 + 4);
    if (*((unsigned int *)t18) != *((unsigned int *)t19))
        goto LAB55;

LAB54:    *((unsigned int *)t17) = 1;

LAB55:    memset(t21, 0, 8);
    t20 = (t17 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t17);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB56;

LAB57:    if (*((unsigned int *)t20) != 0)
        goto LAB58;

LAB59:    t28 = (t21 + 4);
    t30 = *((unsigned int *)t21);
    t31 = (!(t30));
    t32 = *((unsigned int *)t28);
    t41 = (t31 || t32);
    if (t41 > 0)
        goto LAB60;

LAB61:    memcpy(t47, t21, 8);

LAB62:    t61 = (t47 + 4);
    t76 = *((unsigned int *)t61);
    t77 = (~(t76));
    t78 = *((unsigned int *)t47);
    t80 = (t78 & t77);
    t81 = (t80 != 0);
    if (t81 > 0)
        goto LAB73;

LAB74:    xsi_set_current_line(56, ng0);

LAB77:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB75:    goto LAB51;

LAB56:    *((unsigned int *)t21) = 1;
    goto LAB59;

LAB58:    t22 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB59;

LAB60:    t29 = (t0 + 1368U);
    t33 = *((char **)t29);
    t29 = ((char*)((ng7)));
    memset(t35, 0, 8);
    if (*((unsigned int *)t33) != *((unsigned int *)t29))
        goto LAB65;

LAB63:    t34 = (t33 + 4);
    t36 = (t29 + 4);
    if (*((unsigned int *)t34) != *((unsigned int *)t36))
        goto LAB65;

LAB64:    *((unsigned int *)t35) = 1;

LAB65:    memset(t39, 0, 8);
    t37 = (t35 + 4);
    t42 = *((unsigned int *)t37);
    t43 = (~(t42));
    t44 = *((unsigned int *)t35);
    t45 = (t44 & t43);
    t48 = (t45 & 1U);
    if (t48 != 0)
        goto LAB66;

LAB67:    if (*((unsigned int *)t37) != 0)
        goto LAB68;

LAB69:    t49 = *((unsigned int *)t21);
    t50 = *((unsigned int *)t39);
    t54 = (t49 | t50);
    *((unsigned int *)t47) = t54;
    t40 = (t21 + 4);
    t46 = (t39 + 4);
    t51 = (t47 + 4);
    t55 = *((unsigned int *)t40);
    t56 = *((unsigned int *)t46);
    t57 = (t55 | t56);
    *((unsigned int *)t51) = t57;
    t58 = *((unsigned int *)t51);
    t59 = (t58 != 0);
    if (t59 == 1)
        goto LAB70;

LAB71:
LAB72:    goto LAB62;

LAB66:    *((unsigned int *)t39) = 1;
    goto LAB69;

LAB68:    t38 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB69;

LAB70:    t60 = *((unsigned int *)t47);
    t63 = *((unsigned int *)t51);
    *((unsigned int *)t47) = (t60 | t63);
    t52 = (t21 + 4);
    t53 = (t39 + 4);
    t64 = *((unsigned int *)t52);
    t65 = (~(t64));
    t66 = *((unsigned int *)t21);
    t71 = (t66 & t65);
    t67 = *((unsigned int *)t53);
    t68 = (~(t67));
    t69 = *((unsigned int *)t39);
    t72 = (t69 & t68);
    t70 = (~(t71));
    t73 = (~(t72));
    t74 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t74 & t70);
    t75 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t75 & t73);
    goto LAB72;

LAB73:    xsi_set_current_line(51, ng0);

LAB76:    xsi_set_current_line(52, ng0);
    t62 = ((char*)((ng8)));
    t79 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t79, t62, 0, 0, 2, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB75;

LAB81:    xsi_set_current_line(62, ng0);

LAB84:    xsi_set_current_line(63, ng0);
    t15 = (t0 + 1368U);
    t16 = *((char **)t15);
    t15 = ((char*)((ng2)));
    memset(t17, 0, 8);
    t18 = (t16 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB86;

LAB85:    t19 = (t15 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB86;

LAB89:    if (*((unsigned int *)t16) < *((unsigned int *)t15))
        goto LAB88;

LAB87:    *((unsigned int *)t17) = 1;

LAB88:    memset(t21, 0, 8);
    t22 = (t17 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t17);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB90;

LAB91:    if (*((unsigned int *)t22) != 0)
        goto LAB92;

LAB93:    t29 = (t21 + 4);
    t30 = *((unsigned int *)t21);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB94;

LAB95:    memcpy(t47, t21, 8);

LAB96:    t79 = (t47 + 4);
    t80 = *((unsigned int *)t79);
    t81 = (~(t80));
    t82 = *((unsigned int *)t47);
    t83 = (t82 & t81);
    t84 = (t83 != 0);
    if (t84 > 0)
        goto LAB109;

LAB110:    xsi_set_current_line(69, ng0);

LAB113:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB111:    goto LAB83;

LAB86:    t20 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB88;

LAB90:    *((unsigned int *)t21) = 1;
    goto LAB93;

LAB92:    t28 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB93;

LAB94:    t33 = (t0 + 1368U);
    t34 = *((char **)t33);
    t33 = ((char*)((ng3)));
    memset(t35, 0, 8);
    t36 = (t34 + 4);
    if (*((unsigned int *)t36) != 0)
        goto LAB98;

LAB97:    t37 = (t33 + 4);
    if (*((unsigned int *)t37) != 0)
        goto LAB98;

LAB101:    if (*((unsigned int *)t34) > *((unsigned int *)t33))
        goto LAB100;

LAB99:    *((unsigned int *)t35) = 1;

LAB100:    memset(t39, 0, 8);
    t40 = (t35 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t35);
    t44 = (t43 & t42);
    t45 = (t44 & 1U);
    if (t45 != 0)
        goto LAB102;

LAB103:    if (*((unsigned int *)t40) != 0)
        goto LAB104;

LAB105:    t48 = *((unsigned int *)t21);
    t49 = *((unsigned int *)t39);
    t50 = (t48 & t49);
    *((unsigned int *)t47) = t50;
    t51 = (t21 + 4);
    t52 = (t39 + 4);
    t53 = (t47 + 4);
    t54 = *((unsigned int *)t51);
    t55 = *((unsigned int *)t52);
    t56 = (t54 | t55);
    *((unsigned int *)t53) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 != 0);
    if (t58 == 1)
        goto LAB106;

LAB107:
LAB108:    goto LAB96;

LAB98:    t38 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB100;

LAB102:    *((unsigned int *)t39) = 1;
    goto LAB105;

LAB104:    t46 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB105;

LAB106:    t59 = *((unsigned int *)t47);
    t60 = *((unsigned int *)t53);
    *((unsigned int *)t47) = (t59 | t60);
    t61 = (t21 + 4);
    t62 = (t39 + 4);
    t63 = *((unsigned int *)t21);
    t64 = (~(t63));
    t65 = *((unsigned int *)t61);
    t66 = (~(t65));
    t67 = *((unsigned int *)t39);
    t68 = (~(t67));
    t69 = *((unsigned int *)t62);
    t70 = (~(t69));
    t71 = (t64 & t66);
    t72 = (t68 & t70);
    t73 = (~(t71));
    t74 = (~(t72));
    t75 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t75 & t73);
    t76 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t76 & t74);
    t77 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t77 & t73);
    t78 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t78 & t74);
    goto LAB108;

LAB109:    xsi_set_current_line(64, ng0);

LAB112:    xsi_set_current_line(65, ng0);
    t85 = ((char*)((ng4)));
    t86 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t86, t85, 0, 0, 2, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB111;

LAB117:    xsi_set_current_line(75, ng0);

LAB120:    xsi_set_current_line(76, ng0);
    t15 = ((char*)((ng5)));
    t16 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 2, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB119;

}


extern void work_m_00000000002236203667_4180013079_init()
{
	static char *pe[] = {(void *)Always_28_0};
	xsi_register_didat("work_m_00000000002236203667_4180013079", "isim/uiytguyig_isim_beh.exe.sim/work/m_00000000002236203667_4180013079.didat");
	xsi_register_executes(pe);
}
