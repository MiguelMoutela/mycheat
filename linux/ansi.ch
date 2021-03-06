= ANSI:
== usage:  
  \033[**;**;**m       \033[0m

  For Example: echo -e '\033[31m hello \033[0m'
=== Ruby:
  puts "\e[33m string \e[0m"

==  All available setting:
   \033[1m   -   Change text to hicolor (bold) mode
   \033[4m   -      "    "   "  Underline
   \033[5m   -      "    "   "  Blink
   \033[8m   -      "    "   "  Hidden (same color as bg)
   \033[30m  -      "    "   "  Black
   \033[31m  -      "    "   "  Red
   \033[32m  -      "    "   "  Green
   \033[33m  -      "    "   "  Yellow
   \033[34m  -      "    "   "  Blue
   \033[35m  -      "    "   "  Magenta
   \033[36m  -      "    "   "  Cyan
   \033[37m  -      "    "   "  White
   \033[40m  -   Change background to Black
   \033[41m  -      "       "      "  Red
   \033[42m  -      "       "      "  Green
   \033[43m  -      "       "      "  Yellow
   \033[44m  -      "       "      "  Blue
   \033[45m  -      "       "      "  Magenta
   \033[46m  -      "       "      "  Cyan
   \033[47m  -      "       "      "  White
   \033[7m   -   Change to Black text on a White background
   \033[0m   -   Turn off all attributes.
