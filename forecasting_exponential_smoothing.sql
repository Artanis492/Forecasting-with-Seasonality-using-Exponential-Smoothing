    FUNCTION exponential_forecast_one (p_item_id NUMBER,
                                                 p_end_date DATE)
                                                 RETURN NUMBER IS

l_alpha number := .08;
l_beta number := .02;
l_fcast_weeks pls_integer; 
l_fcast_loop pls_integer;
l_season pls_integer := 52;
l_qty_select pls_integer;
i pls_integer;
l_fct_cnt pls_integer;
fcast_qty number;
l_a_curr number;
l_t_curr number;
l_s1 number;
l_a_prev number;
l_t_prev number;
l_qty_0 number;
l_qty_1 number;
l_qty_2 number;
l_sum_0 number;
l_sum_1 number;
l_sum_2 number;
l_forecast_qty number;
l_final_s number;


begin

IF p_end_date between SYSDATE and SYSDATE+365 THEN

l_fcast_weeks := round((p_end_date-sysdate)/7,0);

select WEEK_1     +
    WEEK_2     +
    WEEK_3     +
    WEEK_4     +
    WEEK_5     +
    WEEK_6     +
    WEEK_7     +
    WEEK_8     +
    WEEK_9     +
    WEEK_10    +
    WEEK_11    +
    WEEK_12    +
    WEEK_13    +
    WEEK_14    +
    WEEK_15    +
    WEEK_16    +
    WEEK_17    +
    WEEK_18    +
    WEEK_19    +
    WEEK_20    +
    WEEK_21    +
    WEEK_22    +
    WEEK_23    +
    WEEK_24    +
    WEEK_25    +
    WEEK_26    +
    WEEK_27    +
    WEEK_28    +
    WEEK_29    +
    WEEK_30    +
    WEEK_31    +
    WEEK_32    +
    WEEK_33    +
    WEEK_34    +
    WEEK_35    +
    WEEK_36    +
    WEEK_37    +
    WEEK_38    +
    WEEK_39    +
    WEEK_40    +
    WEEK_41    +
    WEEK_42    +
    WEEK_43    +
    WEEK_44    +
    WEEK_45    +
    WEEK_46    +
    WEEK_47    +
    WEEK_48    +
    WEEK_49    +
    WEEK_50    +
    WEEK_51    +
    WEEK_52
into l_sum_0
from mutl_sales_by_week
where item_id = P_ITEM_ID;

select WEEK_53     +
    WEEK_54     +
    WEEK_55     +
    WEEK_56    +
    WEEK_57     +
    WEEK_58     +
    WEEK_59     +
    WEEK_60     +
    WEEK_61     +
    WEEK_62    +
    WEEK_63    +
    WEEK_64    +
    WEEK_65    +
    WEEK_66    +
    WEEK_67    +
    WEEK_68    +
    WEEK_69    +
    WEEK_70    +
    WEEK_71    +
    WEEK_72    +
    WEEK_73    +
    WEEK_74    +
    WEEK_75    +
    WEEK_76    +
    WEEK_77    +
    WEEK_78    +
    WEEK_79    +
    WEEK_80    +
    WEEK_81    +
    WEEK_82    +
    WEEK_83    +
    WEEK_84    +
    WEEK_85    +
    WEEK_86    +
    WEEK_87    +
    WEEK_88    +
    WEEK_89    +
    WEEK_90    +
    WEEK_91    +
    WEEK_92    +
    WEEK_93    +
    WEEK_94    +
    WEEK_95    +
    WEEK_96    +
    WEEK_97    +
    WEEK_98    +
    WEEK_99    +
    WEEK_100    +
    WEEK_101    +
    WEEK_102    +
    WEEK_103    +
    WEEK_104
into l_sum_1
from mutl_sales_by_week
where item_id = P_ITEM_ID;

SELECT     week_105 +
     week_106 +
     week_107 +
     week_108 +
     week_109 +
     week_110 +
     week_111 +
     week_112 +
     week_113 +
     week_114 +
     week_115 +
     week_116 +
     week_117 +
     week_118 +
     week_119 +
     week_120 +
     week_121 +
     week_122 +
     week_123 +
     week_124 +
     week_125 +
     week_126 +
     week_127 +
     week_128 +
     week_129 +
     week_130 +
     week_131 +
     week_132 +
     week_133 +
     week_134 +
     week_135 +
     week_136 +
     week_137 +
     week_138 +
     week_139 +
     week_140 +
     week_141 +
     week_142 +
     week_143 +
     week_144 +
     week_145 +
     week_146 +
     week_147 +
     week_148 +
     week_149 +
     week_150 +
     week_151 +
     week_152 +
     week_153 +
     week_154 +
     week_155 +
     week_156 
INTO L_SUM_2
from mutl_sales_by_week
where item_id = P_ITEM_ID;
  
l_fcast_loop :=  0;
l_a_curr  := 0;
l_t_curr  := 0;
l_s1  := 0;
l_a_prev  := 0;
l_t_prev  := 0;
l_forecast_qty := 0;
l_final_s := 0;

l_qty_select := l_fcast_weeks;


