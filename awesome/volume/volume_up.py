import os, volume_widget, subprocess

os.system("amixer -D pulse sset Master 5%+ 1>/dev/null")

volume_widget.main()
