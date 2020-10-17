from os.path import expanduser
# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['nvim', '{file}']

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 
            'g': 'https://www.google.com/search?q={}', 
            'y': 'https://www.youtube.com/results?search_query={}', 
            'w': 'https://en.wikipedia.org/wiki/{}',
            'r': 'https://dle.rae.es/?w={}',
            'we': 'https://es.wikipedia.org/wiki/{}',
            'wd': 'https://de.wikipedia.org/wiki/{}',
            'a': 'https://wiki.archlinux.org/index.php?search={}',
            's': 'https://stackoverflow.com/search?q={}',
            'c': 'https://dictionary.cambridge.org/dictionary/english/{}'}

# Keep insert mode when page reloads
config.set("input.insert_mode.leave_on_load", False)

# Watch video in MPV
config.bind(",v", "hint links spawn mpv {hint-url}")

# Download torrents to movies folder
homeFolder = expanduser("~")
config.bind(",tm", "hint links spawn transmission-remote localhost -a \"{hint-url}\" -w " + homeFolder + "/movies")
# Download torrents to downloads folder
config.bind(",td", "hint links spawn transmission-remote localhost -a \"{hint-url}\" -w " + homeFolder + "/downloads")

# Enable dark mode
config.set("colors.webpage.darkmode.enabled", True)

# Load autoconfiguration (mainly for avoiding having to grant permission to things over and over)
config.load_autoconfig()