if l_qty_select > 52 then

    l_qty_select := l_qty_select - 52;

end if;

   
        FOR i IN 1 .. l_qty_select
        LOOP
 
l_fcast_loop := i;


select case when l_fcast_loop = 1 then
        week_1
            when l_fcast_loop = 2 then
        week_2
            when l_fcast_loop = 3 then
        week_3
            when l_fcast_loop = 4 then
        week_4
            when l_fcast_loop = 5 then
        week_5
            when l_fcast_loop = 6 then
        week_6
            when l_fcast_loop = 7 then
        week_7
            when l_fcast_loop = 8 then
        week_8
            when l_fcast_loop = 9 then
        week_9
            when l_fcast_loop = 10 then
        week_10
            when l_fcast_loop = 11 then
        week_11
            when l_fcast_loop = 12 then
        week_10
            when l_fcast_loop = 13 then
        week_13
            when l_fcast_loop = 14 then
        week_14
            when l_fcast_loop = 15 then
        week_15
            when l_fcast_loop = 16 then
        week_16
            when l_fcast_loop = 17 then
        week_17
            when l_fcast_loop = 18 then
        week_18
            when l_fcast_loop = 19 then
        week_19
            when l_fcast_loop = 20 then
        week_20
            when l_fcast_loop = 21 then
        week_21
            when l_fcast_loop = 22 then
        week_22
            when l_fcast_loop = 23 then
        week_23
            when l_fcast_loop = 24 then
        week_24
            when l_fcast_loop = 25 then
        week_25
            when l_fcast_loop = 26 then
        week_26
            when l_fcast_loop = 27 then
        week_27
            when l_fcast_loop = 28 then
        week_28
            when l_fcast_loop = 29 then
        week_29
            when l_fcast_loop = 30 then
        week_30
            when l_fcast_loop = 31 then
        week_31
            when l_fcast_loop = 32 then
        week_32
            when l_fcast_loop = 33 then
        week_33
            when l_fcast_loop = 34 then
        week_34
            when l_fcast_loop = 35 then
        week_35
            when l_fcast_loop = 36 then
        week_36
            when l_fcast_loop = 37 then
        week_37
            when l_fcast_loop = 38 then
        week_38
            when l_fcast_loop = 39 then
        week_39
            when l_fcast_loop = 40 then
        week_40
            when l_fcast_loop = 41 then
        week_41
            when l_fcast_loop = 42 then
        week_42
            when l_fcast_loop = 43 then
        week_43
            when l_fcast_loop = 44 then
        week_44
            when l_fcast_loop = 45 then
        week_45
            when l_fcast_loop = 46 then
        week_46
            when l_fcast_loop = 47 then
        week_47
            when l_fcast_loop = 48 then
        week_48
            when l_fcast_loop = 49 then
        week_49
            when l_fcast_loop = 50 then
        week_50
            when l_fcast_loop = 51 then
        week_51
            when l_fcast_loop = 52 then
        week_52 END
into l_qty_0
from mutl_sales_by_week
where item_id = P_ITEM_ID;

select case when l_fcast_loop = 1 then
        week_53
            when l_fcast_loop = 2 then
        week_54
            when l_fcast_loop = 3 then
        week_55
            when l_fcast_loop = 4 then
        week_56
            when l_fcast_loop = 5 then
        week_57
            when l_fcast_loop = 6 then
        week_58
            when l_fcast_loop = 7 then
        week_59
            when l_fcast_loop = 8 then
        week_60
            when l_fcast_loop = 9 then
        week_61
            when l_fcast_loop = 10 then
        week_62
            when l_fcast_loop = 11 then
        week_63
            when l_fcast_loop = 12 then
        week_64
            when l_fcast_loop = 13 then
        week_65
            when l_fcast_loop = 14 then
        week_66
            when l_fcast_loop = 15 then
        week_67
            when l_fcast_loop = 16 then
        week_68
            when l_fcast_loop = 17 then
        week_69
            when l_fcast_loop = 18 then
        week_70
            when l_fcast_loop = 19 then
        week_71
            when l_fcast_loop = 20 then
        week_72
            when l_fcast_loop = 21 then
        week_73
            when l_fcast_loop = 22 then
        week_74
            when l_fcast_loop = 23 then
        week_75
            when l_fcast_loop = 24 then
        week_76
            when l_fcast_loop = 25 then
        week_77
            when l_fcast_loop = 26 then
        week_78
            when l_fcast_loop = 27 then
        week_79
            when l_fcast_loop = 28 then
        week_80
            when l_fcast_loop = 29 then
        week_81
            when l_fcast_loop = 30 then
        week_82
            when l_fcast_loop = 31 then
        week_83
            when l_fcast_loop = 32 then
        week_84
            when l_fcast_loop = 33 then
        week_85
            when l_fcast_loop = 34 then
        week_86
            when l_fcast_loop = 35 then
        week_87
            when l_fcast_loop = 36 then
        week_88
            when l_fcast_loop = 37 then
        week_89
            when l_fcast_loop = 38 then
        week_90
            when l_fcast_loop = 39 then
        week_91
            when l_fcast_loop = 40 then
        week_92
            when l_fcast_loop = 41 then
        week_93
            when l_fcast_loop = 42 then
        week_94
            when l_fcast_loop = 43 then
        week_95
            when l_fcast_loop = 44 then
        week_96
            when l_fcast_loop = 45 then
        week_97
            when l_fcast_loop = 46 then
        week_98
            when l_fcast_loop = 47 then
        week_99
            when l_fcast_loop = 48 then
        week_100
            when l_fcast_loop = 49 then
        week_101
            when l_fcast_loop = 50 then
        week_102
            when l_fcast_loop = 51 then
        week_103
            when l_fcast_loop = 52 then
        week_104 END
