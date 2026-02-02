export DISPLAY="${DISPLAY:-:0}"
# Configure the Joystick Interposer
export SELKIES_INTERPOSER='/usr/local/lib/selkies_joystick_interposer.so'
export LD_PRELOAD="${SELKIES_INTERPOSER}${LD_PRELOAD:+:${LD_PRELOAD}}"
export SDL_JOYSTICK_DEVICE=/dev/input/js0

mkdir -pm1777 /dev/input
touch /dev/input/js0 /dev/input/js1 /dev/input/js2 /dev/input/js3
chmod 777 /dev/input/js*

# Commented sections are optional but may be mandatory based on setup

# Start a virtual X11 server if not already running, skip this line if an X server already exists or you are already using a display
Xvfb "${DISPLAY}" -screen 0 1920x1080x24 +extension "COMPOSITE" +extension "DAMAGE" +extension "GLX" +extension "RANDR" +extension "RENDER" +extension "MIT-SHM" +extension "XFIXES" +extension "XTEST" +iglx +render -nolisten "tcp" -ac -noreset -shmem >/tmp/Xvfb_selkies.log 2>&1 &

# Wait for X server to start
echo 'Waiting for X Socket' && until [ -S "/tmp/.X11-unix/X${DISPLAY#*:}" ]; do sleep 0.5; done && echo 'X Server is ready'

# Choose one between PulseAudio and PipeWire if not already running, either one must be installed

# Initialize PulseAudio (set PULSE_SERVER to unix:/run/pulse/native if your user is in the pulse-access group and pulseaudio is triggered with sudo/root), omit the below lines if a PulseAudio server is already running
# export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
# export PULSE_RUNTIME_PATH="${PULSE_RUNTIME_PATH:-${XDG_RUNTIME_DIR:-/tmp}/pulse}"
# export PULSE_SERVER="${PULSE_SERVER:-unix:${PULSE_RUNTIME_PATH:-${XDG_RUNTIME_DIR:-/tmp}/pulse}/native}"
# /usr/bin/pulseaudio -k >/dev/null 2>&1 || true
# /usr/bin/pulseaudio --verbose --log-target=file:/tmp/pulseaudio_selkies.log --disallow-exit &

# Initialize PipeWire
export PIPEWIRE_LATENCY="128/48000"
export DISABLE_RTKIT="y"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
export PIPEWIRE_RUNTIME_DIR="${PIPEWIRE_RUNTIME_DIR:-${XDG_RUNTIME_DIR:-/tmp}}"
export PULSE_RUNTIME_PATH="${PULSE_RUNTIME_PATH:-${XDG_RUNTIME_DIR:-/tmp}/pulse}"
export PULSE_SERVER="${PULSE_SERVER:-unix:${PULSE_RUNTIME_PATH:-${XDG_RUNTIME_DIR:-/tmp}/pulse}/native}"
pipewire &
wireplumber &
pipewire-pulse &

# Replace this line with your desktop environment session or skip this line if already running, use VirtualGL `vglrun +wm xfce4-session` here if needed
[ "${START_XFCE4:-true}" = "true" ] && rm -rf ~/.config/xfce4 && xfce4-session &

# Initialize the GStreamer environment after setting GSTREAMER_PATH to the path of your GStreamer directory
#export GST_DEBUG="*:2"
#export GSTREAMER_PATH=/opt/gstreamer
#. /opt/gstreamer/gst-env
# Replace with your wanted resolution if using without resize, DO NOT USE if there is a physical display
# selkies-gstreamer-resize 1920x1080

# Starts the remote desktop process
# Change `--encoder=` to `nvh264enc`, `vah264enc`, `vp9enc`, or `vp8enc` for different video codecs or hardware encoders
# DO NOT set `--enable_resize=true` if there is a physical display
selkies-gstreamer \
    --addr=0.0.0.0 --port=8080 \
    --enable_https=false \
    --basic_auth_user=user --basic_auth_password=mypasswd \
    --encoder=x264enc \
    --enable_resize=false