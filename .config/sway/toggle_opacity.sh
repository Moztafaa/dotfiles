#!/bin/bash

# خلي jq هي اللي تقرر الحالة بناءً على قيمة الـ opacity الحالية
# لو القيمة 1 أو مش موجودة (null) هترجع كلمة "make_transparent"
# غير كده هترجع "make_opaque"
action=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | if (.opacity == 1 or .opacity == null) then "make_transparent" else "make_opaque" end')

if [ "$action" == "make_transparent" ]; then
	swaymsg opacity set 0.8
else
	swaymsg opacity set 1.0
fi