into l_qty_1
from mutl_sales_by_week
where item_id = P_ITEM_ID;

select case when l_fcast_loop = 1 then
        week_105
            when l_fcast_loop = 2 then
        week_106
            when l_fcast_loop = 3 then
        week_107
            when l_fcast_loop = 4 then
        week_108
            when l_fcast_loop = 5 then
        week_109
            when l_fcast_loop = 6 then
        week_110
            when l_fcast_loop = 7 then
        week_111
            when l_fcast_loop = 8 then
        week_112
            when l_fcast_loop = 9 then
        week_113
            when l_fcast_loop = 10 then
        week_114
            when l_fcast_loop = 11 then
        week_115
            when l_fcast_loop = 12 then
        week_116
            when l_fcast_loop = 13 then
        week_117
            when l_fcast_loop = 14 then
        week_118
            when l_fcast_loop = 15 then
        week_119
            when l_fcast_loop = 16 then
        week_120
            when l_fcast_loop = 17 then
        week_121
            when l_fcast_loop = 18 then
        week_122
            when l_fcast_loop = 19 then
        week_123
            when l_fcast_loop = 20 then
        week_124
            when l_fcast_loop = 21 then
        week_125
            when l_fcast_loop = 22 then
        week_126
            when l_fcast_loop = 23 then
        week_127
            when l_fcast_loop = 24 then
        week_128
            when l_fcast_loop = 25 then
        week_129
            when l_fcast_loop = 26 then
        week_130
            when l_fcast_loop = 27 then
        week_131
            when l_fcast_loop = 28 then
        week_132
            when l_fcast_loop = 29 then
        week_133
            when l_fcast_loop = 30 then
        week_134
            when l_fcast_loop = 31 then
        week_135
            when l_fcast_loop = 32 then
        week_136
            when l_fcast_loop = 33 then
        week_137
            when l_fcast_loop = 34 then
        week_138
            when l_fcast_loop = 35 then
        week_139
            when l_fcast_loop = 36 then
        week_140
            when l_fcast_loop = 37 then
        week_141
            when l_fcast_loop = 38 then
        week_142
            when l_fcast_loop = 39 then
        week_143
            when l_fcast_loop = 40 then
        week_144
            when l_fcast_loop = 41 then
        week_145
            when l_fcast_loop = 42 then
        week_146
            when l_fcast_loop = 43 then
        week_147
            when l_fcast_loop = 44 then
        week_148
            when l_fcast_loop = 45 then
        week_149
            when l_fcast_loop = 46 then
        week_150
            when l_fcast_loop = 47 then
        week_151
            when l_fcast_loop = 48 then
        week_152
            when l_fcast_loop = 49 then
        week_153
            when l_fcast_loop = 50 then
        week_154
            when l_fcast_loop = 51 then
        week_155
            when l_fcast_loop = 52 then
        week_156 END
into l_qty_2
from mutl_sales_by_week
where item_id = P_ITEM_ID;

l_a_prev := l_a_curr;   
l_t_prev := l_t_curr;   
l_final_s := ( ( l_qty_1 + l_qty_0 ) / ( l_sum_0 + l_sum_1 ) ) * l_season;


IF i = 1 THEN

l_a_curr :=  l_qty_2; 
l_t_curr := 0;

ELSE

l_a_curr :=  ( l_alpha * ( l_qty_1 / l_s1 ) ) + ( ( 1 - l_alpha ) * ( l_a_prev + l_t_prev) ); 


l_t_curr := ( l_beta * ( l_a_curr - l_a_prev ) ) + (( 1 - l_beta ) * l_t_prev);
END IF;


l_s1 := ( ( l_qty_2 + l_qty_1 ) / ( l_sum_1 + l_sum_2 ) ) * l_season;
l_forecast_qty := ( l_a_curr + ( l_t_curr * l_fcast_loop ) ) * l_final_s;


fcast_qty := (nvl(l_qty_2,0) + nvl(l_qty_2,0) + nvl(l_qty_1,0))/(case when l_qty_2 is null then 0 else 2 end + case when l_qty_1 is null then 0 else 1 end );


l_forecast_qty := (nvl(l_forecast_qty,0) + nvl(fcast_qty,0))/ (case when l_forecast_qty is null then 0 else 1 end + case when fcast_qty is null then 0 else 1 end );


end loop;




return(round(l_forecast_qty,2));

END IF;

exception when others then  
return null;
end exponential_forecast_one;
