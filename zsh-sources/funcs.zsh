paperctl() {
    local wall="$1"
    echo "$wall"

    local monis
    monis=$(hyprctl monitors -j | jq -r ".[] | .name")

    echo "$monis"

    hyprctl hyprpaper preload "$wall"
    echo "preload = $wall" > /home/koofte/.config/hypr/hyprpaper.conf

    echo "$monis" | while read -r mon; do
        echo "wallpaper = $mon,$wall" >> /home/koofte/.config/hypr/hyprpaper.conf
        hyprctl hyprpaper wallpaper "$mon,$wall"
        echo "Mon: $mon, Wall: $wall"
    done
}

ytsearch() {
  local query="$1"
  local count="${2:-10}"

  yt-dlp --flat-playlist --print "%(title)s |-| %(uploader)s |-| %(view_count)s |-| %(url)s" \
    "ytsearch${count}:${query}" | \
  fzf --ansi \
      --preview '
        IFS="|-|" read -r title uploader views url <<< "{}"
        yt-dlp --no-playlist --skip-download --print "
Title: %(title)s
Uploader: %(uploader)s
Likes: %(like_count)s
Dislikes: %(dislike_count)s
Views: %(view_count)s
Duration: %(duration)s
URL: %(webpage_url)s
        " "$url"
      ' --preview-window=up:10:wrap | \
  awk -F ' \\|-\\| ' '{print $4}' | \
  xargs -r -d '\n' mpv
}

mkcd() {
    mkdir "$1"
    cd "$1"
}

m() {
    echo $(( "$@" ))
}
